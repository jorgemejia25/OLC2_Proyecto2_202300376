using System;
using analyzer;
using Symbols;
using System.Text;
using System.Collections.Generic;

/// <summary>
/// Visitor para manejar la impresión en el lenguaje GoLang.
/// </summary>
class PrintVisitor : GoLangBaseVisitor<ValueWrapper>
{
    private readonly ExpressionVisitor _expressionVisitor;
    private SemanticVisitor _mainVisitor;
    public StringBuilder ConsoleOutput { get; private set; }

    /// <summary>
    /// Constructor de la clase PrintVisitor.
    /// </summary>
    /// <param name="expressionVisitor">Visitor de expresiones.</param>
    public PrintVisitor(ExpressionVisitor expressionVisitor)
    {
        _mainVisitor = null!;
        _expressionVisitor = expressionVisitor;
        ConsoleOutput = new StringBuilder();
    }

    public void SetMainVisitor(SemanticVisitor mainVisitor)
    {
        _mainVisitor = mainVisitor;
    }

    /// <summary>
    /// Visita una declaración de impresión.
    /// </summary>
    /// <param name="context">El contexto de la declaración de impresión.</param>
    /// <returns>El resultado de la impresión.</returns>
    public override ValueWrapper VisitPrintStatement(GoLangParser.PrintStatementContext context)
    {
        var valueWrapper = _expressionVisitor.Visit(context.expr());
        string displayValue = GetDisplayString(valueWrapper);
        AddToConsoleOutput(displayValue + "\n");
        return ValueWrapper.Nil;
    }

    private void AddToConsoleOutput(string text)
    {
        if (_mainVisitor != null)
        {
            _mainVisitor.AppendToConsoleOutput(text);
        }
        else
        {
            // Log de fallback en caso de que mainVisitor sea nulo
            Console.WriteLine($"PrintVisitor: {text}");
        }
    }

    private string GetDisplayString(ValueWrapper valueWrapper)
    {
        if (valueWrapper.IsNil)
            return "nil";

        // Handle SliceRowWrapper (2D slice rows)
        if (valueWrapper.Value is ExpressionVisitor.SliceRowWrapper rowWrapper)
        {
            var elements = new List<string>();
            for (int i = 0; i < rowWrapper.Length; i++)
            {
                var element = rowWrapper.GetValue(i);
                elements.Add(element?.ToString() ?? "nil");
            }
            return $"[{string.Join(" ", elements)}]";
        }

        if (valueWrapper.Type == DataType.Type.Struct)
        {
            var props = (Dictionary<string, ValueWrapper>)valueWrapper.Value;
            var structName = valueWrapper.StructTypeName;
            var entries = props.Select(kvp => $"{kvp.Key}: {GetDisplayString(kvp.Value)}");
            return $"{structName}{{{string.Join(", ", entries)}}}";
        }
        else if (valueWrapper.Type == DataType.Type.Slice1D || valueWrapper.Type == DataType.Type.Slice2D)
        {
            if (valueWrapper.Value is Array arr)
            {
                // Handle jagged arrays (2D slices)
                if (arr.Length > 0 && arr.GetValue(0) is Array)
                {
                    var rows = new List<string>();
                    foreach (Array row in arr)
                    {
                        var elements = new List<string>();
                        for (int i = 0; i < row.Length; i++)
                        {
                            elements.Add(row.GetValue(i)?.ToString() ?? "nil");
                        }
                        rows.Add($"[{string.Join(" ", elements)}]");
                    }
                    return $"[{string.Join(" ", rows)}]";
                }

                // Handle 1D slices and multidimensional arrays
                if (arr.Rank == 1)
                {
                    var elements = new List<string>();
                    for (int i = 0; i < arr.Length; i++)
                    {
                        elements.Add(arr.GetValue(i)?.ToString() ?? "nil");
                    }
                    return $"[{string.Join(" ", elements)}]";
                }
                else if (arr.Rank == 2)
                {
                    var rows = new List<string>();
                    int rowCount = arr.GetLength(0);
                    int colCount = arr.GetLength(1);
                    for (int i = 0; i < rowCount; i++)
                    {
                        var elements = new List<string>();
                        for (int j = 0; j < colCount; j++)
                        {
                            elements.Add(arr.GetValue(i, j)?.ToString() ?? "nil");
                        }
                        rows.Add($"[{string.Join(" ", elements)}]");
                    }
                    return $"[{string.Join(" ", rows)}]";
                }
            }
        }

        return valueWrapper.Value?.ToString() ?? "nil";
    }
}
