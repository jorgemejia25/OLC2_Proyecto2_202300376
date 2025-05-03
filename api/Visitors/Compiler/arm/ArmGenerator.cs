using System.Text;

public class StackObject
{
    public enum StackObjectType
    {
        Integer,
        Float,
        String,
        Boolean,
        Rune,    // Nuevo tipo para caracteres rune
        IntSlice, // Nuevo tipo para slices de enteros
        StringSlice // Nuevo tipo para slices de strings
    }

    public StackObjectType Type { get; set; }

    public int Length { get; set; }

    public int Depth { get; set; }

    public string? ID { get; set; }
}

public class ArmGenerator
{
    private readonly List<string> _instructions = new List<string>();
    private readonly StandardLibrary _stdLib = new StandardLibrary();

    public List<StackObject> stack = new List<StackObject>();

    private int _stackDepth = 0;

    // Registro de funciones para manejo de invocaciones
    private readonly Dictionary<string, string> _functionLabels = new Dictionary<string, string>();

    public void RegisterFunction(string funcName, string label)
    {
        _functionLabels[funcName] = label;
    }

    public bool HasFunction(string funcName)
    {
        return _functionLabels.ContainsKey(funcName);
    }

    public string GetFunctionLabel(string funcName)
    {
        if (_functionLabels.TryGetValue(funcName, out string? label) && label != null)
            return label;

        throw new Exception($"Function '{funcName}' not found");
    }

    // Método para retornar de una función
    public void Ret()
    {
        _instructions.Add("RET");
    }

    // Método para substraer inmediato
    public void sub(string rd, string rs, int imm)
    {
        _instructions.Add($"SUB {rd}, {rs}, #{imm}");
    }

    // Stack operations
    public void PushObject(StackObject obj)
    {
        stack.Add(obj);
    }

