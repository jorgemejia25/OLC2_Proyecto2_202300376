using System;
using Symbols;
using analyzer;
using api.Common;
using Antlr4.Runtime.Tree;
using Antlr4.Runtime;

/// <summary>
/// Visitor para manejar expresiones aritméticas en el lenguaje GoLang.
/// </summary>
public class ExpressionVisitor : GoLangBaseVisitor<ValueWrapper>  // Agregar 'public'
{
    private readonly Environment _environment;
    private readonly BuiltInFunctionsVisitor _builtInFunctionsVisitor; // Agregar BuiltInFunctionsVisitor
    private readonly SemanticVisitor _mainVisitor; // Agregar MainVisitor

    /// <summary>
    /// Constructor de la clase ExpressionVisitor.
    /// </summary>
    /// <param name="environment">Entorno compartido de variables.</param>
    public ExpressionVisitor(Environment environment, SemanticVisitor mainVisitor)
    {
        _environment = environment;
        _builtInFunctionsVisitor = new BuiltInFunctionsVisitor(environment, this); // Inicializar BuiltInFunctionsVisitor
        _mainVisitor = mainVisitor; // Inicializar MainVisitor
    }

    /// <summary>
    /// Visita una expresión de suma o resta.
    /// </summary>
    /// <param name="context">El contexto de la expresión de suma o resta.</param>
    /// <returns>El resultado de la operación.</returns>
    public override ValueWrapper VisitAddSub(GoLangParser.AddSubContext context)
    {
        var left = Visit(context.expr(0));
        var right = Visit(context.expr(1));
        var op = context.GetChild(1).GetText();

        if (left.IsNil || right.IsNil)
        {

            throw new SemanticError("No se pueden realizar operaciones con valores nulos", context.Start);
        }


        // Manejo de strings (solo para suma)
        if (left.Type == DataType.Type.String && right.Type == DataType.Type.String)
        {
            if (op == "+")
            {
                return new ValueWrapper(
                    (string)left.Value + (string)right.Value,
                    DataType.Type.String
                );
            }

            throw new SemanticError("Operación aritmética inválida: los operandos deben ser números", context.Start);
        }

        // Operaciones numéricas
        if (!IsNumeric(left.Value) || !IsNumeric(right.Value))
        {
            throw new SemanticError("Operación aritmética inválida: los operandos deben ser números", context.Start);
        }

        double leftNum = Convert.ToDouble(left.Value);
        double rightNum = Convert.ToDouble(right.Value);
        double result = op == "+" ? leftNum + rightNum : leftNum - rightNum;

        var resultType = (left.Type == DataType.Type.Float || right.Type == DataType.Type.Float)
            ? DataType.Type.Float
            : DataType.Type.Int;

        object finalValue = resultType == DataType.Type.Int ? (int)result : result;
        return new ValueWrapper(finalValue, resultType);
    }

    /// <summary>
    /// Convierte un valor a número.
    /// </summary>
    /// <param name="value">El valor a convertir.</param>
    /// <param name="line">Línea del token.</param>
    /// <param name="column">Columna del token.</param>
    /// <param name="token">El token.</param>
    /// <returns>El valor convertido a número.</returns>
    private object ConvertToNumber(object value, int line, int column, Antlr4.Runtime.IToken token)
    {
        if (value is int) return value;
        if (value is double) return value;
        if (value is float) return Convert.ToDouble(value); // Asegurar conversión a double
        if (value is Single) return Convert.ToDouble(value); // Manejar explícitamente Single

        throw new SemanticError("Valor no numérico", token);
    }

    /// <summary>
    /// Visita una expresión de multiplicación o división.
    /// </summary>
    /// <param name="context">El contexto de la expresión de multiplicación o división.</param>
    /// <returns>El resultado de la operación.</returns>
    public override ValueWrapper VisitMulDiv(GoLangParser.MulDivContext context)
    {
        var left = Visit(context.expr(0));
        var right = Visit(context.expr(1));
        var op = context.GetChild(1).GetText();

        if (left.IsNil || right.IsNil)
        {
            throw new SemanticError("No se pueden realizar operaciones con valores nulos", context.Start);
        }

        // Si es operador módulo, solo permitir entre enteros
        if (op == "%")
        {
            if (left.Type != DataType.Type.Int || right.Type != DataType.Type.Int)
            {
                throw new SemanticError("Operador de módulo solo permitido entre enteros", context.Start);
            }
            var moduloResult = (int)left.Value % (int)right.Value;
            return new ValueWrapper(moduloResult, DataType.Type.Int);
        }

        // Para multiplicación y división
        if (!IsNumeric(left.Value) || !IsNumeric(right.Value))
        {
            throw new SemanticError("Operación aritmética inválida: los operandos deben ser números", context.Start);
        }

        // Verificar división por cero
        if (op == "/" && Convert.ToDouble(right.Value) == 0)
        {
            throw new SemanticError("División por cero", context.Start);
        }

        double leftNum = Convert.ToDouble(left.Value);
        double rightNum = Convert.ToDouble(right.Value);
        double operationResult;

        switch (op)
        {
            case "*":
                operationResult = leftNum * rightNum;
                break;
            case "/":
                operationResult = leftNum / rightNum;
                break;
            default:
                return ValueWrapper.Nil;
        }

        // Determinar el tipo de retorno
        var resultType = (left.Type == DataType.Type.Float || right.Type == DataType.Type.Float)
            ? DataType.Type.Float
            : DataType.Type.Int;

        object finalValue = resultType == DataType.Type.Int ? (int)operationResult : operationResult;
        return new ValueWrapper(finalValue, resultType);
    }

