using System.Collections.Generic;

namespace Symbols
{
    public class StructDefinition
    {
        public string Name { get; }
        public Dictionary<string, DataType.Type> Fields { get; } = new();
        public Dictionary<string, string> NestedStructTypes { get; } = new();

        public Dictionary<string, Function> Functions { get; } = new();
        public StructDefinition(string name)
        {
            Name = name;
        }

        public void AddField(DataType.Type type, string name, string nestedStructType = null!)
        {
            Fields.Add(name, type);
            if (type == DataType.Type.Struct && !string.IsNullOrEmpty(nestedStructType))
            {
                NestedStructTypes.Add(name, nestedStructType);
            }
        }
    }
}