    public void PushConstant(StackObject obj, object value)
    {
        switch (obj.Type)
        {
            case StackObject.StackObjectType.Integer:
                Mov(Register.X0, (int)value);
                Push(Register.X0);
                break;

            case StackObject.StackObjectType.Float:
                // Usar un enfoque diferente para cargar constantes de punto flotante
                double doubleValue = (double)value;
                long floatBits = BitConverter.DoubleToInt64Bits(doubleValue);

                // Usar valores hexadecimales explícitos para evitar valores fuera de rango
                Comment($"Loading float value: {doubleValue} (hex: 0x{floatBits:X})");

                // Cargar los primeros 16 bits
                _instructions.Add($"MOVZ x0, #0x{(floatBits & 0xFFFF):X}, LSL #0");

                // Cargar los siguientes 16 bits
                _instructions.Add($"MOVK x0, #0x{((floatBits >> 16) & 0xFFFF):X}, LSL #16");

                // Cargar los siguientes 16 bits
                _instructions.Add($"MOVK x0, #0x{((floatBits >> 32) & 0xFFFF):X}, LSL #32");

                // Cargar los últimos 16 bits
                _instructions.Add($"MOVK x0, #0x{((floatBits >> 48) & 0xFFFF):X}, LSL #48");

                // Mover el valor a un registro de punto flotante
                _instructions.Add("FMOV d0, x0");

                // Guardar en la pila
                _instructions.Add("STR d0, [SP, #-8]!");
                break;

            case StackObject.StackObjectType.String:
                // En lugar de convertir directamente, preservar secuencias de escape en el string
                string stringValue = (string)value;

                // Guardar la dirección inicial del string en el heap
                Push(Register.HP);

                // Iterar por cada carácter del string
                for (int i = 0; i < stringValue.Length; i++)
                {
                    char c = stringValue[i];

                    // Verificar si es el inicio de una secuencia de escape
                    if (c == '\\' && i + 1 < stringValue.Length)
                    {
                        // Mantener el backslash literal en el string
                        Comment($"Pushing escape sequence character: \\");
                        Mov("w0", (int)'\\');
                        Strb("w0", Register.HP);
                        Mov(Register.X0, 1);
                        Add(Register.HP, Register.HP, Register.X0);

                        // Obtener el siguiente carácter después del backslash
                        i++;
                        c = stringValue[i];

                        // Añadir el siguiente carácter tal cual (será interpretado por print_string)
                        Comment($"Pushing escape sequence character: {c}");
                        Mov("w0", (int)c);
                        Strb("w0", Register.HP);
                        Mov(Register.X0, 1);
                        Add(Register.HP, Register.HP, Register.X0);
                    }
                    else
                    {
                        // Carácter normal
                        Comment($"Pushing character {i}: {(int)c}");
                        Mov("w0", (int)c);
                        Strb("w0", Register.HP);
                        Mov(Register.X0, 1);
                        Add(Register.HP, Register.HP, Register.X0);
                    }
                }

                // Añadir terminador NULL
                Comment("Pushing NULL terminator");
                Mov("w0", 0);
                Strb("w0", Register.HP);
                Mov(Register.X0, 1);
                Add(Register.HP, Register.HP, Register.X0);

                break;
            case StackObject.StackObjectType.Boolean:
                Mov(Register.X0, Convert.ToBoolean(value) ? 1 : 0);
                Push(Register.X0);
                break;
            case StackObject.StackObjectType.Rune:
                Mov(Register.X0, (int)value);
                Push(Register.X0);
                break;
            case StackObject.StackObjectType.IntSlice:
                // Manejar slices de enteros
                int[] intArray = (int[])value;
                int length = intArray.Length;

                // Guardar la dirección inicial del slice en el heap
                Push(Register.HP);

                // Primero guardar la longitud del slice (8 bytes)
                Comment($"Pushing int slice length: {length}");
                Mov(Register.X0, length);
                Str(Register.X0, Register.HP);
                Addi(Register.HP, Register.HP, 8);  // Avanzar 8 bytes (tamaño de la longitud)

                // Luego guardar cada entero del slice
                for (int i = 0; i < length; i++)
                {
                    Comment($"Pushing int slice element {i}: {intArray[i]}");
                    Mov(Register.X0, intArray[i]);
                    Str(Register.X0, Register.HP);  // Guardar el valor del entero (8 bytes)
                    Addi(Register.HP, Register.HP, 8);  // Avanzar 8 bytes por cada entero
                }
                break;

            case StackObject.StackObjectType.StringSlice:
                // Manejar slices de strings
                string[] stringArray = (string[])value;
                int strLength = stringArray.Length;

                // Guardar la dirección inicial del slice en el heap
                Push(Register.HP);

                // Primero guardar la longitud del slice (8 bytes)
                Comment($"Pushing string slice length: {strLength}");
                Mov(Register.X0, strLength);
                Str(Register.X0, Register.HP);
                Addi(Register.HP, Register.HP, 8);  // Avanzar 8 bytes (tamaño de la longitud)

                // Guardar un marcador para recordar dónde comienzan los punteros
                Comment($"Reserving space for {strLength} string pointers");
                // En lugar de intentar almacenar Register.HP en una variable int,
                // simplemente avanzamos el heap y trabajamos directamente con los registros
                Addi(Register.HP, Register.HP, strLength * 8);

                // Luego guardar cada string del slice (como punteros)
                for (int i = 0; i < strLength; i++)
                {
                    Comment($"Processing string slice element {i}: {stringArray[i]}");

                    // Guardar la dirección actual del heap como dirección del string
                    Comment($"Storing pointer to string at position {i}");

                    // Usar variables temporales para calcular la dirección
                    int offset = 8 + (i * 8); // 8 bytes para longitud + offset para este puntero
                    Comment($"Calculating address for string pointer at offset {offset}");

                    // Guardar la dirección actual del heap (dónde se guardará el string)
                    MovReg(Register.X0, Register.HP);

                    // Cargar la dirección base del slice desde la pila
                    Comment("Getting base address of slice");
                    Mov(Register.X1, offset);          // X1 = offset para este puntero
                    Ldr(Register.X2, Register.SP, 8);  // X2 = dirección base del slice
                    Add(Register.X2, Register.X2, Register.X1); // X2 = dirección donde guardar este puntero

                    // Guardar la dirección del string (X0) en la posición calculada del slice
                    Str(Register.X0, Register.X2);     // Guardar dirección del string en el slice

                    // Procesar la cadena actual carácter por carácter
                    string currentString = stringArray[i];
                    for (int j = 0; j < currentString.Length; j++)
                    {
                        char c = currentString[j];

                        // Verificar si es el inicio de una secuencia de escape
                        if (c == '\\' && j + 1 < currentString.Length)
                        {
                            // Mantener el backslash literal en el string
                            Comment($"Pushing escape sequence character: \\");
                            Mov("w0", (int)'\\');
                            Strb("w0", Register.HP);
                            Mov(Register.X0, 1);
                            Add(Register.HP, Register.HP, Register.X0);

                            // Obtener el siguiente carácter después del backslash
                            j++;
                            c = currentString[j];

                            // Añadir el siguiente carácter tal cual
                            Comment($"Pushing escape sequence character: {c}");
                            Mov("w0", (int)c);
                            Strb("w0", Register.HP);
                            Mov(Register.X0, 1);
                            Add(Register.HP, Register.HP, Register.X0);
                        }
                        else
                        {
                            // Carácter normal
                            Comment($"Pushing character: {c} ({(int)c})");
                            Mov("w0", (int)c);
                            Strb("w0", Register.HP);
                            Mov(Register.X0, 1);
                            Add(Register.HP, Register.HP, Register.X0);
                        }
                    }

                    // Añadir terminador NULL para cada string
                    Comment("Pushing NULL terminator for string");
                    Mov("w0", 0);
                    Strb("w0", Register.HP);
                    Mov(Register.X0, 1);
                    Add(Register.HP, Register.HP, Register.X0);
                }
                break;
        }

        PushObject(obj);
    }

