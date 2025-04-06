using analyzer;
using Symbols;

/// <summary>
/// Visitor para manejar las declaraciones y llamadas de funciones en GoLang.
/// </summary>
class FunctionVisitor : GoLangBaseVisitor<ValueWrapper>
{
    private readonly Environment _environment;
    private readonly ExpressionVisitor _expressionVisitor;
    private readonly SemanticVisitor _mainVisitor;
    private readonly TypeVisitor _typeVisitor;

    /// <summary>
    /// Constructor para inicializar el visitor de funciones.
    /// </summary>
    /// <param name="environment">El entorno de ejecución.</param>
    /// <param name="expressionVisitor">El visitor de expresiones.</param>
    /// <param name="mainVisitor">El visitor principal.</param>
    public FunctionVisitor(Environment environment, ExpressionVisitor expressionVisitor, SemanticVisitor mainVisitor)
    {
        _environment = environment;
        _expressionVisitor = expressionVisitor;
        _mainVisitor = mainVisitor;
        _typeVisitor = new TypeVisitor(environment);
    }

    /// <summary>
    /// Visita una declaración de función.
    /// </summary>
    /// <param name="context">El contexto de la declaración de función.</param>
    /// <returns>Un envoltorio de valor.</returns>
    public override ValueWrapper VisitFuncDeclaration(GoLangParser.FuncDeclarationContext context)
    {
        // Check if struct reference is present

        string functionName = context.ID().GetText();

        // Get return type if specified
        DataType.Type? returnType = null;
        if (context.type() != null)
        {
            returnType = _typeVisitor.Visit(context.type());
        }

        Function function = new(functionName, context.block(), returnType, null, "");

        // Get function parameters
        var funcParams = context.funcParams();

        if (funcParams != null)
        {
            foreach (var param in funcParams.funcParam())
            {
                string paramName = param.ID().GetText();
                DataType.Type paramType = _typeVisitor.Visit(param.type());
                function.AddParameter(paramName, paramType);
            }
        }


        if (function.Name == "main")
        {
            _environment.MainFunction = function;

            return ValueWrapper.Nil;
        }

        _environment.DeclareFunction(function, context.Start);

        return ValueWrapper.Nil;
    }

    /// <summary>
    /// Visita una invocación literal de función.
    /// </summary>
    /// <param name="context">El contexto de la invocación literal.</param>
    /// <returns>Un envoltorio de valor.</returns>
    public override ValueWrapper VisitInvokeLiteral(GoLangParser.InvokeLiteralContext context)
    {
        Console.WriteLine("VisitInvokeLiteral");

        string functionName = context.invoke().ID().GetText();
        Function function = _environment.GetFunction(functionName, context.Start)!;

        var argsContext = context.invoke().invokeParams();
        List<ValueWrapper> args = new List<ValueWrapper>();

        // Verificación estricta de cantidad de parámetros
        int expectedArgs = function.Parameters.Count;
        int receivedArgs = argsContext?.expr().Length ?? 0;

        if (receivedArgs != expectedArgs)
        {
            throw new SemanticError(
                $"Función '{functionName}' requiere {expectedArgs} parámetros pero se proporcionaron {receivedArgs}",
                context.Start
            );
        }

        // Obtener los tipos de los parámetros en orden
        var paramTypes = function.Parameters.Select(p => p.Value).ToList();

        if (argsContext != null)
        {
            for (int i = 0; i < argsContext.expr().Length; i++)
            {
                var exprContext = argsContext.expr(i);
                var expr = _expressionVisitor.Visit(exprContext);
                DataType.Type argType = expr.Type;

                // Obtener el tipo del parámetro correspondiente
                DataType.Type paramType = paramTypes[i];

                // Verificar compatibilidad de tipos
                if (argType != paramType)
                {
                    throw new SemanticError(
                        $"Tipo incorrecto para el argumento {i + 1} en {functionName}. Esperado {paramType}, obtenido {argType}",
                        exprContext.Start
                    );
                }

                args.Add(expr);
            }
        }
        // Push scope
        _environment.PushScope(functionName);

        // Declare parameters
        for (int i = 0; i < function.Parameters.Count; i++)
        {
            var param = function.Parameters.ElementAt(i);
            _environment.DeclareVariable(param.Key, args[i], context.Start);
        }

        // Reset control flow before executing function body
        _mainVisitor.GetControlFlow().Reset();
        var result = _mainVisitor.Visit(function.Body);

        // Verificar si el return fue capturado
        if (_mainVisitor.GetControlFlow().ShouldReturn)
        {
            result = _mainVisitor.GetControlFlow().ReturnValue;

            // IMPORTANT: Reset the control flow after capturing the return value
            // to prevent the return from propagating beyond this function call
            _mainVisitor.GetControlFlow().Reset();
        }

        if (!result.IsNil)
        {
            if (function.ReturnType == null)
            {
                throw new SemanticError(
                    $"Función {functionName} no tiene tipo de retorno",
                    context.Start
                );
            }

            // Verificar si el tipo de retorno es compatible
            if (function.ReturnType != null && result.Type != function.ReturnType)
            {
                throw new SemanticError(
                    $"Tipo incorrecto para el retorno de {functionName}. Esperado {function.ReturnType}, obtenido {result.Type}",
                    context.Start
                );
            }
        }

        if (result.IsNil && function.ReturnType != null)
        {
            throw new SemanticError(
                $"Función {functionName} no retorna un valor",
                context.Start
            );
        }

        _environment.PopScope();
        return result;
    }

