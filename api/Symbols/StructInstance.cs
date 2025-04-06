using System.Collections.Generic;

namespace Symbols
{
    public class StructInstance
    {
        public string StructName { get; }
        public Dictionary<string, object?> Fields { get; }

        public StructInstance(string structName)
        {
            StructName = structName;
            Fields = new Dictionary<string, object?>();
        }
    }
}
