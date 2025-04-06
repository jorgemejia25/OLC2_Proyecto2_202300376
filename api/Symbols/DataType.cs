using api.Common;
using System;
using System.Collections.Generic;

namespace Symbols
{
    public class DataType
    {
        public enum Type
        {
            Int,
            Float,
            String,
            Bool,
            Rune,
            Slice1D,    // Slice de una dimensión
            Slice2D,    // Slice de dos dimensiones
            UntypedSlice, // Nuevo: Slice sin tipo definido
            Struct,  // Nuevo tipo para structs
            Undefined
        }

        // Clase para representar las propiedades de un slice
        public class SliceProperties
        {
            public Type ElementType { get; set; }          // Tipo de los elementos del slice
            public int Dimensions { get; set; }            // Número de dimensiones (1 o 2)
            public int[] Lengths { get; set; }             // Longitud de cada dimensión
            public bool IsTyped { get; set; } = true;      // Indica si el slice tiene tipo definido
            public string StructName { get; set; }         // Nombre del tipo struct (para slices de structs)
            public List<Type> AllowedSubtypes { get; set; } = new List<Type>();

            public SliceProperties(Type elementType, int dimensions)
            {
                ElementType = elementType;
                Dimensions = dimensions;
                Lengths = new int[dimensions];
                IsTyped = elementType != Type.Undefined;
            }

            public override string ToString()
            {
                if (!IsTyped)
                    return "[]<untyped>";

                if (Dimensions == 1)
                    return $"[]{ElementType}";
                else if (Dimensions == 2)
                    return $"[][]{ElementType}";
                return "undefined";
            }
        }

        // Clase auxiliar para representar detalles de un tipo struct
        public class StructTypeInfo
        {
            public string StructName { get; }
            public StructTypeInfo(string name)
            {
                StructName = name;
            }
        }

        // Diccionario para registrar tipos de slice
        private static Dictionary<object, SliceProperties> _sliceTypes = new Dictionary<object, SliceProperties>();

        private const int MAX_RUNE_VALUE = 0x10FFFF; // Máximo valor Unicode válido

        public static Type GetType(object value)
        {
            if (value == null) return Type.Undefined;

            // Primero verificar si es un slice registrado
            var sliceProps = GetSliceProperties(value);
            if (sliceProps != null)
            {
                return sliceProps.Dimensions switch
                {
                    1 => Type.Slice1D,
                    2 => Type.Slice2D,
                    _ => Type.Undefined
                };
            }

            // Lógica existente para arrays no registrados...
            if (value is Array arr)
            {
                return arr.Rank == 1 ? Type.Slice1D : Type.Slice2D;
            }

            return value switch
            {
                int _ => Type.Int,
                double _ => Type.Float,
                float _ => Type.Float,
                string _ => Type.String,
                bool _ => Type.Bool,
                char _ => Type.Rune,
                _ => Type.Undefined,
            };
        }

        public static bool CheckType(object value, DataType.Type targetType, Antlr4.Runtime.IToken token)
        {
            var sourceType = GetType(value);

            // Si los tipos son iguales, no necesita conversión
            if (sourceType == targetType) return true;

            // Manejo especial para slices
            if ((sourceType == Type.Slice1D || sourceType == Type.Slice2D) &&
                (targetType == Type.Slice1D || targetType == Type.Slice2D))
            {
                // Verificar compatibilidad de dimensiones
                if ((sourceType == Type.Slice1D && targetType == Type.Slice1D) ||
                    (sourceType == Type.Slice2D && targetType == Type.Slice2D))
                {
                    // Verificar compatibilidad de tipos de elementos
                    var sourceProps = GetSliceProperties(value);
                    if (sourceProps != null)
                    {
                        // Agregar lógica para aceptar subtipos
                        if (sourceProps.AllowedSubtypes.Contains(targetType) || sourceProps.ElementType == targetType)
                        {
                            return true;
                        }
                        // Si no tenemos información de destino, asumir compatible
                        return true;
                    }
                }

                throw new SemanticError("No se puede asignar un slice de una dimensión a uno de dos dimensiones y viceversa", token);
            }

            // Conversiones numéricas permitidas
            if (sourceType == Type.Int && targetType == Type.Float) return true;
            if (sourceType == Type.Float && targetType == Type.Int) return true;

            // Para cualquier otro caso, mostrar error específico
            throw new SemanticError($"No se puede convertir de {sourceType} a {targetType}. Los tipos son incompatibles.", token);
        }

        public static object Convert(object value, DataType.Type targetType)
        {
            if (value == null) return GetDefaultValue(targetType);

