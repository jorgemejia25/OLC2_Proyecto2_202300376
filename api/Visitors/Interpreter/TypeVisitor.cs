using analyzer;
using Symbols;
using System.Text.RegularExpressions;

/// <summary>
/// Visitor para manejar los tipos de datos en el lenguaje GoLang.
/// </summary>
public class TypeVisitor : GoLangBaseVisitor<DataType.Type>
{
    private readonly Environment _environment;

    public TypeVisitor(Environment environment)
    {
        _environment = environment;
    }

    public override DataType.Type VisitType(GoLangParser.TypeContext context)
    {
        if (context.baseType() != null)
        {
            string typeName = context.baseType().GetText();

            if (_environment.GetStructDefinition(typeName) != null)
            {
                return DataType.Type.Struct;
            }

            return DataType.ParseTypeString(typeName);
        }
        else if (context.arrayType() != null)
        {
            string typeText = context.GetText();
            var (type, elementType, dimensions) = ProcessTypeText(typeText);

            // Registrar información del tipo de slice para este nodo
            SliceTypeRegistry.RegisterSliceType(context, elementType, dimensions);

            return type;
        }

        return DataType.Type.Undefined;
    }

    /// <summary>
    /// Procesa un texto de tipo y determina el tipo, tipo de elementos y dimensiones
    /// </summary>
    public (DataType.Type type, DataType.Type elementType, int dimensions) ProcessTypeText(string typeText)
    {
        // Contar número de "[]" al inicio del tipo
        int dimensions = 0;
        string baseTypeText = typeText;

        // Extraer dimensiones y tipo base
        while (baseTypeText.StartsWith("[]"))
        {
            dimensions++;
            baseTypeText = baseTypeText.Substring(2);
        }

        // Determinar tipo base
        DataType.Type baseType = GetBaseType(baseTypeText);

        // Si hay dimensiones, es un slice
        if (dimensions > 0)
        {
            // Limitar a dos dimensiones como máximo
            DataType.Type sliceType = dimensions == 1 ? DataType.Type.Slice1D : DataType.Type.Slice2D;
            return (sliceType, baseType, dimensions);
        }

        // Si no hay dimensiones, devolver el tipo base
        return (baseType, DataType.Type.Undefined, 0);
    }

    private DataType.Type GetBaseType(string type)
    {
        return type switch
        {
            "int" => DataType.Type.Int,
            "float64" => DataType.Type.Float,
            "string" => DataType.Type.String,
            "bool" => DataType.Type.Bool,
            "rune" => DataType.Type.Rune,
            _ => DataType.Type.Undefined
        };
    }
}

/// <summary>
/// Clase auxiliar para registrar tipos de slice asociados a nodos del AST
/// </summary>
public static class SliceTypeRegistry
{
    private static Dictionary<object, (DataType.Type ElementType, int Dimensions)> _registry =
        new Dictionary<object, (DataType.Type, int)>();

    public static void RegisterSliceType(object node, DataType.Type elementType, int dimensions)
    {
        _registry[node] = (elementType, dimensions);
    }

    public static (DataType.Type ElementType, int Dimensions) GetSliceType(object node)
    {
        if (_registry.TryGetValue(node, out var typeInfo))
        {
            return typeInfo;
        }
        return (DataType.Type.Undefined, 0);
    }
}