    public StackObject TopObject()
    {
        return stack.Last();
    }

    public StackObject PopObject(string rd)
    {
        var obj = stack.Last();
        stack.RemoveAt(stack.Count - 1);

        Pop(rd);
        return obj;
    }

    public StackObject IntObject()
    {
        var obj = new StackObject
        {
            Type = StackObject.StackObjectType.Integer,
            ID = null,
            Length = 8,
            Depth = _stackDepth
        };
        _stackDepth += 8;
        return obj;
    }

    public StackObject FloatObject()
    {
        var obj = new StackObject
        {
            Type = StackObject.StackObjectType.Float,
            ID = null,
            Length = 8,
            Depth = _stackDepth
        };
        _stackDepth += 8;
        return obj;
    }

    public StackObject StringObject()
    {
        var obj = new StackObject
        {
            Type = StackObject.StackObjectType.String,
            ID = null,
            Length = 8,
            Depth = _stackDepth
        };
        _stackDepth += 8;
        return obj;
    }

    public StackObject BoolObject()
    {
        var obj = new StackObject
        {
            Type = StackObject.StackObjectType.Boolean,
            ID = null,
            Length = 8,
            Depth = _stackDepth
        };
        _stackDepth += 8;
        return obj;
    }

    public StackObject RuneObject()
    {
        var obj = new StackObject
        {
            Type = StackObject.StackObjectType.Rune,
            ID = null,
            Length = 8,
            Depth = _stackDepth
        };
        _stackDepth += 8;
        return obj;
    }

    public StackObject IntSliceObject()
    {
        var obj = new StackObject
        {
            Type = StackObject.StackObjectType.IntSlice,
            ID = null,
            Length = 8,
            Depth = _stackDepth
        };
        _stackDepth += 8;
        return obj;
    }

    public StackObject StringSliceObject()
    {
        var obj = new StackObject
        {
            Type = StackObject.StackObjectType.StringSlice,
            ID = null,
            Length = 8,
            Depth = _stackDepth
        };
        _stackDepth += 8;
        return obj;
    }

    // Environment operations

    public void NewScope()
    {
        _stackDepth++;
    }

