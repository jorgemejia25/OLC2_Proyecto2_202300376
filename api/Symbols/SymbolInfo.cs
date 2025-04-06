using Symbols;

namespace api.Symbols
{
    /// <summary>
    /// Representa la información de un símbolo en la tabla de símbolos.
    /// </summary>
    public class SymbolInfo
    {
        /// <summary>
        /// Nombre del símbolo.
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// Tipo del símbolo.
        /// </summary>
        public string Type { get; set; }

        /// <summary>
        /// Valor como cadena del símbolo.
        /// </summary>
        public string Value { get; set; }

        /// <summary>
        /// Ámbito donde se declaró el símbolo.
        /// </summary>
        public string Scope { get; set; }

        /// <summary>
        /// Línea donde se declaró el símbolo.
        /// </summary>
        public int Line { get; set; }

        /// <summary>
        /// Columna donde se declaró el símbolo.
        /// </summary>
        public int Column { get; set; }

        /// <summary>
        /// Indica si el símbolo es constante.
        /// </summary>
        public bool IsConstant { get; set; }

        /// <summary>
        /// Categoría del símbolo (Variable, Función, Struct, etc.)
        /// </summary>
        public string Category { get; set; }
    }
}
