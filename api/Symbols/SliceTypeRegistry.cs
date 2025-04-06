using System;
using System.Collections.Generic;
using analyzer;
using api.Common;

namespace Symbols
{
    /// <summary>
    /// Clase para registrar y recuperar información sobre tipos de slices
    /// </summary>
    public class SliceTypeRegistry
    {
        public class SliceTypeInfo
        {
            public DataType.Type ElementType { get; set; }
            public int Dimensions { get; set; }
        }

        // Obtener información del tipo de un slice basado en su declaración
        public static SliceTypeInfo GetSliceType(GoLangParser.TypeContext typeContext)
        {
            SliceTypeInfo info = new SliceTypeInfo
            {
                ElementType = DataType.Type.Undefined,
                Dimensions = 0
            };

            // Determinar si es un array y de qué dimensiones
            string typeText = typeContext.GetText();

            if (!typeText.StartsWith("[]"))
            {
                // No es un slice
                return info;
            }

            // Contar dimensiones basado en cuántas veces aparece "[]"
            int dimensions = 0;
            int index = 0;

            while (index < typeText.Length - 1)
            {
                if (typeText[index] == '[' && typeText[index + 1] == ']')
                {
                    dimensions++;
                    index += 2;
                }
                else
                {
                    break;
                }
            }

            info.Dimensions = dimensions;

            // Determinar el tipo del elemento
            if (dimensions == 1)
            {
                // Para slice unidimensional, obtener el tipo base
                string baseTypeText = typeText.Substring(2);
                info.ElementType = GetBaseType(baseTypeText);
            }
            else if (dimensions == 2)
            {
                // Para slice bidimensional, obtener el tipo base
                string baseTypeText = typeText.Substring(4);
                info.ElementType = GetBaseType(baseTypeText);
            }

            return info;
        }

        private static DataType.Type GetBaseType(string typeName)
        {
            return typeName switch
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
}