    /// <summary>
    /// Verifica si un valor es numérico.
    /// </summary>
    /// <param name="value">El valor a verificar.</param>
    /// <returns>True si el valor es numérico, de lo contrario false.</returns>
    private bool IsNumeric(object value)
    {
        return value is int || value is double || value is float || value is decimal;
    }

    /// <summary>
    /// Visita un número entero.
    /// </summary>
    /// <param name="context">El contexto del número entero.</param>
    /// <returns>El valor del número entero.</returns>
    public override ValueWrapper VisitNumber(GoLangParser.NumberContext context)
    {
        try
        {
            int value = int.Parse(context.INT().GetText());
            return new ValueWrapper(value, DataType.Type.Int);
        }
        catch
        {
            throw new SemanticError("Número entero inválido", context.Start);
        }
    }

    /// <summary>
    /// Visita un número flotante.
    /// </summary>
    /// <param name="context">El contexto del número flotante.</param>
    /// <returns>El valor del número flotante.</returns>
    public override ValueWrapper VisitFloat(GoLangParser.FloatContext context)
    {
        try
        {
            // Cambiar a double en lugar de float
            double value = double.Parse(context.FLOAT().GetText());
            return new ValueWrapper(value, DataType.Type.Float);
        }
        catch
        {
            throw new SemanticError("Número flotante inválido", context.Start);
        }
    }

    /// <summary>
    /// Visita una expresión entre paréntesis.
    /// </summary>
    /// <param name="context">El contexto de la expresión entre paréntesis.</param>
    /// <returns>El resultado de la expresión.</returns>
    public override ValueWrapper VisitParens(GoLangParser.ParensContext context)
    {
        return Visit(context.expr());
    }

    /// <summary>
    /// Procesa las secuencias de escape en una cadena.
    /// </summary>
    /// <param name="text">El texto con secuencias de escape.</param>
    /// <returns>El texto procesado.</returns>
    private string ProcessEscapeSequences(string text)
    {
        return text
            .Replace("\\n", "\n")
            .Replace("\\t", "\t")
            .Replace("\\r", "\r")
            .Replace("\\\"", "\"")
            .Replace("\\\\", "\\")
            .Replace("\\b", "\b")
            .Replace("\\f", "\f");
    }

    /// <summary>
    /// Visita una cadena de texto.
    /// </summary>
    /// <param name="context">El contexto de la cadena de texto.</param>
    /// <returns>El valor de la cadena de texto.</returns>
    public override ValueWrapper VisitString(GoLangParser.StringContext context)
    {
        string rawText = context.STRING().GetText();
        // Remover las comillas y procesar secuencias de escape
        string unquoted = rawText.Substring(1, rawText.Length - 2);
        string processed = ProcessEscapeSequences(unquoted);
        return new ValueWrapper(processed, DataType.Type.String);
    }

    /// <summary>
    /// Visita un valor booleano.
    /// </summary>
    /// <param name="context">El contexto del valor booleano.</param>
    /// <returns>El valor booleano.</returns>
    public override ValueWrapper VisitBoolean(GoLangParser.BooleanContext context)
    {
        bool value = bool.Parse(context.BOOL().GetText());
        return new ValueWrapper(value, DataType.Type.Bool);
    }

    /// <summary>
    /// Visita un rune.
    /// </summary>
    /// <param name="context">El contexto del rune.</param>
    /// <returns>El valor del rune.</returns>
    public override ValueWrapper VisitRune(GoLangParser.RuneContext context)
    {
        string rawText = context.RUNE().GetText();
        // Remover las comillas simples
        string unquoted = rawText.Substring(1, rawText.Length - 2);
        string processed = ProcessEscapeSequences(unquoted);

        // Convertir a char y retornar el primer carácter
        if (processed.Length > 0)
        {
            return new ValueWrapper(processed[0], DataType.Type.Rune);
        }

        return new ValueWrapper('\0', DataType.Type.Rune); // Carácter nulo si hay error
    }

    /// <summary>
    /// Visita una variable.
    /// </summary>
    /// <param name="context">El contexto de la variable.</param>
    /// <returns>El valor de la variable.</returns>
    public override ValueWrapper VisitVariable(GoLangParser.VariableContext context)
    {
        string varName = context.ID().GetText();
        var symbol = _environment.GetVariable(varName);

        if (symbol != null)
        {
            return new ValueWrapper(symbol.Value, symbol.Type, symbol.ScopeName);
        }

        throw new SemanticError($"Variable '{varName}' no definida", context.Start);
    }

    /// <summary>
    /// Visita una expresión de inicialización de slice.
    /// </summary>
    /// <param name="context">El contexto de la expresión de inicialización de slice.</param>
    /// <returns>El resultado de la inicialización del slice.</returns>
    public override ValueWrapper VisitSliceInit(GoLangParser.SliceInitContext context)
    {
        // Comprobar si es una inicialización de slice anidado (2D)
        if (context.nestedSliceInit() != null)
        {
            return Visit2DSliceInit(context);
        }

        // Verificar si es un slice vacío {}
        if (context.exprList() == null || context.exprList().expr().Length == 0)
        {
            // Crear slice vacío sin tipo definido (untyped)
            object untypedSlice = DataType.CreateUntypedSlice(1);
            return new ValueWrapper(untypedSlice, DataType.Type.UntypedSlice);
        }

        // Inicialización de slice estándar 1D
        var exprList = context.exprList();
        List<ValueWrapper> values = new List<ValueWrapper>();

        // Recolectar valores
        if (exprList != null)
        {
            foreach (var exprCtx in exprList.expr())
            {
                values.Add(Visit(exprCtx));
            }
        }

        // Determinar tipo base (tomar el más "amplio" según DataType.GetType)
        DataType.Type targetType = DataType.Type.Int;

        foreach (var v in values)
        {
            if (v.Type == DataType.Type.Float) { targetType = DataType.Type.Float; break; }
            if (v.Type == DataType.Type.String) { targetType = DataType.Type.String; break; }
        }

        // Crear Array con el tipo .NET correspondiente
        System.Type systemType = DataType.GetSystemType(targetType);
        Array array = Array.CreateInstance(systemType, values.Count);

        // Convertir al tipo base y asignar
        for (int i = 0; i < values.Count; i++)
        {
            object converted = DataType.Convert(values[i].Value, targetType);
            array.SetValue(converted, i);
        }

        // Registrar propiedades del slice
        DataType.SliceProperties props1D = new DataType.SliceProperties(targetType, 1);
        props1D.Lengths[0] = values.Count;
        DataType.RegisterSlice(array, props1D);

        return new ValueWrapper(array, DataType.Type.Slice1D);
    }

