
using System.Collections.Generic;

namespace Symbols
{
    public sealed class SymbolTableReport
    {
        private static readonly SymbolTableReport _instance = new SymbolTableReport();
        private readonly List<SymbolInfo> _symbols = new List<SymbolInfo>();

        public static SymbolTableReport Instance => _instance;

        public void AddSymbol(string id, string tipoSimbolo, string tipoDato, string entorno, int linea, int columna)
        {
            _symbols.Add(new SymbolInfo
            {
                ID = id,
                TipoSimbolo = tipoSimbolo,
                TipoDato = tipoDato,
                Entorno = entorno,
                Linea = linea,
                Columna = columna
            });
        }

        public void UpdateSymbol(string id, string entorno, string newTipo, int newLine, int newColumn)
        {
            var symbol = _symbols.Find(s => s.ID == id && s.Entorno == entorno);
            if (symbol != null)
            {
                symbol.TipoDato = newTipo;
                symbol.Linea = newLine;
                symbol.Columna = newColumn;
            }
        }

        public void ClearSymbols() => _symbols.Clear();

        public IEnumerable<SymbolInfo> GetSymbols() => _symbols;
    }

    public class SymbolInfo
    {
        public required string ID { get; set; }

        public required string TipoSimbolo { get; set; }

        public required string Entorno { get; set; }
        public required string TipoDato { get; set; }
        public int Linea { get; set; }
        public int Columna { get; set; }
    }
}