            var sourceType = GetType(value);

            // Si los tipos son iguales, no necesita conversión
            if (sourceType == targetType) return value;

            try
            {
                // Solo permitir conversiones específicas
                if (sourceType == Type.Int && targetType == Type.Float)
                {
                    return System.Convert.ToDouble((int)value);
                }
                if (sourceType == Type.Float && targetType == Type.Int)
                {
                    return System.Convert.ToInt32((double)value);
                }

                // Para cualquier otro caso, devolver el valor por defecto
                return GetDefaultValue(targetType);
            }
            catch
            {
                return GetDefaultValue(targetType);
            }
        }

        public static object GetDefaultValue(Type type)
        {
            return type switch
            {
                Type.Int => 0,
                Type.Float => 0.0,
                Type.String => "",
                Type.Bool => false,
                Type.Rune => '\0',
                Type.Slice1D => new object[0],           // Array vacío de una dimensión
                Type.Slice2D => new object[0, 0],        // Array vacío de dos dimensiones
                _ => null!
            };
        }

        /// <summary>
        /// Crea un nuevo slice con las dimensiones especificadas
        /// </summary>
        public static object CreateSlice(Type elementType, int[] dimensions)
        {
            if (dimensions.Length == 1)
            {
                // Crear array de una dimensión
                Array array = Array.CreateInstance(GetSystemType(elementType), dimensions[0]);

                // Inicializar con valores por defecto
                for (int i = 0; i < dimensions[0]; i++)
                {
                    array.SetValue(GetDefaultValue(elementType), i);
                }

                // Registrar propiedades del slice
                SliceProperties props = new SliceProperties(elementType, 1);
                props.Lengths[0] = dimensions[0];
                _sliceTypes[array] = props;

                return array;
            }
            else if (dimensions.Length == 2)
            {
                // Crear array de dos dimensiones
                Array array = Array.CreateInstance(GetSystemType(elementType), dimensions[0], dimensions[1]);

                // Inicializar con valores por defecto
                for (int i = 0; i < dimensions[0]; i++)
                {
                    for (int j = 0; j < dimensions[1]; j++)
                    {
                        array.SetValue(GetDefaultValue(elementType), i, j);
                    }
                }

                // Registrar propiedades del slice
                SliceProperties props = new SliceProperties(elementType, 2);
                props.Lengths[0] = dimensions[0];
                props.Lengths[1] = dimensions[1];
                _sliceTypes[array] = props;

                return array;
            }

            throw new ArgumentException("Solo se soportan slices de una o dos dimensiones");
        }

        /// <summary>
        /// Crea un slice vacío con el tipo de elementos especificado
        /// </summary>
        public static object CreateEmptySlice(Type elementType, int[] dimensions)
        {
            // Validar dimensiones
            if (dimensions == null || dimensions.Length == 0 || dimensions.Length > 2)
            {
                throw new ArgumentException("Las dimensiones deben ser un arreglo de 1 o 2 elementos");
            }

            // Crear array con dimensiones cero (slice vacío)
            if (dimensions.Length == 1)
            {
                // Slice 1D vacío
                Array array = Array.CreateInstance(GetSystemType(elementType), 0);

                // Registrar propiedades del slice
                SliceProperties props = new SliceProperties(elementType, 1);
                props.Lengths[0] = 0;
                _sliceTypes[array] = props;

                return array;
            }
            else
            {
                // Slice 2D vacío
                Array array = Array.CreateInstance(GetSystemType(elementType), 0, 0);

                // Registrar propiedades del slice
                SliceProperties props = new SliceProperties(elementType, 2);
                props.Lengths[0] = 0;
                props.Lengths[1] = 0;
                _sliceTypes[array] = props;

                return array;
            }
        }

        public static System.Type GetSystemType(Type type)
        {
            return type switch
            {
                Type.Int => typeof(int),
                Type.Float => typeof(double),
                Type.String => typeof(string),
                Type.Bool => typeof(bool),
                Type.Rune => typeof(char),
                _ => typeof(object)
            };
        }

        public static bool IsSlice(Type type)
        {
            return type == Type.Slice1D || type == Type.Slice2D || type == Type.UntypedSlice;
        }

