using System;
using System.Collections.Generic;
using Symbols;
using analyzer;
using api.Common;
using Antlr4.Runtime.Tree;
using Antlr4.Runtime;

/// <summary>
/// Visitor para manejar funciones integradas en el lenguaje GoLang.
/// </summary>
class BuiltInFunctionsVisitor : GoLangBaseVisitor<ValueWrapper>
{
    private readonly Environment _environment;
    private readonly ExpressionVisitor _expressionVisitor;

    /// <summary>
    /// Constructor de la clase BuiltInFunctionsVisitor.
    /// </summary>
    /// <param name="environment">Entorno compartido de variables.</param>
    /// <param name="expressionVisitor">Visitor de expresiones.</param>
    public BuiltInFunctionsVisitor(Environment environment, ExpressionVisitor expressionVisitor)
    {
        _environment = environment;
        _expressionVisitor = expressionVisitor;
    }

    /// <summary>
    /// Procesa y ejecuta las funciones integradas con el token del contexto.
    /// </summary>
    public ValueWrapper ProcessBuiltInFunction(string functionName, IToken token, params object[] args)
    {
        // El último argumento puede ser el contexto que contiene el token
        ValueWrapper[] funcArgs;

        // Extraer el token del último argumento si es un contexto
        if (args.Length > 0)
        {
            if (args[args.Length - 1] is ParserRuleContext ruleContext)
            {
                // Extraer el token del contexto y removerlo de los argumentos
                token = ruleContext.Start;
                funcArgs = new ValueWrapper[args.Length - 1];
                Array.Copy(args, funcArgs, args.Length - 1);
            }
            else
            {
                funcArgs = args.Cast<ValueWrapper>().ToArray();
            }
        }
        else
        {
            funcArgs = args.Cast<ValueWrapper>().ToArray();
        }

        try
        {
            return functionName switch
            {
                "len" => Len(funcArgs),
                "strings.Join" => StringsJoin(funcArgs),
                "slices.Index" => SlicesIndex(funcArgs),
                "append" => ProcessAppend(funcArgs[0], funcArgs[1], token),
                _ => throw new SemanticError($"Función integrada '{functionName}' no definida", token)
            };
        }
        catch (SemanticError)
        {
            throw; // Re-lanzar errores semánticos
        }
        catch (Exception ex)
        {
            // Convertir otras excepciones a SemanticError con el token
            throw new SemanticError(ex.Message, token);
        }
    }

    /// <summary>
    /// Implementa la función slices.Index que busca un elemento en un slice.
    /// </summary>
    /// <param name="args">Argumentos: [0] slice, [1] elemento a buscar</param>
    /// <returns>El índice de la primera coincidencia, o -1 si no se encuentra.</returns>
    private ValueWrapper SlicesIndex(ValueWrapper[] args)
    {
        // Validar que se recibieron exactamente 2 argumentos
        if (args == null || args.Length != 2)
        {
            throw new ArgumentException("La función slices.Index requiere exactamente 2 argumentos: slice y valor a buscar");
        }

        // Verificar que el primer argumento sea un slice
        if (args[0].Type != DataType.Type.Slice1D)
        {
            throw new ArgumentException("El primer argumento de slices.Index debe ser un slice unidimensional");
        }

        // Obtener el slice y el elemento a buscar
        Array slice = (Array)args[0].Value;
        object searchElement = args[1].Value;

        // Obtener propiedades del slice
        var sliceProps = DataType.GetSliceProperties(slice);
        if (sliceProps == null)
        {
            return new ValueWrapper(-1, DataType.Type.Int);
        }

        // Verificar que el tipo del valor a buscar sea compatible con el tipo de elementos del slice
        // Para simplificar, solo verificamos tipos exactamente iguales
        if (DataType.GetType(searchElement) != sliceProps.ElementType)
        {
            // Para algunos tipos permitimos conversiones implícitas
            bool typesAreCompatible = false;

            // Permitir buscar int en slice de float o rune en slice de int
            if ((sliceProps.ElementType == DataType.Type.Float && DataType.GetType(searchElement) == DataType.Type.Int) ||
                (sliceProps.ElementType == DataType.Type.Int && DataType.GetType(searchElement) == DataType.Type.Rune))
            {
                typesAreCompatible = true;
                // Convertir el valor para la comparación correcta
                searchElement = DataType.Convert(searchElement, sliceProps.ElementType);
            }

            if (!typesAreCompatible)
            {
                return new ValueWrapper(-1, DataType.Type.Int);
            }
        }

        // Buscar el elemento en el slice
        for (int i = 0; i < slice.Length; i++)
        {
            object currentElement = slice.GetValue(i)!;

            // Comparar elementos dependiendo del tipo
            bool foundMatch = false;

            // Para números, hacemos una comparación especial para manejar diferentes tipos numéricos
            if (IsNumeric(currentElement!) && IsNumeric(searchElement))
            {
                double currentValue = Convert.ToDouble(currentElement);
                double searchValue = Convert.ToDouble(searchElement);
                foundMatch = Math.Abs(currentValue - searchValue) < 0.000001;
            }
            // Para strings, comparamos con Equals
            else if (currentElement is string && searchElement is string)
            {
                foundMatch = ((string)currentElement).Equals((string)searchElement);
            }
            // Para bool, comparamos directamente
            else if (currentElement is bool && searchElement is bool)
            {
                foundMatch = (bool)currentElement == (bool)searchElement;
            }
            // Para rune (char), comparamos valores
            else if (currentElement is char && searchElement is char)
            {
                foundMatch = (char)currentElement == (char)searchElement;
            }
            // Para cualquier otro caso, usamos Equals
            else
            {
                foundMatch = currentElement != null && currentElement.Equals(searchElement);
            }

            if (foundMatch)
            {
                return new ValueWrapper(i, DataType.Type.Int);
            }
        }

        // Si no se encontró el elemento, devolver -1
        return new ValueWrapper(-1, DataType.Type.Int);
    }

