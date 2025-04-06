namespace api.Common;

public class BreakException : Exception
{
    public BreakException() : base("Break statement encountered") { }
}