        public static SliceProperties GetSliceProperties(object sliceValue)
        {
            if (sliceValue == null) return null;

            // Handle special case for SliceRowWrapper
            if (sliceValue is ExpressionVisitor.SliceRowWrapper rowWrapper)
            {
                return GetSliceProperties(rowWrapper.GetValue(0)) ??
                    new SliceProperties(Type.Int, 1); // Default to int if unknown
            }

            if (sliceValue is Array arr)
            {
                // Return existing properties if registered
                if (_sliceTypes.TryGetValue(arr, out var existingProps))
                    return existingProps;

                // Create new properties if array has elements
                if (arr.Length > 0)
                {
                    // Get element type from first element
                    object firstElement = arr.GetValue(0);
                    var elementType = GetType(firstElement);

                    var props = new SliceProperties(elementType, arr.Rank);
                    for (int i = 0; i < arr.Rank; i++)
                        props.Lengths[i] = arr.GetLength(i);

                    RegisterSlice(arr, props);
                    return props;
                }

                // Handle empty arrays using declared type from variable
                if (arr is int[] intArr)
                    return new SliceProperties(Type.Int, 1);
                if (arr is double[] doubleArr)
                    return new SliceProperties(Type.Float, 1);
                if (arr is string[] stringArr)
                    return new SliceProperties(Type.String, 1);

                // Default to int for empty numeric slices
                return new SliceProperties(Type.Int, arr.Rank);
            }

            return null;
        }

        public static string GetSliceTypeString(object value)
        {
            var props = GetSliceProperties(value);
            if (props != null)
            {
                return props.ToString();
            }
            return "undefined";
        }

        public static bool AreSliceTypesCompatible(object slice1, object slice2)
        {
            var props1 = GetSliceProperties(slice1);
            var props2 = GetSliceProperties(slice2);

            if (props1 == null || props2 == null)
                return false;

            // Verificar dimensiones
            if (props1.Dimensions != props2.Dimensions)
                return false;

            // Verificar tipo de elementos
            return props1.ElementType == props2.ElementType;
        }

        private static bool IsNumeric(object value)
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

        /// <summary>
        /// Registra las propiedades de un slice
        /// </summary>
        public static void RegisterSlice(object slice, SliceProperties properties)
        {
            if (slice != null && properties != null)
            {
                _sliceTypes[slice] = properties;
                // Configurar subtipos según la dimensión
                if (properties.Dimensions == 2)
                {
                    // Permitir que un slice 2D se pueda tratar como su elemento o como un slice 1D (fila)
                    if (!properties.AllowedSubtypes.Contains(properties.ElementType))
                        properties.AllowedSubtypes.Add(properties.ElementType);
                    if (!properties.AllowedSubtypes.Contains(Type.Slice1D))
                        properties.AllowedSubtypes.Add(Type.Slice1D);
                }
                else if (properties.Dimensions == 1)
                {
                    if (!properties.AllowedSubtypes.Contains(properties.ElementType))
                        properties.AllowedSubtypes.Add(properties.ElementType);
                }
            }
        }

        /// <summary>
        /// Crea un slice vacío sin tipo definido
        /// </summary>
        public static object CreateUntypedSlice(int dimensions)
        {
            if (dimensions == 1)
            {
                // Crear un array vacío de objetos
                var array = new object[0];

                // Registrar como slice sin tipo
                SliceProperties props = new SliceProperties(Type.Undefined, 1);
                props.IsTyped = false;
                _sliceTypes[array] = props;

                return array;
            }
            else if (dimensions == 2)
            {
                // Crear un array vacío bidimensional
                var array = new object[0, 0];

                // Registrar como slice sin tipo
                SliceProperties props = new SliceProperties(Type.Undefined, 2);
                props.IsTyped = false;
                _sliceTypes[array] = props;

                return array;
            }

            throw new ArgumentException("Solo se soportan slices de una o dos dimensiones");
        }

        /// <summary>
        /// Actualiza el tipo de un slice sin tipo
        /// </summary>
        public static bool UpdateSliceType(object slice, Type newElementType)
        {
            if (slice == null || !_sliceTypes.ContainsKey(slice))
                return false;

            var props = _sliceTypes[slice];
            if (!props.IsTyped)
            {
                props.ElementType = newElementType;
                props.IsTyped = true;
                return true;
            }

            return false;
        }

        public static Type ParseTypeString(string typeName)
        {
            return typeName switch
            {
                "int" => Type.Int,
                "float64" => Type.Float,
                "string" => Type.String,
                "bool" => Type.Bool,
                "rune" => Type.Rune,
                _ => Type.Struct // Para tipos no básicos, asumimos struct
            };
        }

        public static bool CanConvert(Type sourceType, Type targetType)
        {
            if (sourceType == targetType) return true;
            if (sourceType == Type.Int && targetType == Type.Float) return true;
            if (sourceType == Type.Float && targetType == Type.Int) return true;
            return false;
        }
    }
}
