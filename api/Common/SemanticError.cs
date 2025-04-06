using Antlr4.Runtime;
using System;

namespace api.Common
{
    public class SemanticError : Exception
    {
        private readonly string _message;
        private readonly IToken _token;

        public SemanticError(string message, IToken token) : base(message)
        {
            _message = message;
            _token = token;
        }

        public override string Message => GetMessage();

        public string GetMessage()
        {
            if (_token == null)
            {
                return _message;
            }
            return $"{_message} en la línea {_token.Line}, columna {_token.Column}";
        }

        // Agregar método para acceder al token
        public IToken GetToken()
        {
            return _token;
        }
    }
}