    /// <summary>
    /// Procesa la inicialización de un slice bidimensional.
    /// </summary>
    /// <param name="context">El contexto de la expresión de inicialización de slice.</param>
    /// <returns>El resultado de la inicialización del slice.</returns>
    private ValueWrapper Visit2DSliceInit(GoLangParser.SliceInitContext context)
    {
        var nestedSliceInit = context.nestedSliceInit();
        if (nestedSliceInit == null) return ValueWrapper.Nil;

        // Verificar si es un slice 2D vacío {}
        if (nestedSliceInit.sliceInit().Length == 0)
        {
            // Crear slice vacío 2D sin tipo definido
            object untypedSlice = DataType.CreateUntypedSlice(2);
            return new ValueWrapper(untypedSlice, DataType.Type.UntypedSlice);
        }

        // Obtener todos los subslices
        List<ValueWrapper> rows = new List<ValueWrapper>();
        foreach (var subSliceContext in nestedSliceInit.sliceInit())
        {
            // Visitar cada subslice - puede ser un slice 1D o vacío
            ValueWrapper subSlice = Visit(subSliceContext);

            // Si el subslice es un slice de tipo no definido ({}), convertirlo a slice 1D vacío
            if (subSlice.Type == DataType.Type.UntypedSlice)
            {
                // Para cada fila vacía, creamos un slice 1D vacío
                object emptyRow = Array.CreateInstance(typeof(object), 0);
                DataType.SliceProperties emptyProps = new DataType.SliceProperties(DataType.Type.Undefined, 1);
                emptyProps.IsTyped = false;
                DataType.RegisterSlice(emptyRow, emptyProps);
                subSlice = new ValueWrapper(emptyRow, DataType.Type.Slice1D);
            }
            else if (subSlice.Type != DataType.Type.Slice1D)
            {
                throw new SemanticError("Estructura de slice bidimensional inválida", subSliceContext.Start);
            }

            rows.Add(subSlice);
        }

        // Si no hay filas o son todas vacías, usamos el tipo que se determine después
        if (rows.Count == 0)
        {
            // Slice 2D vacío
            return new ValueWrapper(new object[0, 0], DataType.Type.Slice2D);
        }

        // Determinar el tipo de elementos del slice 2D
        DataType.Type elementType = DataType.Type.Undefined;
        int maxColCount = 0;

        // Verificar consistencia del tipo y longitud entre filas
        for (int i = 0; i < rows.Count; i++)
        {
            Array row = (Array)rows[i].Value;
            maxColCount = Math.Max(maxColCount, row.Length);

            // Obtener propiedades del slice 1D
            var props = DataType.GetSliceProperties(row);
            if (props == null)
            {
                throw new SemanticError($"Error al determinar el tipo de elementos en la fila {i}", context.Start);
            }

            // Si la fila tiene elementos definidos, usar su tipo
            if (props.ElementType != DataType.Type.Undefined && row.Length > 0)
            {
                if (elementType == DataType.Type.Undefined)
                {
                    elementType = props.ElementType;
                }
                else if (elementType != props.ElementType)
                {
                    throw new SemanticError($"Los elementos en la fila {i} son de un tipo diferente al resto", context.Start);
                }
            }
        }

        // Si todas las filas estaban vacías o sin tipo definido, usamos Object como tipo
        if (elementType == DataType.Type.Undefined)
        {
            elementType = DataType.Type.Int; // Tipo predeterminado para slices vacíos
        }

        // Crear una matriz 2D del tipo apropiado
        System.Type systemType = DataType.GetSystemType(elementType);
        Array array2D = Array.CreateInstance(systemType, rows.Count, maxColCount);

        // Llenar la matriz 2D con los valores de los subslices
        for (int i = 0; i < rows.Count; i++)
        {
            Array row = (Array)rows[i].Value;
            for (int j = 0; j < row.Length; j++)
            {
                // Convertir el valor si es necesario
                if (row.Length > 0 && row.GetValue(j) != null)
                {
                    object convertedValue = DataType.Convert(row.GetValue(j)!, elementType);
                    array2D.SetValue(convertedValue, i, j);
                }
            }

            // Rellenar con valores por defecto las posiciones restantes
            for (int j = row.Length; j < maxColCount; j++)
            {
                array2D.SetValue(DataType.GetDefaultValue(elementType), i, j);
            }
        }

        // Registrar propiedades del slice 2D
        DataType.SliceProperties props2D = new DataType.SliceProperties(elementType, 2);
        props2D.Lengths[0] = rows.Count;
        props2D.Lengths[1] = maxColCount;
        DataType.RegisterSlice(array2D, props2D);

        return new ValueWrapper(array2D, DataType.Type.Slice2D);
    }

