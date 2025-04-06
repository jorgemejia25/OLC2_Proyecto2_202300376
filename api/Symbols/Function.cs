using System.Collections.Generic;
using analyzer;
using api.Common;
using Antlr4.Runtime.Tree;
using Symbols;

public class Function
{
    // Nombre de la función
    public string Name { get; }
    // Cambiar el Dictionary por una lista para mantener el orden
    public List<KeyValuePair<string, DataType.Type>> Parameters { get; }
        = new List<KeyValuePair<string, DataType.Type>>();

    // Tipo de retorno de la función
    public DataType.Type? ReturnType { get; set; }

    // Referencia a las instrucciones del cuerpo de la función (ej. nodos del AST)
    public IParseTree Body { get; set; }

    // Referencia a un Struct
    public StructDefinition? StructReference { get; set; }

    // Nombre de referencia al Struct
    public string StructName { get; set; }

    // Mantener el diccionario para búsquedas por nombre
    private Dictionary<string, DataType.Type> _parameterLookup = new Dictionary<string, DataType.Type>();

    // Constructor
    public Function(string name, IParseTree body, DataType.Type? returnType = null, StructDefinition? structReference = null, string structName = "")
    {
        Name = name;
        Body = body;
        ReturnType = returnType;
        StructReference = structReference;
        StructName = structName;
    }

    // Modificar el método AddParameter
    public void AddParameter(string name, DataType.Type type)
    {
        Parameters.Add(new KeyValuePair<string, DataType.Type>(name, type));
        _parameterLookup[name] = type;
    }

    // Verificar si la función tiene un parámetro con el nombre dado
    public bool HasParameter(string name) => _parameterLookup.ContainsKey(name);

    // Obtener el tipo de un parámetro de la función
    public DataType.Type GetParameterType(string name) => _parameterLookup[name];

}
