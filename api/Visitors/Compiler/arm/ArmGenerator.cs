using System.Text;

public class ArmGenerator
{
    private readonly List<string> _instructions = new List<string>();
    private readonly StandardLibrary _stdLib = new StandardLibrary();



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

    // Operaciones para convertir entre enteros y flotantes
    public void Fcvt(string fd, string rs)
    {
        _instructions.Add($"SCVTF {fd}, {rs}");  // Signed integer to floating point
    }

    public void Fcvtz(string rd, string fs)
    {
        _instructions.Add($"FCVTZS {rd}, {fs}");  // Floating point to signed integer with truncation
    }

    // Mover entre registros flotantes y enteros
    public void Fmov(string fd, string rs)
    {
        _instructions.Add($"FMOV {fd}, {rs}");  // Mover de registro entero a flotante
    }

    public void Fmovi(string rd, string fs)
    {
        _instructions.Add($"FMOV {rd}, {fs}");  // Mover de registro flotante a entero
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
        _instructions.Add($"ADDI {rd}, {rs1}, #{imm}");
    }

    // Memory operations
    public void Str(string rs1, string rs2, int offset = 0)
    {
        _instructions.Add($"STR {rs1}, [{rs2}, #{offset}]");
    }

    public void Ldr(string rd, string rs1, int offset = 0)
    {
        _instructions.Add($"LDR {rd}, [{rs1}, #{offset}]");
    }

    public void Mov(string rd, int inm)
    {
        _instructions.Add($"MOV {rd}, #{inm}");
    }

    public void Push(string rs)
    {
        _instructions.Add($"STR {rs}, [SP, #-8]!");
    }

    public void Pop(string rd)
    {
        _instructions.Add($"LDR {rd}, [SP], #8");
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

    // Método para alineamiento con valor por defecto
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

    // Método para imprimir valores booleanos
    public void PrintBoolean(string rs)
    {
        _stdLib.Use("print_boolean");
        Align(16); // Garantizar alineamiento a 16 bytes
        _instructions.Add($"MOV X0, {rs}");
        _instructions.Add($"BL print_boolean");
    }

    // Método para imprimir el valor nil
    public void PrintNil()
    {
        _stdLib.Use("print_nil");
        Align(16); // Garantizar alineamiento a 16 bytes
        _instructions.Add($"BL print_nil");
    }

    // Nuevo método para imprimir valores flotantes
    public void PrintFloat(string rs)
    {
        _stdLib.Use("print_float");
        Align(16); // Garantizar alineamiento a 16 bytes para llamadas a función
        _instructions.Add($"FMOV D0, {rs}");  // Mover el valor a un registro de punto flotante
        _instructions.Add($"BL print_float");
    }

    // Método para cargar constantes de 64 bits (para floats)
    public void LoadConstantLong(string rd, long value)
    {
        // En ARM64, debemos cargar constantes grandes por partes
        _instructions.Add($"// Load constant {value} (0x{value:X})");
        _instructions.Add($"MOVZ {rd}, #{value & 0xFFFF}");
        _instructions.Add($"MOVK {rd}, #{(value >> 16) & 0xFFFF}, LSL #16");
        _instructions.Add($"MOVK {rd}, #{(value >> 32) & 0xFFFF}, LSL #32");
        _instructions.Add($"MOVK {rd}, #{(value >> 48) & 0xFFFF}, LSL #48");
    }

    public void Comment(string comment)
    {
        _instructions.Add($"// {comment}");
    }

    public void PrintString(string addressReg, string lengthReg)
    {
        _stdLib.Use("print_string");
        Align(16); // Garantizar alineamiento a 16 bytes para llamadas a función
        _instructions.Add($"MOV X0, {addressReg}");
        _instructions.Add($"MOV X1, {lengthReg}");
        _instructions.Add($"BL print_string");
    }

    // Método sobrecargado para longitud inmediata (ej: "Hello World!")
    public void PrintString(string addressReg, int length)
    {
        _stdLib.Use("print_string");
        Align(); // Garantizar alineamiento
        _instructions.Add($"MOV X0, {addressReg}");  // Dirección del string
        _instructions.Add($"MOV X1, #{length}");     // Longitud como inmediato
        _instructions.Add($"BL print_string");
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

    // Método general para agregar instrucciones personalizadas
    public void Add(string instruction)
    {
        _instructions.Add(instruction);
    }

    // Sobrecarga para instrucciones con un operando
    public void Add(string instruction, string operand)
    {
        _instructions.Add($"{instruction} {operand}");
    }

    // Sobrecarga para instrucciones con dos operandos
    public void Add(string instruction, string op1, string op2)
    {
        _instructions.Add($"{instruction} {op1}, {op2}");
    }

    // Sobrecarga para instrucciones con tres operandos
    public void Add(string instruction, string op1, string op2, string op3)
    {
        _instructions.Add($"{instruction} {op1}, {op2}, {op3}");
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

        sb.AppendLine(".text");
        sb.AppendLine(".balign 16       // Alineamiento para sección de código");
        sb.AppendLine(".global _start");
        sb.AppendLine("_start:");

        // Procesar instrucciones con alineamiento adicional después de llamadas a funciones
        foreach (var instruction in _instructions)
        {
            sb.AppendLine(instruction);

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
        sb.AppendLine(_stdLib.GetFunctionDefinitions());

        return sb.ToString();
    }
}