using Antlr4.Runtime;
using Antlr4.Runtime.Misc;

public class SemanticError : Exception
{
    private string message;

    public IToken Token { get; private set; }

    public SemanticError(string message, IToken token)
    {
        this.message = message;
        this.Token = token;
    }

    public string GetMessage()
    {
        if (Token == null)
        {
            return message; // Simplemente retornar el mensaje sin información de línea/columna
        }
        else
        {
            return $"{message} en la línea {Token.Line}, columna {Token.Column}";
        }
    }

    public override string Message => GetMessage();
}

public class DescriptiveErrorListener : BaseErrorListener, IAntlrErrorListener<int>
{
    public void SyntaxError(
        TextWriter output, IRecognizer recognizer, int offendingSymbol, int line, int charPositionInLine, string msg, RecognitionException e)
    {
        Console.WriteLine($"Error léxico en la línea {line}, columna {charPositionInLine}: {msg}");
        throw new ParseCanceledException($"Error léxico en la línea {line}, columna {charPositionInLine}: {msg}");
    }
}

public class SyntaxErrorListener : BaseErrorListener
{
    public override void SyntaxError(TextWriter output, IRecognizer recognizer, IToken offendingSymbol, int line, int charPositionInLine, string msg, RecognitionException e)
    {
        throw new ParseCanceledException($"Error sintáctico en la línea {line}, columna {charPositionInLine}: {msg}");
    }
}