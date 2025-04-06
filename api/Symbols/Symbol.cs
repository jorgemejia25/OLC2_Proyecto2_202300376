using Symbols;

public class Symbol
{
    public string Name { get; set; }
    public string ScopeName { get; set; }  // Nombre del entorno (ej: "if1", "if2", etc.)
    public string FullName => $"{ScopeName}_{Name}";  // Nombre completo incluyendo entorno
    public object Value { get; set; }
    public DataType.Type Type { get; set; }
    public int Line { get; set; }
    public int Column { get; set; }

    public Symbol(string name, DataType.Type type, string scopeName, object? value = null, int line = 0, int column = 0)
    {
        Name = name;
        ScopeName = scopeName;
        Type = type;
        Value = value ?? GetDefaultValue(type);
        Line = line;
        Column = column;
    }

    private object GetDefaultValue(DataType.Type type)
    {
        return type switch
        {
            DataType.Type.Int => 0,
            DataType.Type.Float => 0.0,
            DataType.Type.String => "",
            DataType.Type.Bool => false,
            DataType.Type.Rune => '\0',
            _ => null!,
        };
    }
}