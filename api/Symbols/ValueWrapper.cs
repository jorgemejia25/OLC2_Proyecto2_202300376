using System;
using api.Common;

namespace Symbols
{
    public class ValueWrapper
    {
        public object Value { get; set; }
        public DataType.Type Type { get; set; }
        public string StructTypeName { get; set; }
        public string ScopeName { get; set; }
        public bool IsConstant { get; set; }
        public bool IsNil => Value == null;
        public DataType.SliceProperties? SliceProperties { get; set; }  // Cambiar a propiedad pública

        public ValueWrapper(object value, DataType.Type type, string scopeName = "", bool isConstant = false)
        {
            Value = value;
            Type = type;
            ScopeName = scopeName;
            IsConstant = isConstant;
        }

        // Método para obtener el tipo base de un slice
        public DataType.Type GetBaseType()
        {
            return DataType.Type.Undefined;
        }

        public static ValueWrapper CreateFromValue(object value, string scopeName = "global")
        {
            var type = DataType.GetType(value);
            return new ValueWrapper(value, type, scopeName);
        }

        public static ValueWrapper CreateFromProperties(Dictionary<string, ValueWrapper> properties, string scopeName = "global")
        {
            return new ValueWrapper(properties, DataType.Type.Struct, scopeName);
        }

        public static ValueWrapper Nil => new ValueWrapper(
            null,
            DataType.Type.Undefined,
            "",
            false
        );

        // Método para determinar si dos ValueWrapper son compatibles en asignación
        public bool IsCompatibleWith(ValueWrapper other)
        {
            return Type == other.Type;
        }

        public static ValueWrapper? operator +(ValueWrapper left, ValueWrapper right)
        {
            try
            {
                if (left.Type == DataType.Type.String && right.Type == DataType.Type.String)
                {
                    return new ValueWrapper(
                        (string)left.Value + (string)right.Value,
                        DataType.Type.String,
                        left.ScopeName
                    );
                }

                if (IsNumeric(left) && IsNumeric(right))
                {
                    var result = Convert.ToDouble(left.Value) + Convert.ToDouble(right.Value);
                    var resultType = (left.Type == DataType.Type.Float || right.Type == DataType.Type.Float)
                        ? DataType.Type.Float
                        : DataType.Type.Int;

                    return new ValueWrapper(
                        resultType == DataType.Type.Int ? Convert.ToInt32(result) : result,
                        resultType,
                        left.ScopeName
                    );
                }
                return null;
            }
            catch
            {
                return null;
            }
        }

        private static bool IsNumeric(ValueWrapper wrapper)
        {
            return wrapper.Type == DataType.Type.Int || wrapper.Type == DataType.Type.Float;
        }

        public override string ToString()
        {
            return Value?.ToString() ?? "null";
        }

        public static ValueWrapper CreateFromStruct(Dictionary<string, ValueWrapper> instance, string structName)
        {
            return new ValueWrapper(instance, DataType.Type.Struct)
            {
                StructTypeName = structName
            };
        }
    }
}
