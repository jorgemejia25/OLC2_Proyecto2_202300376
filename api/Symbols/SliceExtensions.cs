using System;
using System.Collections.Generic;
using System.Text;

namespace Symbols
{
    /// <summary>
    /// Clase de extensiones para manejar slices y arreglos
    /// </summary>
    public static class SliceExtensions
    {
        /// <summary>
        /// Convierte un slice (List o Array) a su representación de string
        /// </summary>
        public static string ToSliceString(this object slice)
        {
            if (slice == null) return "[]";

            // Manejar List<ValueWrapper>
            if (slice is List<ValueWrapper> list)
            {
                StringBuilder sb = new StringBuilder("[");
                for (int i = 0; i < list.Count; i++)
                {
                    if (i > 0) sb.Append(' ');

                    // Si es otro slice, recursión
                    if (list[i].Type == DataType.Type.Slice1D || list[i].Type == DataType.Type.Slice2D)
                    {
                        sb.Append(ToSliceString(list[i].Value));
                    }
                    else
                    {
                        sb.Append(FormatElement(list[i].Value, list[i].Type));
                    }
                }
                sb.Append("]");
                return sb.ToString();
            }

            // Manejar List<object>
            if (slice is List<object> objList)
            {
                StringBuilder sb = new StringBuilder("[");
                for (int i = 0; i < objList.Count; i++)
                {
                    if (i > 0) sb.Append(' ');

                    // Si es un ValueWrapper
                    if (objList[i] is ValueWrapper vw)
                    {
                        if (vw.Type == DataType.Type.Slice1D || vw.Type == DataType.Type.Slice2D)
                        {
                            sb.Append(ToSliceString(vw.Value));
                        }
                        else
                        {
                            sb.Append(FormatElement(vw.Value, vw.Type));
                        }
                    }
                    else
                    {
                        sb.Append(FormatElement(objList[i], DataType.GetType(objList[i])));
                    }
                }
                sb.Append("]");
                return sb.ToString();
            }

            // Manejar Array unidimensional
            if (slice is Array arr && arr.Rank == 1)
            {
                StringBuilder sb = new StringBuilder("[");
                for (int i = 0; i < arr.Length; i++)
                {
                    if (i > 0) sb.Append(' ');
                    var element = arr.GetValue(i);

                    // Si el elemento es otro slice
                    if (element is Array || element is List<ValueWrapper> || element is List<object>)
                    {
                        sb.Append(ToSliceString(element));
                    }
                    else if (element is ValueWrapper vw)
                    {
                        if (vw.Type == DataType.Type.Slice1D || vw.Type == DataType.Type.Slice2D)
                        {
                            sb.Append(ToSliceString(vw.Value));
                        }
                        else
                        {
                            sb.Append(FormatElement(vw.Value, vw.Type));
                        }
                    }
                    else
                    {
                        sb.Append(FormatElement(element, DataType.GetType(element)));
                    }
                }
                sb.Append("]");
                return sb.ToString();
            }

            // Manejar Array bidimensional
            if (slice is Array arr2d && arr2d.Rank == 2)
            {
                StringBuilder sb = new StringBuilder("[");
                for (int i = 0; i < arr2d.GetLength(0); i++)
                {
                    if (i > 0) sb.Append(' ');
                    sb.Append('[');

                    for (int j = 0; j < arr2d.GetLength(1); j++)
                    {
                        if (j > 0) sb.Append(' ');
                        var element = arr2d.GetValue(i, j);
                        sb.Append(FormatElement(element, DataType.GetType(element)));
                    }

                    sb.Append(']');
                }
                sb.Append("]");
                return sb.ToString();
            }

            // Fallback para cualquier otro caso
            return slice.ToString();
        }

        /// <summary>
        /// Formatea un elemento individual de un slice según su tipo
        /// </summary>
        private static string FormatElement(object element, DataType.Type type)
        {
            if (element == null) return "nil";

            // Formateo especial según el tipo
            return type switch
            {
                DataType.Type.String => element.ToString(),
                DataType.Type.Rune => $"'{element}'",
                DataType.Type.Struct => element is StructInstance si ? si.ToString() : element.ToString(),
                _ => element.ToString()
            };
        }
    }
}