    public int EndScope()
    {
        int byteOffset = 0;
        List<StackObject> objectsToRemove = new List<StackObject>();

        // Identificar todos los objetos del scope actual
        for (int i = stack.Count - 1; i >= 0; i--)
        {
            var obj = stack[i];
            if (obj.Depth == _stackDepth)
            {
                byteOffset += obj.Length;
                objectsToRemove.Add(obj);
            }
        }

        // Remover los objetos identificados
        foreach (var obj in objectsToRemove)
        {
            stack.Remove(obj);
        }

        _stackDepth--;

        return byteOffset;
    }

    public void TagObject(string id)
    {
        stack.Last().ID = id;
    }

    public (int, StackObject) GetObject(string id)
    {
        int byteOffset = 0;

        for (int i = stack.Count - 1; i >= 0; i--)
        {
            var obj = stack[i];
            if (obj.ID == id)
            {
                return (byteOffset, obj);
            }

            byteOffset += obj.Length;
        }

        throw new Exception($"Object with ID {id} not found in stack.");
    }

    public StackObject CloneObject(StackObject obj)
    {
        return new StackObject
        {
            Type = obj.Type,
            ID = obj.ID,
            Length = obj.Length,
            Depth = _stackDepth
        };
    }

    public void Add(string rd, string rs1, string rs2)
    {
        _instructions.Add($"ADD {rd}, {rs1}, {rs2}");
    }

    public void Fadd(string rd, string rs1, string rs2)
    {
        _instructions.Add($"FADD {rd}, {rs1}, {rs2}");
    }

    public void Sub(string rd, string rs1, string rs2)
    {
        _instructions.Add($"SUB {rd}, {rs1}, {rs2}");
    }

    public void Fsub(string fd, string fs1, string fs2)
    {
        _instructions.Add($"FSUB {fd}, {fs1}, {fs2}");
    }

    public void Mul(string rd, string rs1, string rs2)
    {
        _instructions.Add($"MUL {rd}, {rs1}, {rs2}");
    }

    public void Fmul(string fd, string fs1, string fs2)
    {
        _instructions.Add($"FMUL {fd}, {fs1}, {fs2}");
    }

    public void Div(string rd, string rs1, string rs2)
    {
        _instructions.Add($"SDIV {rd}, {rs1}, {rs2}");
    }

    public void Fdiv(string fd, string fs1, string fs2)
    {
        _instructions.Add($"FDIV {fd}, {fs1}, {fs2}");
    }

    public void Fcmp(string fs1, string fs2)
    {
        _instructions.Add($"FCMP {fs1}, {fs2}");
    }

    // Nuevo método para la operación de módulo
    public void Mod(string rd, string rs1, string rs2)
    {
        // En ARM64, podemos usar MSUB para calcular el módulo de manera más eficiente:
        // rd = rs1 - (rs1 / rs2) * rs2
        _instructions.Add($"SDIV x14, {rs1}, {rs2}");         // x14 = rs1 / rs2
        _instructions.Add($"MSUB {rd}, x14, {rs2}, {rs1}");   // rd = rs1 - x14 * rs2
    }

    public void Addi(string rd, string rs1, int imm)
    {
        // Corregido: En ARM64 estándar, la instrucción es ADD con un inmediato
        _instructions.Add($"ADD {rd}, {rs1}, #{imm}");
    }

    // Método para operación XOR
    public void Eor(string rd, string rs, int imm)
    {
        _instructions.Add($"EOR {rd}, {rs}, #{imm}");
    }

    public void Eor(string rd, string rs1, string rs2)
    {
        _instructions.Add($"EOR {rd}, {rs1}, {rs2}");
    }

    // Método para comparación con cero y salto si es cero
    public void Cbz(string reg, string label)
    {
        _instructions.Add($"CBZ {reg}, {label}");
    }

    // Método para comparación con cero y salto si NO es cero (Compare and Branch if Not Zero)
    public void Cbnz(string reg, string label)
    {
        _instructions.Add($"CBNZ {reg}, {label}");
    }

    // Método para salto incondicional
    public void B(string label)
    {
        _instructions.Add($"B {label}");
    }

    // Método para salto condicional con sufijo
    public void B(string condition, string label)
    {
        _instructions.Add($"B.{condition} {label}");
    }