    /// <summary>
    /// Crea un slice con el tipo de elemento especificado.
    /// </summary>
    /// <param name="context">El contexto de la expresión de inicialización de slice.</param>
    /// <param name="elementType">El tipo de elemento del slice.</param>
    /// <returns>El resultado de la inicialización del slice.</returns>
    public ValueWrapper CreateSliceWithType(GoLangParser.SliceInitContext context, DataType.Type elementType)
    {
        // Si es una inicialización anidada, procesar como slice 2D
        if (context.nestedSliceInit() != null)
        {
            return Create2DSliceWithType(context, elementType);
        }

        // Variables para manejo de slices de structs
        bool isStructSlice = elementType == DataType.Type.Struct;
        string structTypeName = null!;
        // StructDefinition structDef = null!;

        // Si es un slice de structs, obtener información del tipo
        if (isStructSlice)
        {
            // Buscar el tipo en el contexto padre
            IParseTree current = context;
            while (current != null && current.Parent != null)
            {
                if (current.Parent is GoLangParser.VarDeclarationContext varDecl)
                {
                    if (varDecl.type() != null && varDecl.type().arrayType() != null)
                    {
                        var baseType = varDecl.type().arrayType().baseType();
                        if (baseType != null)
                        {
                            structTypeName = baseType.GetText();
                            // structDef = _environment.GetStructDefinition(structTypeName)!;
                            break;
                        }
                    }
                }
                current = current.Parent;
            }

            // if (structDef == null)
            // {
            //     throw new SemanticError("No se pudo determinar el tipo de struct para el slice", context.Start);
            // }
        }

        // Recolectar valores para el slice
        List<object> values = new List<object>();
        var exprList = context.exprList();

        if (exprList != null)
        {
            foreach (var exprCtx in exprList.expr())
            {

                var value = Visit(exprCtx);
                values.Add(value.Value);

            }
        }

        // Crear array con el tipo adecuado
        Array array;
        if (isStructSlice)
        {
            // Para slices de structs, usar object[] para almacenar StructInstance
            array = Array.CreateInstance(typeof(object), values.Count);
        }
        else
        {
            System.Type systemType = DataType.GetSystemType(elementType);
            array = Array.CreateInstance(systemType, values.Count);
        }

        // Asignar valores al array
        for (int i = 0; i < values.Count; i++)
        {
            array.SetValue(values[i], i);
        }

        // Registrar propiedades del slice
        DataType.SliceProperties sliceProps = new DataType.SliceProperties(elementType, 1);
        sliceProps.Lengths[0] = values.Count;
        DataType.RegisterSlice(array, sliceProps);

        return new ValueWrapper(array, DataType.Type.Slice1D);
    }

    /// <summary>
    /// Crea un slice bidimensional con el tipo de elemento especificado.
    /// </summary>
    /// <param name="context">El contexto de la expresión de inicialización de slice.</param>
    /// <param name="elementType">El tipo de elemento del slice.</param>
    /// <returns>El resultado de la inicialización del slice.</returns>
    public ValueWrapper Create2DSliceWithType(GoLangParser.SliceInitContext context, DataType.Type elementType)
    {
        // Verificar que sea una inicialización anidada
        var nestedSliceInit = context.nestedSliceInit();
        if (nestedSliceInit == null)
        {
            // Si no hay inicialización anidada, crear un slice 2D vacío
            Array emptyArray = Array.CreateInstance(DataType.GetSystemType(elementType), 0, 0);
            DataType.SliceProperties emptyProps = new DataType.SliceProperties(elementType, 2);
            emptyProps.Lengths[0] = 0;
            emptyProps.Lengths[1] = 0;
            DataType.RegisterSlice(emptyArray, emptyProps);
            return new ValueWrapper(emptyArray, DataType.Type.Slice2D);
        }

        // Si no hay filas en la inicialización, crear un slice 2D vacío con el tipo específico
        if (nestedSliceInit.sliceInit().Length == 0)
        {
            Array emptyArray = Array.CreateInstance(DataType.GetSystemType(elementType), 0, 0);
            DataType.SliceProperties emptyProps = new DataType.SliceProperties(elementType, 2);
            emptyProps.Lengths[0] = 0;
            emptyProps.Lengths[1] = 0;
            DataType.RegisterSlice(emptyArray, emptyProps);
            return new ValueWrapper(emptyArray, DataType.Type.Slice2D);
        }

        // Procesar cada subslice
        List<ValueWrapper> rows = new List<ValueWrapper>();
        foreach (var subSliceContext in nestedSliceInit.sliceInit())
        {
            // Para cada subslice, verificar si está vacío
            if (subSliceContext.exprList() == null || subSliceContext.exprList().expr().Length == 0)
            {
                // Si es una fila vacía, crear un slice 1D vacío con el tipo específico
                Array emptyRow = Array.CreateInstance(DataType.GetSystemType(elementType), 0);
                DataType.SliceProperties emptyRowProps = new DataType.SliceProperties(elementType, 1);
                emptyRowProps.Lengths[0] = 0;
                DataType.RegisterSlice(emptyRow, emptyRowProps);
                rows.Add(new ValueWrapper(emptyRow, DataType.Type.Slice1D));
            }
            else
            {
                // Crear un slice 1D con contenido
                var subSlice = CreateSliceWithType(subSliceContext, elementType);
                rows.Add(subSlice);
            }
        }

        // Determinar la longitud máxima de las filas
        int maxColCount = 0;
        foreach (var row in rows)
        {
            Array rowArray = (Array)row.Value;
            maxColCount = Math.Max(maxColCount, rowArray.Length);
        }

        // Change from rectangular array to jagged array
        Array jaggedArray = Array.CreateInstance(typeof(Array), rows.Count);
        System.Type elementSystemType = DataType.GetSystemType(elementType);

        for (int i = 0; i < rows.Count; i++)
        {
            // Preserve original row array
            Array originalRow = (Array)rows[i].Value;
            Array newRow = Array.CreateInstance(elementSystemType, originalRow.Length);
            Array.Copy(originalRow, newRow, originalRow.Length);
            jaggedArray.SetValue(newRow, i);
        }

        // Update slice properties
        DataType.SliceProperties props = new DataType.SliceProperties(elementType, 2)
        {
            Lengths = new[] { rows.Count, -1 } // -1 indicates variable row lengths
        };
        DataType.RegisterSlice(jaggedArray, props);

        return new ValueWrapper(jaggedArray, DataType.Type.Slice2D);
    }