    /// <summary>
    /// Implementa la función strings.Join que une elementos de un slice de cadenas.
    /// </summary>
    /// <param name="args">Argumentos: [0] slice de cadenas, [1] separador</param>
    /// <returns>La cadena resultante de unir los elementos del slice.</returns>
    private ValueWrapper StringsJoin(ValueWrapper[] args)
    {
        // Validar que se recibieron exactamente 2 argumentos
        if (args == null || args.Length != 2)
        {
            throw new ArgumentException("La función strings.Join requiere exactamente 2 argumentos: slice de cadenas y separador");
        }

        // Verificar que el primer argumento sea un slice de cadenas
        if (args[0].Type != DataType.Type.Slice1D)
        {
            throw new ArgumentException("El primer argumento de strings.Join debe ser un slice unidimensional de cadenas");
        }

        // Verificar que el segundo argumento sea una cadena
        if (args[1].Type != DataType.Type.String)
        {
            throw new ArgumentException("El segundo argumento de strings.Join debe ser una cadena");
        }

        // Obtener el slice y el separador
        Array slice = (Array)args[0].Value;
        string separator = (string)args[1].Value;

        // Obtener propiedades del slice
        var sliceProps = DataType.GetSliceProperties(slice);
        if (sliceProps == null || sliceProps.ElementType != DataType.Type.String)
        {
            throw new ArgumentException("El primer argumento de strings.Join debe ser un slice de cadenas");
        }

        // Unir los elementos del slice utilizando el separador
        List<string> elements = new List<string>();
        for (int i = 0; i < slice.Length; i++)
        {
            elements.Add((string)slice.GetValue(i)!);
        }

        string result = string.Join(separator, elements);
        return new ValueWrapper(result, DataType.Type.String);
    }

    /// <summary>
    /// Implementa la función len que devuelve la cantidad de elementos en un slice.
    /// </summary>
    /// <param name="args">Argumentos: [0] slice</param>
    /// <returns>La cantidad de elementos en el slice.</returns>
    private ValueWrapper Len(ValueWrapper[] args)
    {
        // Validar que se recibió exactamente 1 argumento
        if (args == null || args.Length != 1)
        {
            throw new ArgumentException("La función len requiere exactamente 1 argumento: slice");
        }

        // Handle different slice types
        int length = 0;
        if (args[0].Value is Array array)
        {
            // Caso para slices 1D y 2D
            if (args[0].Type == DataType.Type.Slice2D)
            {
                // Para slices 2D, devolver el número de filas (primera dimensión)
                length = array.GetLength(0);
            }
            else if (args[0].Type == DataType.Type.Slice1D)
            {
                // Para slices 1D, devolver la longitud del array
                length = array.Length;
            }
        }
        else if (args[0].Value is ExpressionVisitor.SliceRowWrapper rowWrapper)
        {
            // Caso para filas de slices 2D (número de columnas)
            length = rowWrapper.Length;
        }
        else
        {
            throw new ArgumentException("El argumento de len debe ser un slice unidimensional o bidimensional");
        }

        return new ValueWrapper(length, DataType.Type.Int);
    }