    // Método para operación de comparación
    public void Cmp(string rs1, string rs2)
    {
        _instructions.Add($"CMP {rs1}, {rs2}");
    }

    // Método para definir una etiqueta
    public void Label(string label)
    {
        _instructions.Add($"{label}:");
    }

    // Memory operations
    public void Str(string rs1, string rs2, int offset = 0)
    {
        _instructions.Add($"STR {rs1}, [{rs2}, #{offset}]");
    }

    public void Strb(string rs1, string rs2)
    {
        _instructions.Add($"STRB {rs1}, [{rs2}]");
    }

    public void Ldr(string rd, string rs1, int offset = 0)
    {
        _instructions.Add($"LDR {rd}, [{rs1}, #{offset}]");
    }

    public void Ldrb(string rd, string rs1, int offset = 0)
    {
        if (offset == 0)
        {
            _instructions.Add($"LDRB {rd}, [{rs1}]");
        }
        else
        {
            _instructions.Add($"LDRB {rd}, [{rs1}, #{offset}]");
        }
    }

    public void Ldrb(string rd, string rs)
    {
        _instructions.Add($"LDRB {rd}, [{rs}]");
    }

    public void Mov(string rd, int inm)
    {
        _instructions.Add($"MOV {rd}, #{inm}");
    }

    public void MovReg(string rd, string rs)
    {
        _instructions.Add($"MOV {rd}, {rs}");
    }

    public void Push(string rs)
    {
        _instructions.Add($"STR {rs}, [SP, #-8]!");
    }

    public void Pop(string rd)
    {
        _instructions.Add($"LDR {rd}, [SP], #8");
    }

    // Float operations
    public void Scvtf(string rd, string rs)
    {
        _instructions.Add($"SCVTF {rd}, {rs}");
    }

    public void Fmov(string rd, string rs)
    {
        _instructions.Add($"FMOV {rd}, {rs}");
    }

    public void PrintFloat()
    {
        _stdLib.Use("print_integer");
        _stdLib.Use("print_double");
        Align(16); // Garantizar alineamiento a 16 bytes para llamadas a función
        _instructions.Add("BL print_double");  // Corregido: eliminado el símbolo $ antes de BL
    }

    public void Svc()
    {
        _instructions.Add($"SVC #0");
    }

    public void EndProgram()
    {
        Mov(Register.X0, 0);
        Mov(Register.X8, 93); // Exit syscall number
        Svc(); // Make syscall
    }

    public void Align(int bytes = 16)
    {
        _instructions.Add($".balign {bytes}     // Garantizar alineamiento a {bytes} bytes");
    }

    public void PrintInteger(string rs)
    {
        _stdLib.Use("print_integer");
        Align(16); // Garantizar alineamiento a 16 bytes para llamadas a función
        _instructions.Add($"MOV X0, {rs}");
        _instructions.Add($"BL print_integer");
    }

    public void PrintIntegerNoNewline(string rs)
    {
        _stdLib.Use("print_integer_no_newline");
        Align(16); // Garantizar alineamiento a 16 bytes para llamadas a función
        _instructions.Add($"MOV X0, {rs}");
        _instructions.Add($"BL print_integer_no_newline");
    }

    public void PrintString(string rs)
    {
        _stdLib.Use("print_string");
        Align(16); // Garantizar alineamiento a 16 bytes para llamadas a función
        _instructions.Add($"MOV X0, {rs}");
        _instructions.Add($"BL print_string");
    }

    public void PrintRune(string rs)
    {
        _stdLib.Use("print_rune");
        Align(16); // Garantizar alineamiento a 16 bytes para llamadas a función
        _instructions.Add($"MOV X0, {rs}");
        _instructions.Add($"BL print_rune");
    }