    /// <summary>
    /// Visita una expresión de igualdad.
    /// </summary>
    /// <param name="context">El contexto de la expresión de igualdad.</param>
    /// <returns>El resultado de la comparación.</returns>
    public override ValueWrapper VisitEquality(GoLangParser.EqualityContext context)
    {
        var left = Visit(context.expr(0));
        var right = Visit(context.expr(1));
        var op = context.GetChild(1).GetText(); // == o !=

        bool areEqual;

        // Manejo especial cuando alguno o ambos son nil
        if (left.IsNil || right.IsNil)
        {
            // Si ambos son nil, son iguales
            areEqual = left.IsNil && right.IsNil;

            // Retornar el resultado según el operador
            return new ValueWrapper(op == "==" ? areEqual : !areEqual, DataType.Type.Bool);
        }

        try
        {
            // Convertir números a double para comparación
            double? leftNum = null;
            double? rightNum = null;

            if (left.Value is int || left.Value is double || left.Value is float || left.Value is Single)
            {
                leftNum = Convert.ToDouble(left.Value);
            }
            if (right.Value is int || right.Value is double || right.Value is float || right.Value is Single)
            {
                rightNum = Convert.ToDouble(right.Value);
            }

            // Si ambos son números
            if (leftNum.HasValue && rightNum.HasValue)
            {
                areEqual = Math.Abs(leftNum.Value - rightNum.Value) < 0.000001;
            }
            else
            {
                // Para otros tipos
                areEqual = left.Value.Equals(right.Value);
            }

            // Retornar según el operador
            return new ValueWrapper(op == "==" ? areEqual : !areEqual, DataType.Type.Bool);
        }
        catch
        {
            throw new SemanticError("Error al comparar valores", context.Start);
        }
    }

    /// <summary>
    /// Visita una expresión de comparación.
    /// </summary>
    /// <param name="context">El contexto de la expresión de comparación.</param>
    /// <returns>El resultado de la comparación.</returns>
    public override ValueWrapper VisitComparison(GoLangParser.ComparisonContext context)
    {
        var left = Visit(context.expr(0));
        var right = Visit(context.expr(1));
        var op = context.GetChild(1).GetText();

        if (left.IsNil || right.IsNil) return ValueWrapper.Nil;

        // Convertir números a double para comparación
        double? leftNum = null;
        double? rightNum = null;

        if (left.Value is int || left.Value is double || left.Value is float)
            leftNum = Convert.ToDouble(left.Value);
        if (right.Value is int || right.Value is double || right.Value is float)
            rightNum = Convert.ToDouble(right.Value);

        // Si ambos son números
        if (leftNum.HasValue && rightNum.HasValue)
        {
            bool result = op switch
            {
                ">" => leftNum > rightNum,
                "<" => leftNum < rightNum,
                ">=" => leftNum >= rightNum,
                "<=" => leftNum <= rightNum,
                _ => false
            };
            return new ValueWrapper(result, DataType.Type.Bool);
        }

        // Si son strings
        if (left.Value is string && right.Value is string)
        {
            bool result = op switch
            {
                ">" => string.Compare((string)left.Value, (string)right.Value) > 0,
                "<" => string.Compare((string)left.Value, (string)right.Value) < 0,
                ">=" => string.Compare((string)left.Value, (string)right.Value) >= 0,
                "<=" => string.Compare((string)left.Value, (string)right.Value) <= 0,
                _ => false
            };
            return new ValueWrapper(result, DataType.Type.Bool);
        }

        throw new SemanticError("Operación de comparación inválida", context.Start);
    }

    /// <summary>
    /// Visita una expresión lógica AND.
    /// </summary>
    /// <param name="context">El contexto de la expresión lógica AND.</param>
    /// <returns>El resultado de la operación lógica AND.</returns>
    public override ValueWrapper VisitAnd(GoLangParser.AndContext context)
    {
        var left = Visit(context.expr(0));
        var right = Visit(context.expr(1));

        if (left.Value is bool && right.Value is bool)
        {
            return new ValueWrapper((bool)left.Value && (bool)right.Value, DataType.Type.Bool);
        }

        throw new SemanticError("El operador && solo puede usarse con valores booleanos", context.Start);
    }

    /// <summary>
    /// Visita una expresión lógica OR.
    /// </summary>
    /// <param name="context">El contexto de la expresión lógica OR.</param>
    /// <returns>El resultado de la operación lógica OR.</returns>
    public override ValueWrapper VisitOr(GoLangParser.OrContext context)
    {
        var left = Visit(context.expr(0));
        var right = Visit(context.expr(1));

        if (left.Value is bool && right.Value is bool)
        {
            return new ValueWrapper((bool)left.Value || (bool)right.Value, DataType.Type.Bool);
        }

        throw new SemanticError("El operador || solo puede usarse con valores booleanos", context.Start);
    }

    /// <summary>
    /// Visita una expresión lógica NOT.
    /// </summary>
    /// <param name="context">El contexto de la expresión lógica NOT.</param>
    /// <returns>El resultado de la operación lógica NOT.</returns>
    public override ValueWrapper VisitNot(GoLangParser.NotContext context)
    {
        var value = Visit(context.expr());

        if (value.Value is bool)
        {
            return new ValueWrapper(!(bool)value.Value, DataType.Type.Bool);
        }

        throw new SemanticError("El operador ! solo puede usarse con valores booleanos", context.Start);
    }