    /// <summary>
    /// Implementa la función append para agregar un elemento a un slice o una fila a un slice bidimensional
    /// </summary>
    private ValueWrapper ProcessAppend(ValueWrapper slice, ValueWrapper element, IToken token)
    {
        // Verificar que el slice sea válido
        if (!DataType.IsSlice(slice.Type))
        {
            throw new SemanticError("Append solo puede usarse con slices", token);
        }

        // Obtener propiedades del slice original
        var sliceProps = DataType.GetSliceProperties(slice.Value);
        if (sliceProps == null)
        {
            throw new SemanticError("Propiedades inválidas del slice", token);
        }

        try
        {
            // Manejar diferentes tipos de slices
            return sliceProps.Dimensions switch
            {
                1 => Handle1DAppend(slice, element, sliceProps, token),
                2 => Handle2DAppend(slice, element, sliceProps, token),
                _ => throw new SemanticError("Dimensión de slice no soportada", token)
            };
        }
        catch (SemanticError ex)
        {
            // Mejorar mensaje de error con información del tipo
            throw new SemanticError($"{ex.Message} (Tipo esperado: {sliceProps.ElementType})", token);
        }
    }

    private ValueWrapper Handle1DAppend(ValueWrapper slice, ValueWrapper element, DataType.SliceProperties sliceProps, IToken token)
    {
        // Verificar compatibilidad de tipos
        var elementType = DataType.GetType(element.Value);
        if (!DataType.CanConvert(elementType, sliceProps.ElementType))
        {
            throw new SemanticError($"Tipo incompatible para append: {elementType} → {sliceProps.ElementType}", token);
        }

        // Convertir el elemento al tipo del slice
        var convertedElement = DataType.Convert(element.Value, sliceProps.ElementType);

        // Crear nuevo array con tamaño incrementado
        Array original = (Array)slice.Value;
        Array newArray = Array.CreateInstance(
            DataType.GetSystemType(sliceProps.ElementType),
            original.Length + 1
        );

        // Copiar elementos existentes
        Array.Copy(original, newArray, original.Length);
        newArray.SetValue(convertedElement, original.Length);

        // Actualizar propiedades del slice
        var newProps = new DataType.SliceProperties(sliceProps.ElementType, 1)
        {
            Lengths = new[] { newArray.Length }
        };
        DataType.RegisterSlice(newArray, newProps);

        return new ValueWrapper(newArray, DataType.Type.Slice1D);
    }

    private ValueWrapper Handle2DAppend(ValueWrapper slice, ValueWrapper element, DataType.SliceProperties sliceProps, IToken token)
    {
        // Verificar que el elemento sea un slice 1D
        if (element.Type != DataType.Type.Slice1D)
        {
            throw new SemanticError("Para slices bidimensionales, append requiere un slice unidimensional", token);
        }

        // Obtener propiedades del slice a agregar
        var elementProps = DataType.GetSliceProperties(element.Value);
        if (elementProps == null || elementProps.Dimensions != 1)
        {
            throw new SemanticError("El elemento a agregar no es un slice válido", token);
        }

        // Verificar compatibilidad de tipos
        if (!DataType.CanConvert(elementProps.ElementType, sliceProps.ElementType))
        {
            throw new SemanticError($"Tipo incompatible para append: {elementProps.ElementType} → {sliceProps.ElementType}", token);
        }

        // Convertir todos los elementos del slice a agregar
        Array originalRow = (Array)element.Value;
        Array convertedRow = Array.CreateInstance(
            DataType.GetSystemType(sliceProps.ElementType),
            originalRow.Length
        );

        for (int i = 0; i < originalRow.Length; i++)
        {
            convertedRow.SetValue(
                DataType.Convert(originalRow.GetValue(i)!, sliceProps.ElementType),
                i
            );
        }

        // Crear nuevo slice 2D con fila adicional
        Array original = (Array)slice.Value;
        Array newArray = Array.CreateInstance(typeof(Array), original.Length + 1);
        Array.Copy(original, newArray, original.Length);
        newArray.SetValue(convertedRow, original.Length);

        // Actualizar propiedades del slice
        var newProps = new DataType.SliceProperties(sliceProps.ElementType, 2)
        {
            Lengths = new[] { newArray.Length, -1 } // -1 indica longitud variable en segunda dimensión
        };
        DataType.RegisterSlice(newArray, newProps);

        return new ValueWrapper(newArray, DataType.Type.Slice2D);
    }

    private bool IsNumeric(object value)
    {
        return value is sbyte
               || value is byte
               || value is short
               || value is ushort
               || value is int
               || value is uint
               || value is long
               || value is ulong
               || value is float
               || value is double
               || value is decimal;
    }
}
