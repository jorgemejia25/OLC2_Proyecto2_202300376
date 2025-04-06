namespace Symbols;

public enum ErrorType
{
    Lexico,
    Sintactico,
    Semantico
}

public class Error
{
    private ErrorType type;
    public ErrorType Type
    {
        get => type;
        set => type = value;
    }

    // Propiedad adicional que convierte el enum a string
    public string TypeString => Type.ToString();

    public required string Message { get; set; }
    public int Line { get; set; }
    public int Column { get; set; }
}