    /// <summary>
    /// Visita una expresión de negación.
    /// </summary>
    /// <param name="context">El contexto de la expresión de negación.</param>
    /// <returns>El valor negado.</returns>
    public override ValueWrapper VisitNeg(GoLangParser.NegContext context)
    {
        var value = Visit(context.expr());

        try
        {
            // Verificar si el valor es numérico y convertirlo
            if (value.Value is int intValue)
            {
                return new ValueWrapper(-intValue, DataType.Type.Int);
            }
            if (value.Value is double doubleValue)
            {
                return new ValueWrapper(-doubleValue, DataType.Type.Float);
            }
            if (value.Value is float floatValue)
            {
                return new ValueWrapper(-(double)floatValue, DataType.Type.Float);
            }

            // Si no es ninguno de los tipos anteriores, intentar convertir
            var converted = ConvertToNumber(value.Value, context.Start.Line, context.Start.Column, context.Start);
            if (converted != null)
            {
                if (converted is int convertedInt)
                {
                    return new ValueWrapper(-convertedInt, DataType.Type.Int);
                }
                if (converted is double convertedDouble)
                {
                    return new ValueWrapper(-convertedDouble, DataType.Type.Float);
                }
            }

            throw new SemanticError("No se puede aplicar el operador de negación a este tipo de valor", context.Start);
        }
        catch (Exception)
        {
            throw new SemanticError("Error al aplicar el operador de negación", context.Start);
        }
    }

    /// <summary>
    /// Visita una expresión de función integrada slices.Index.
    /// </summary>
    /// <param name="context">El contexto de la expresión slices.Index.</param>
    /// <returns>El resultado de la función slices.Index.</returns>
    public override ValueWrapper VisitSlicesIndex(GoLangParser.SlicesIndexContext context)
    {
        var slice = Visit(context.expr(0));
        var searchElement = Visit(context.expr(1));

        if (slice.IsNil || searchElement.IsNil)
        {
            throw new SemanticError("No se pueden realizar operaciones con valores nulos", context.Start);
        }

        return _builtInFunctionsVisitor.ProcessBuiltInFunction("slices.Index", context.Start, slice, searchElement);
    }

    /// <summary>
    /// Visita una expresión de función integrada strings.Join.
    /// </summary>
    /// <param name="context">El contexto de la expresión strings.Join.</param>
    /// <returns>El resultado de la función strings.Join.</returns>
    public override ValueWrapper VisitStringsJoin(GoLangParser.StringsJoinContext context)
    {
        var slice = Visit(context.expr(0));
        var separator = Visit(context.expr(1));

        if (slice.IsNil || separator.IsNil)
        {
            throw new SemanticError("No se pueden realizar operaciones con valores nulos", context.Start);
        }

        return _builtInFunctionsVisitor.ProcessBuiltInFunction("strings.Join", context.Start, slice, separator);
    }

    /// <summary>
    /// Visita una expresión de función integrada len.
    /// </summary>
    /// <param name="context">El contexto de la expresión len.</param>
    /// <returns>El resultado de la función len.</returns>
    public override ValueWrapper VisitLen(GoLangParser.LenContext context)
    {
        var slice = Visit(context.expr());

        if (slice.IsNil)
        {
            throw new SemanticError("No se pueden realizar operaciones con valores nulos", context.Start);
        }

        return _builtInFunctionsVisitor.ProcessBuiltInFunction("len", context.Start, slice);
    }

    /// <summary>
    /// Parsea un string de tipo a DataType.Type.
    /// </summary>
    /// <param name="typeName">El nombre del tipo.</param>
    /// <returns>El tipo de dato correspondiente.</returns>
    private DataType.Type ParseTypeString(string typeName)
    {
        return typeName switch
        {
            "int" => DataType.Type.Int,
            "float64" => DataType.Type.Float,
            "string" => DataType.Type.String,
            "bool" => DataType.Type.Bool,
            "rune" => DataType.Type.Rune,
            _ => DataType.Type.Struct  // Si no es tipo básico, asumimos struct
        };
    }

    /// <summary>
    /// Visita acceso a un índice: array[i] o array[i][j].
    /// </summary>
    /// <param name="context">El contexto de la expresión de acceso a índice.</param>
    /// <returns>El valor en el índice especificado.</returns>
    public override ValueWrapper VisitIndexAccess(GoLangParser.IndexAccessContext context)
    {
        var arrayValue = Visit(context.expr(0));
        var indexValue = Visit(context.expr(1));

        // Verificar que el índice sea entero
        if (!(indexValue.Value is int) && !int.TryParse(indexValue.Value.ToString(), out _))
        {
            throw new SemanticError("El índice debe ser un entero", context.expr(1).Start);
        }

        int index = Convert.ToInt32(indexValue.Value);

        // Handle SliceRowWrapper (2D slice row)
        if (arrayValue.Value is SliceRowWrapper rowWrapper)
        {
            if (index < 0 || index >= rowWrapper.Length)
            {
                throw new SemanticError("Índice fuera de rango", context.expr(1).Start);
            }

            var elementValue = rowWrapper.GetValue(index);
            return new ValueWrapper(elementValue, DataType.GetType(elementValue));
        }


        if (arrayValue.Type == DataType.Type.Slice1D && arrayValue.Value is Array arr1D)
        {
            if (index < 0 || index >= arr1D.Length)
            {
                throw new SemanticError("Índice fuera de rango", context.expr(1).Start);
            }
            return new ValueWrapper(arr1D.GetValue(index)!, DataType.GetType(arr1D.GetValue(index)!));
        }
        else if (arrayValue.Type == DataType.Type.Slice2D && arrayValue.Value is Array arr2D)
        {
            if (index < 0 || index >= arr2D.GetLength(0))
            {
                throw new SemanticError("Índice fuera de rango", context.expr(1).Start);
            }
            return new ValueWrapper(
                new SliceRowWrapper(arr2D, index),
                DataType.Type.Slice1D
            );
        }

        throw new SemanticError("La expresión no es un slice", context.expr(0).Start);
    }