    /// <summary>
    /// Visita una invocación de método.
    /// </summary>
    /// <param name="context">El contexto de la invocación de método.</param>
    /// <returns>Un envoltorio de valor.</returns>
    public override ValueWrapper VisitInvokeMethod(GoLangParser.InvokeMethodContext context)
    {
        Console.WriteLine("VisitInvokeMethod");

        string referenceId = context.ID(0).GetText();

        // Get the struct value in the environment
        ValueWrapper? structValue = _environment.GetVariable(referenceId);
        if (structValue == null)
        {
            throw new SemanticError($"Variable '{referenceId}' no definida", context.Start);
        }

        // if structValue is not a struct, throw an error
        if (structValue.Type != DataType.Type.Struct)
        {
            throw new SemanticError($"Variable '{referenceId}' no es un struct", context.Start);
        }

        // Get the struct definition
        String structReferenceName = structValue.StructTypeName;

        StructDefinition structDefinition = _environment.GetStructDefinition(structReferenceName) ?? throw new SemanticError($"Tipo de struct '{structReferenceName}' no definido", context.Start);

        // Get the method name
        string methodName = context.ID(1).GetText();

        // if the method does not exist, throw an error
        if (!structDefinition.Functions.ContainsKey(methodName))
        {
            throw new SemanticError($"Método '{methodName}' no definido en el struct '{structReferenceName}'", context.Start);
        }

        // Get the method from the struct definition
        Function method = structDefinition.Functions[methodName];

        // Verify if the method exists
        if (method == null)
        {
            throw new SemanticError($"Método '{methodName}' no definido en el struct '{structReferenceName}'", context.Start);
        }

        // Get the method parameters
        var methodParams = context.invokeParams();

        // Get the method parameters types
        var methodParamsTypes = method.Parameters.Select(p => p.Value).ToList();

        // Get the method parameters values
        List<ValueWrapper> methodParamsValues = new List<ValueWrapper>();

        if (methodParams != null)
        {
            for (int i = 0; i < methodParams.expr().Length; i++)
            {
                var exprContext = methodParams.expr(i);
                var expr = _expressionVisitor.Visit(exprContext);
                methodParamsValues.Add(expr);
            }
        }

        // Push scope
        _environment.PushScope(methodName);

        // Declare parameters
        for (int i = 0; i < method.Parameters.Count; i++)
        {
            var param = method.Parameters.ElementAt(i);
            _environment.DeclareVariable(param.Key, methodParamsValues[i], context.Start);
        }

        // Get the struct reference function name
        string structReferenceFunctionName = method.StructName;

        Console.WriteLine($"Nombre de referencia: {structReferenceFunctionName}");

        // Igualar el nombre de la función con el nombre de la referencia del struct
        _environment.DeclareVariable(structReferenceFunctionName, structValue, context.Start);

        if (!structDefinition.Functions.ContainsKey(methodName))
        {
            throw new SemanticError($"Método '{methodName}' no definido en el struct '{structReferenceName}'", context.Start);
        }

        // Reset control flow before visiting method body
        _mainVisitor.GetControlFlow().Reset();

        // Visit the method body
        var result = _mainVisitor.Visit(method.Body);

        // If there was a return, capture its value and reset the control flow
        if (_mainVisitor.GetControlFlow().ShouldReturn)
        {
            result = _mainVisitor.GetControlFlow().ReturnValue;

            // Reset the control flow after capturing the return value
            _mainVisitor.GetControlFlow().Reset();
        }

        // Pop scope
        _environment.PopScope();

        // Return the result
        return result;
    }
}