    public void PrintNewline()
    {
        // Imprimir un salto de línea usando syscall directamente
        _instructions.Add("// Print newline character");
        _instructions.Add("MOV X0, #1");         // fd = 1 (stdout)
        _instructions.Add("SUB SP, SP, #16");     // Reservar espacio en la pila
        _instructions.Add("MOV W1, #10");         // ASCII code for '\n'
        _instructions.Add("STRB W1, [SP]");       // Guardar el carácter en la pila
        _instructions.Add("MOV X1, SP");         // Puntero al carácter en la pila
        _instructions.Add("MOV X2, #1");         // Longitud = 1 byte
        _instructions.Add("MOV W8, #64");        // Syscall número 64 para write
        _instructions.Add("SVC #0");             // Hacer la syscall
        _instructions.Add("ADD SP, SP, #16");     // Restaurar espacio de la pila
    }

    public void PrintSpace()
    {
        // Imprimir un espacio usando syscall directamente
        _instructions.Add("// Print space character");
        _instructions.Add("MOV X0, #1");         // fd = 1 (stdout)
        _instructions.Add("SUB SP, SP, #16");     // Reservar espacio en la pila
        _instructions.Add("MOV W1, #32");         // ASCII code for space ' '
        _instructions.Add("STRB W1, [SP]");       // Guardar el carácter en la pila
        _instructions.Add("MOV X1, SP");         // Puntero al carácter en la pila
        _instructions.Add("MOV X2, #1");         // Longitud = 1 byte
        _instructions.Add("MOV W8, #64");        // Syscall número 64 para write
        _instructions.Add("SVC #0");             // Hacer la syscall
        _instructions.Add("ADD SP, SP, #16");     // Restaurar espacio de la pila
    }

    public void PrintBool(string rs)
    {
        _stdLib.Use("print_bool");
        Align(16); // Garantizar alineamiento a 16 bytes para llamadas a función
        _instructions.Add($"MOV X0, {rs}");
        _instructions.Add($"BL print_bool");
    }

    public void ConcatStrings(string rs1, string rs2)
    {
        _stdLib.Use("concat_strings");
        Align(16); // Garantizar alineamiento a 16 bytes para llamadas a función
        _instructions.Add($"MOV X0, {rs1}");
        _instructions.Add($"MOV X1, {rs2}");
        _instructions.Add($"BL concat_strings");
    }

    public void PrintIntSlice(string rs)
    {
        _stdLib.Use("print_int_slice");
        _stdLib.Use("print_integer_no_newline"); // Añadir dependencia explícita a print_integer_no_newline
        Align(16); // Garantizar alineamiento a 16 bytes para llamadas a función
        _instructions.Add($"MOV X0, {rs}");
        _instructions.Add($"BL print_int_slice");
    }

    public void PrintStringSlice(string rs)
    {
        _stdLib.Use("print_string_slice");
        _stdLib.Use("print_string"); // Añadir dependencia explícita a print_string
        Align(16); // Garantizar alineamiento a 16 bytes para llamadas a función
        _instructions.Add($"MOV X0, {rs}");
        _instructions.Add($"BL print_string_slice");
    }

    public void StringsJoin(string sliceReg, string separatorReg)
    {
        _stdLib.Use("strings_join");
        _stdLib.Use("concat_strings");  // Añadir dependencia explícita a concat_strings
        Align(16); // Garantizar alineamiento a 16 bytes para llamadas a función
        Comment($"Calling strings_join with slice in {sliceReg} and separator in {separatorReg}");
        _instructions.Add($"MOV X0, {sliceReg}");
        _instructions.Add($"MOV X1, {separatorReg}");
        _instructions.Add($"BL strings_join");
    }

    // Método público para usar funciones de la biblioteca estándar
    public void UseStdLib(string functionName)
    {
        _stdLib.Use(functionName);
    }

    // Método para llamada a función (branch and link)
    public void Bl(string label)
    {
        _instructions.Add($"BL {label}");
    }

    public void Comment(string comment)
    {
        _instructions.Add($"// {comment}");
    }

    private int _stringCounter = 0;
    private readonly List<string> _dataSection = new List<string>();

    // Método para declarar strings en .data
    public string DeclareString(string content)
    {
        var label = $".L.str.{_stringCounter++}";
        _dataSection.Add($"{label}:");
        _dataSection.Add($"    .ascii \"{EscapeString(content)}\"");
        _dataSection.Add($"    .size {label}, {content.Length}");
        return label;
    }