    /// <summary>
    /// Clase auxiliar para manejar filas de slices 2D.
    /// </summary>
    public class SliceRowWrapper
    {
        public Array ParentArray { get; }  // Add public property
        private readonly int _rowIndex;
        private readonly Array _rowArray;

        public SliceRowWrapper(Array parentArray, int rowIndex)
        {
            ParentArray = parentArray;  // Initialize the property
            _rowIndex = rowIndex;

            // Handle both rectangular and jagged arrays
            if (ParentArray.Rank == 2)
            {
                // Rectangular array
                _rowArray = new object[ParentArray.GetLength(1)];
                for (int i = 0; i < ParentArray.GetLength(1); i++)
                {
                    _rowArray.SetValue(ParentArray.GetValue(_rowIndex, i), i);
                }
            }
            else
            {
                // Jagged array
                _rowArray = (Array)ParentArray.GetValue(_rowIndex)!;
            }
        }

        public object GetValue(int column) => _rowArray.GetValue(column)!;
        public void SetValue(object value, int column) => _rowArray.SetValue(value, column);
        public int Length => _rowArray.Length;
    }

    /// <summary>
    /// Visita una expresión de función integrada append.
    /// </summary>
    /// <param name="context">El contexto de la expresión append.</param>
    /// <returns>El resultado de la función append.</returns>
    public override ValueWrapper VisitAppend(GoLangParser.AppendContext context)
    {
        var slice = Visit(context.expr(0));
        ValueWrapper element;

        // Determinamos si el segundo argumento es una expresión o un sliceInit
        if (context.expr().Length > 1)
        {
            // Es una expresión normal
            element = Visit(context.expr(1));
        }
        else if (context.sliceInit() != null)
        {
            // Es un sliceInit
            element = VisitSliceInit(context.sliceInit());
        }
        else
        {
            throw new SemanticError("Argumento inválido para append", context.Start);
        }

        if (slice.IsNil)
        {
            throw new SemanticError("No se puede hacer append a un slice nulo", context.Start);
        }

        // Verificar que el primer argumento sea un slice (1D o 2D)
        if (!DataType.IsSlice(slice.Type))
        {
            throw new SemanticError("La función append solo puede utilizarse con slices", context.Start);
        }

        // Para slices 2D, verificar que el segundo argumento sea un slice 1D
        if (slice.Type == DataType.Type.Slice2D && element.Type != DataType.Type.Slice1D)
        {
            throw new SemanticError("Para append a un slice bidimensional, el segundo argumento debe ser un slice unidimensional", context.Start);
        }

        return _builtInFunctionsVisitor.ProcessBuiltInFunction("append", context.Start, slice, element);
    }

    /// <summary>
    /// Visita una expresión de función integrada strconv.Atoi.
    /// </summary>
    /// <param name="context">El contexto de la expresión strconv.Atoi.</param>
    /// <returns>El resultado de la función strconv.Atoi.</returns>
    public override ValueWrapper VisitStrconvAtoi(GoLangParser.StrconvAtoiContext context)
    {
        var strVal = Visit(context.expr());
        if (strVal.Type != DataType.Type.String)
        {
            throw new SemanticError("El argumento de strconv.Atoi debe ser una cadena", context.Start);
        }
        try
        {
            int parsed = int.Parse((string)strVal.Value);
            return new ValueWrapper(parsed, DataType.Type.Int);
        }
        catch
        {
            throw new SemanticError("No se pudo convertir la cadena a int", context.Start);
        }
    }

    /// <summary>
    /// Visita una expresión de función integrada strconv.ParseFloat.
    /// </summary>
    /// <param name="context">El contexto de la expresión strconv.ParseFloat.</param>
    /// <returns>El resultado de la función strconv.ParseFloat.</returns>
    public override ValueWrapper VisitStrconvParseFloat(GoLangParser.StrconvParseFloatContext context)
    {
        var strVal = Visit(context.expr());
        if (strVal.Type != DataType.Type.String)
        {
            throw new SemanticError("El argumento de strconv.ParseFloat debe ser una cadena", context.Start);
        }
        try
        {
            double parsed = double.Parse((string)strVal.Value);
            return new ValueWrapper(parsed, DataType.Type.Float);
        }
        catch
        {
            throw new SemanticError("No se pudo convertir la cadena a float", context.Start);
        }
    }

    /// <summary>
    /// Visita una expresión de función integrada reflect.TypeOf.
    /// </summary>
    /// <param name="context">El contexto de la expresión reflect.TypeOf.</param>
    /// <returns>El resultado de la función reflect.TypeOf.</returns>
    public override ValueWrapper VisitReflectTypeOf(GoLangParser.ReflectTypeOfContext context)
    {
        var value = Visit(context.expr());

        // Determinar el tipo como string basado en el tipo de datos
        string typeString = value.Type switch
        {
            DataType.Type.Int => "int",
            DataType.Type.Float => "float64",
            DataType.Type.String => "string",
            DataType.Type.Bool => "bool",
            DataType.Type.Rune => "rune",
            DataType.Type.Slice1D => GetSliceTypeString(value.Value, 1),
            DataType.Type.Slice2D => GetSliceTypeString(value.Value, 2),
            DataType.Type.UntypedSlice => "{}", // Slice sin tipo
            _ => "undefined"
        };

        return new ValueWrapper(typeString, DataType.Type.String);
    }

