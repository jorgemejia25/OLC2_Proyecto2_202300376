using api.Common;
using Symbols;
using System.Collections.Generic;

public class Environment
{
    private readonly Stack<Dictionary<string, ValueWrapper>> _scopes;
    private readonly Stack<string> _scopeNames;
    private int _loopLevel = 0;  // Contador de niveles de ciclo
    private int _switchLevel = 0; // Contador de niveles de switch
    private readonly Dictionary<string, StructDefinition> _structs = new Dictionary<string, StructDefinition>();

    private readonly Dictionary<string, Function> _functions = new Dictionary<string, Function>();

    public Function MainFunction { get; set; }


    public Environment()
    {
        _scopes = new Stack<Dictionary<string, ValueWrapper>>();
        _scopeNames = new Stack<string>();
        // Crear ámbito global
        PushScope("global");
    }

    public void PushScope(string scopePrefix)
    {
        string scopeName = Scope.GenerateScopeName(scopePrefix);
        _scopes.Push(new Dictionary<string, ValueWrapper>());
        _scopeNames.Push(scopeName);
    }

    public void PopScope()
    {
        if (_scopes.Count > 1) // Mantener al menos el ámbito global
        {
            _scopes.Pop();
            _scopeNames.Pop();
        }
    }

    public void EnterLoop()
    {
        _loopLevel++;
    }

    public void ExitLoop()
    {
        _loopLevel--;
    }

    public bool IsInsideLoop()
    {
        return _loopLevel > 0;
    }

    // Nuevos métodos para switch
    public void EnterSwitch()
    {
        _switchLevel++;
    }

    public void ExitSwitch()
    {
        _switchLevel--;
    }

    public bool IsInsideSwitch()
    {
        return _switchLevel > 0;
    }

    public void DeclareVariable(string name, ValueWrapper value, Antlr4.Runtime.IToken token)
    {
        var currentScope = _scopes.Peek();
        string currentScopeName = _scopeNames.Peek();

        if (currentScope.ContainsKey(name))
        {
            throw new SemanticError($"Variable '{name}' ya declarada", token);
        }

        value.ScopeName = currentScopeName;
        currentScope[name] = value;

        int line = token == null ? -1 : token.Line;
        int column = token == null ? -1 : token.Column;

        SymbolTableReport.Instance.AddSymbol(name, "Variable", value.Type.ToString(), currentScopeName, line, column);
    }

    public ValueWrapper? GetVariable(string name)
    {
        foreach (var scope in _scopes)
        {
            if (scope.TryGetValue(name, out ValueWrapper? value))
            {
                return value;
            }
        }
        return null;
    }

    public void SetVariable(string name, ValueWrapper newValue, Antlr4.Runtime.IToken token)
    {
        foreach (var scope in _scopes)
        {
            if (scope.ContainsKey(name))
            {
                var existingValue = scope[name];
                if (existingValue.IsConstant)
                {
                    throw new SemanticError($"Variable '{name}' es constante", token);
                }

                // Actualizar directamente el valor en el scope
                scope[name] = newValue;
                return;
            }
        }

        throw new SemanticError($"Variable '{name}' no está definida", token);
    }

    // Agregar método público para verificar variables en el scope actual
    public bool IsVariableInCurrentScope(string name)
    {
        if (_scopes.Count == 0) return false;
        return _scopes.Peek().ContainsKey(name);
    }

    public bool VariableExists(string name)
    {
        foreach (var scope in _scopes)
        {
            if (scope.ContainsKey(name))
            {
                return true;
            }
        }
        return false;
    }

    public void AddStructDefinition(StructDefinition structDef, Antlr4.Runtime.IToken token)
    {
        if (!_structs.ContainsKey(structDef.Name))
        {
            _structs[structDef.Name] = structDef;
        }
        else
        {
            throw new SemanticError($"Estructura '{structDef.Name}' ya definida", token);
        }
    }

    public StructDefinition? GetStructDefinition(string name)
    {
        if (_structs.TryGetValue(name, out var structDef))
        {
            return structDef;
        }

        // Buscar en scopes padres si es necesario
        foreach (var scope in _scopes.Reverse())
        {
            foreach (var item in scope.Values)
            {
                if (item.Type == DataType.Type.Struct &&
                   ((StructInstance)item.Value).StructName == name)
                {
                    return _structs[name];
                }
            }
        }

        return null;
    }

    public void DeclareFunction(Function function, Antlr4.Runtime.IToken token)
    {
        if (_functions.ContainsKey(function.Name))
        {
            throw new SemanticError($"Función '{function.Name}' ya declarada", token);
        }
        _functions[function.Name] = function;

        string returnType = "void";

        if (function.ReturnType != null)
        {
            returnType = function.ReturnType.ToString()!;
        }


        SymbolTableReport.Instance.AddSymbol(function.Name, "Función", returnType, "global", token.Line, token.Column);
    }

    public Function? GetFunction(string name, Antlr4.Runtime.IToken token)
    {
        _functions.TryGetValue(name, out var function);

        if (function == null)
        {
            throw new SemanticError($"Función '{name}' no definida", token);
        }


        return function;
    }

    /// <summary>
    /// Obtiene el número de funciones registradas.
    /// </summary>
    /// <returns>Cantidad de funciones registradas.</returns>
    public int GetFunctionCount()
    {
        return _functions.Count;
    }

    /// <summary>
    /// Obtiene la lista de nombres de funciones registradas.
    /// </summary>
    /// <returns>Lista de nombres de funciones.</returns>
    public List<string> GetFunctionNames()
    {
        return new List<string>(_functions.Keys);
    }

    /// <summary>
    /// Obtiene el número de estructuras registradas.
    /// </summary>
    /// <returns>Cantidad de estructuras registradas.</returns>
    public int GetStructCount()
    {
        return _structs.Count;
    }

    /// <summary>
    /// Obtiene la lista de nombres de estructuras registradas.
    /// </summary>
    /// <returns>Lista de nombres de estructuras.</returns>
    public List<string> GetStructNames()
    {
        return new List<string>(_structs.Keys);
    }

    /// <summary>
    /// Verifica si una función existe en el entorno.
    /// </summary>
    /// <param name="name">Nombre de la función a verificar.</param>
    /// <returns>True si la función existe, False en caso contrario.</returns>
    public bool FunctionExists(string name)
    {
        return _functions.ContainsKey(name);
    }
}