    private string EscapeString(string input)
    {
        return input
            .Replace("\n", "\\n")
            .Replace("\t", "\\t")
            .Replace("\"", "\\\"");
    }

    // Métodos actualizados para manejar direcciones con sintaxis estándar
    public void Adrp(string rd, string label)
    {
        // Usar ADR para referencias cercanas en lugar de ADRP que usa sintaxis específica
        _instructions.Add($"ADR {rd}, {label}");
    }

    public void AddLabelOffset(string rd, string label)
    {
        // Esta línea ya no es necesaria cuando usamos ADR directamente
        // No agregar nada para mantener compatibilidad con el código existente
    }

    public override string ToString()
    {
        var sb = new StringBuilder();

        // Incluir la sección .data si hay strings definidos
        if (_dataSection.Count > 0)
        {
            sb.AppendLine(".data");
            sb.AppendLine(".balign 16       // Alineamiento para sección de datos");
            foreach (var line in _dataSection)
            {
                sb.AppendLine(line);
            }
            sb.AppendLine();
        }

        sb.AppendLine(".data");
        sb.AppendLine("heap: .space 4096");


        sb.AppendLine(".text");
        sb.AppendLine(".balign 16       // Alineamiento para sección de código");
        sb.AppendLine(".global _start");
        sb.AppendLine("_start:");
        sb.AppendLine("    adr x10, heap");

        // Procesar instrucciones con alineamiento adicional después de llamadas a funciones
        for (int i = 0; i < _instructions.Count; i++)
        {
            var instruction = _instructions[i];

            sb.AppendLine(_instructions[i]);

            // Si fue una llamada a función, marcar que necesitamos alineamiento
            if (instruction.StartsWith("BL "))
            {
                sb.AppendLine(".balign 16     // Garantizar alineamiento después de llamada a función");
            }
        }

        sb.AppendLine(".balign 16       // Alineamiento para código de salida");
        sb.AppendLine("// Program Exit");
        sb.AppendLine("    MOV X0, #0");  // Código de salida
        sb.AppendLine("    MOV X8, #93"); // Syscall exit
        sb.AppendLine("    SVC #0");      // Realizar syscall

        sb.AppendLine("\n\n// Standard Library Functions");

        // Modificar la salida de las funciones de la biblioteca estándar para incluir alineación adecuada
        string stdLibFunctions = _stdLib.GetFunctionDefinitions();

        // Asegurar que las etiquetas en las funciones estén alineadas a 4 bytes (una palabra)
        stdLibFunctions = EnsureFunctionLabelsAreAligned(stdLibFunctions);

        sb.AppendLine(stdLibFunctions);

        return sb.ToString();
    }

    // Método para garantizar que todas las etiquetas en funciones estén correctamente alineadas
    private string EnsureFunctionLabelsAreAligned(string functions)
    {
        var lines = functions.Split('\n');
        var result = new StringBuilder();

        for (int i = 0; i < lines.Length; i++)
        {
            string line = lines[i];

            // Si la línea contiene una etiqueta (termina con :) pero no es una directiva o comentario
            if (line.Trim().EndsWith(":") && !line.Trim().StartsWith(".") && !line.Trim().StartsWith("//"))
            {
                // Agregar directiva de alineación antes de la etiqueta
                result.AppendLine(".balign 4       // Alinear a 4 bytes (una palabra)");
                result.AppendLine(line);
            }
            // Si la línea contiene un objetivo de salto (instrucciones que pueden ser destino de saltos)
            else if (line.Trim().Contains("loop:") ||
                     line.Trim().Contains("done:") ||
                     line.Trim().Contains("_number:") ||
                     line.Trim().Contains("_result:"))
            {
                // Agregar directiva de alineación antes de objetivos de salto
                result.AppendLine(".balign 4       // Alinear a 4 bytes");
                result.AppendLine(line);
            }
            else
            {
                result.AppendLine(line);
            }
        }

        return result.ToString();
    }
}