    // Método auxiliar para obtener la representación del tipo de un slice
    private string GetSliceTypeString(object sliceValue, int dimensions)
    {
        if (sliceValue is Array array)
        {
            var props = DataType.GetSliceProperties(array);
            if (props != null)
            {
                string elementTypeStr = props.ElementType switch
                {
                    DataType.Type.Int => "int",
                    DataType.Type.Float => "float64",
                    DataType.Type.String => "string",
                    DataType.Type.Bool => "bool",
                    DataType.Type.Rune => "rune",
                    _ => "interface{}"
                };

                if (dimensions == 1)
                    return $"[]" + elementTypeStr;
                else
                    return $"[][]" + elementTypeStr;
            }
        }

        return dimensions == 1 ? "[]interface{}" : "[][]interface{}";
    }

    /// <summary>
    /// Visita una invocación literal.
    /// </summary>
    /// <param name="context">El contexto de la invocación literal.</param>
    /// <returns>El resultado de la invocación literal.</returns>
    public override ValueWrapper VisitInvokeLiteral(GoLangParser.InvokeLiteralContext context)
    {
        // Delegar al MainVisitor para manejar la invocación
        return _mainVisitor.VisitInvokeLiteral(context);
    }

    /// <summary>
    /// Visita una invocación de método literal.
    /// </summary>
    /// <param name="context">El contexto de la invocación de método literal.</param>
    /// <returns>El resultado de la invocación de método literal.</returns>
    public override ValueWrapper VisitInvokeMethodLiteral(GoLangParser.InvokeMethodLiteralContext context)
    {
        // Delegar al MainVisitor para manejar la invocación
        return _mainVisitor.VisitInvokeMethodLiteral(context);
    }


    /// <summary>
    /// Visita un acceso a campo.
    /// </summary>
    /// <param name="context">El contexto del acceso a campo.</param>
    /// <returns>El valor del campo.</returns>
    public override ValueWrapper VisitFieldAccess(GoLangParser.FieldAccessContext context)
    {
        var structWrapper = Visit(context.expr());
        string fieldName = context.ID().GetText();

        // Verificar si es nil antes de intentar acceder
        if (structWrapper.IsNil)
        {
            throw new SemanticError("No se puede acceder a campos de un valor nil", context.Start);
        }

        if (structWrapper.Type != DataType.Type.Struct)
        {
            throw new SemanticError("Acceso a campo en no estructura", context.Start);
        }

        // Handle different struct representations
        if (structWrapper.Value is Dictionary<string, ValueWrapper> dict)
        {
            if (!dict.ContainsKey(fieldName))
            {
                throw new SemanticError($"Campo '{fieldName}' no existe en la estructura", context.Start);
            }

            var fieldValue = dict[fieldName];

            // Si el campo existe pero es nil, devolver nil
            if (fieldValue.IsNil)
            {
                return ValueWrapper.Nil;
            }

            // Preservar explícitamente la información de tipo para campos struct
            if (fieldValue.Type == DataType.Type.Struct)
            {
                return fieldValue; // Usar el ValueWrapper completo con toda su información
            }

            return fieldValue;
        }

        throw new SemanticError($"Tipo de estructura no válido", context.Start);
    }

    /// <summary>
    /// Visita una inicialización de slice tipado.
    /// </summary>
    /// <param name="context">El contexto de la inicialización de slice tipado.</param>
    /// <returns>El resultado de la inicialización del slice tipado.</returns>
    public override ValueWrapper VisitTypedSliceInit(GoLangParser.TypedSliceInitContext context)
    {
        // Get the array type information
        var arrayType = context.arrayType();
        var (elementType, dimensions) = ParseArrayType(arrayType);

        // Get the slice initialization context
        var sliceInitContext = context.sliceInit();

        // Validate dimensions match initialization structure
        bool isNested = sliceInitContext.nestedSliceInit() != null;

        // Fix error by using context.Start() instead of context.Start
        if (dimensions == 1 && isNested)
        {
            throw new SemanticError("1D slice initializer cannot be nested", context.Start);
        }
        else if (dimensions == 2 && !isNested)
        {
            throw new SemanticError("2D slice initializer must be nested", context.Start);
        }

        return dimensions switch
        {
            1 => CreateSliceWithType(sliceInitContext, elementType),
            2 => Create2DSliceWithType(sliceInitContext, elementType),
            _ => throw new SemanticError("Unsupported slice dimensions", context.Start)
        };
    }

    /// <summary>
    /// Parsea el tipo de array.
    /// </summary>
    /// <param name="context">El contexto del tipo de array.</param>
    /// <returns>Una tupla con el tipo de elemento y las dimensiones.</returns>
    private (DataType.Type elementType, int dimensions) ParseArrayType(GoLangParser.ArrayTypeContext context)
    {
        int dimensions = 0;
        DataType.Type elementType = DataType.Type.Undefined;
        var current = context;

        while (current != null)
        {
            dimensions++;
            if (current.baseType() != null)
            {
                elementType = current.baseType().GetText() switch
                {
                    "int" => DataType.Type.Int,
                    "float64" => DataType.Type.Float,
                    "string" => DataType.Type.String,
                    "bool" => DataType.Type.Bool,
                    "rune" => DataType.Type.Rune,
                    _ => DataType.Type.Struct
                };
                break;
            }
            current = current.arrayType();
        }

        return (elementType, dimensions);
    }

    /// <summary>
    /// Visita una expresión nil.
    /// </summary>
    /// <param name="context">El contexto de la expresión nil.</param>
    /// <returns>El valor nil.</returns>
    public override ValueWrapper VisitNil(GoLangParser.NilContext context)
    {
        return ValueWrapper.Nil;
    }
}