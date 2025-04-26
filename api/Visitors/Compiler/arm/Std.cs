public class StandardLibrary
{
    private readonly HashSet<string> _usedFunctions = new HashSet<string>();
    private readonly HashSet<string> _usedSymbols = new HashSet<string>();

    // Nuevos diccionarios para mantener información de los parámetros y tipos de retorno
    private static readonly Dictionary<string, string> _functionReturnTypes = new Dictionary<string, string>
    {
        { "print_integer", "void" },
        { "print_integer_no_newline", "void" },
        { "print_string", "void" },
        { "print_rune", "void" },
        { "print_bool", "void" },
        { "concat_strings", "string" },
        { "string_equals", "bool" },
        { "float_mod", "float64" }
    };

    private static readonly Dictionary<string, List<(string paramName, string paramType)>> _functionParameters = new Dictionary<string, List<(string, string)>>
    {
        { "print_integer", new List<(string, string)> { ("value", "int") } },
        { "print_integer_no_newline", new List<(string, string)> { ("value", "int") } },
        { "print_string", new List<(string, string)> { ("str", "string") } },
        { "print_rune", new List<(string, string)> { ("rune", "rune") } },
        { "print_bool", new List<(string, string)> { ("value", "bool") } },
        { "concat_strings", new List<(string, string)> { ("str1", "string"), ("str2", "string") } },
        { "string_equals", new List<(string, string)> { ("str1", "string"), ("str2", "string") } },
        { "float_mod", new List<(string, string)> { ("x", "float64"), ("y", "float64") } }
    };

    public void Use(string function)
    {
        Console.WriteLine($"Using function: {function}");

        // Si la función no ha sido registrada previamente, registrarla en la tabla de símbolos
        if (!_usedFunctions.Contains(function))
        {
            RegisterFunctionInSymbolTable(function);
        }

        _usedFunctions.Add(function);

        if (function == "print_integer")
        {
            _usedSymbols.Add("minus_sign");
        }
        else if (function == "print_integer_no_newline")
        {
            _usedSymbols.Add("minus_sign_nonl");
            _usedFunctions.Add("minus_sign_nonl");
        }
        else if (function == "print_string")
        {
            _usedSymbols.Add("newline_char");
        }
        else if (function == "print_rune")
        {
            _usedSymbols.Add("rune_newline");
        }
        else if (function == "print_bool")
        {
            _usedSymbols.Add("bool_newline");
            _usedSymbols.Add("true_string");
            _usedSymbols.Add("false_string");
        }
        else if (function == "concat_strings")
        {
            _usedSymbols.Add("heap_pointer");
        }
        else if (function == "string_equals")
        {
            _usedSymbols.Add("string_equals_done");
        }
        else if (function == "print_double")
        {
            // Asegurarnos de que se incluyan todas las dependencias
            _usedFunctions.Add("print_integer_no_newline");
        }
    }

    // Nuevo método para registrar funciones en la tabla de símbolos
    private void RegisterFunctionInSymbolTable(string functionName)
    {
        if (_functionReturnTypes.TryGetValue(functionName, out var returnType))
        {
            // Registrar la función en la tabla de símbolos
            Symbols.SymbolTableReport.Instance.AddSymbol(
                functionName,
                "Función estándar",
                returnType,
                "stdlib",
                -1, // No hay línea específica para funciones estándar
                -1  // No hay columna específica para funciones estándar
            );

            // Registrar los parámetros si existen
            if (_functionParameters.TryGetValue(functionName, out var parameters))
            {
                int paramIndex = 0;
                foreach (var (paramName, paramType) in parameters)
                {
                    // Registrar cada parámetro como un símbolo
                    Symbols.SymbolTableReport.Instance.AddSymbol(
                        $"{paramName}",
                        "Parámetro",
                        paramType,
                        $"{functionName}",
                        -1,
                        paramIndex  // Usar el índice como columna para distinguir el orden
                    );
                    paramIndex++;
                }
            }
        }
    }

    public string GetFunctionDefinitions()
    {
        var functions = new List<string>();

        foreach (var function in _usedFunctions)
        {
            if (FunctionDefinitions.TryGetValue(function, out var definition))
            {
                functions.Add(definition);
            }
        }

        var fnDefs = string.Join("\n\n", functions);
        var symbols = new List<string>();
        foreach (var symbol in _usedSymbols)
        {
            if (FunctionDefinitions.TryGetValue(symbol, out var definition))
            {
                symbols.Add(definition);
            }
        }
        var symbolDefs = string.Join("\n\n", symbols);

        return fnDefs + "\n\n" + symbolDefs;
    }

    private readonly static Dictionary<string, string> FunctionDefinitions = new Dictionary<string, string>
    {
    { "print_integer", @"
//--------------------------------------------------------------
// print_integer - Prints a signed integer to stdout
//
// Input:
//   x0 - The integer value to print
//--------------------------------------------------------------
print_integer:
    // Save registers
    stp x29, x30, [sp, #-16]!  // Save frame pointer and link register
    stp x19, x20, [sp, #-16]!  // Save callee-saved registers
    stp x21, x22, [sp, #-16]!
    stp x23, x24, [sp, #-16]!
    stp x25, x26, [sp, #-16]!
    stp x27, x28, [sp, #-16]!
    
    // Check if number is negative
    mov x19, x0                // Save original number
    cmp x19, #0                // Compare with zero
    bge positive_number        // Branch if greater or equal to zero
    
    // Handle negative number
    mov x0, #1                 // fd = 1 (stdout)
    adr x1, minus_sign         // Address of minus sign
    mov x2, #1                 // Length = 1
    mov w8, #64                // Syscall write
    svc #0
    
    neg x19, x19               // Make number positive
    
positive_number:
    // Prepare buffer for converting result to ASCII
    sub sp, sp, #32            // Reserve space on stack
    mov x22, sp                // x22 points to buffer
    
    // Initialize digit counter
    mov x23, #0                // Digit counter
    
    // Handle special case for zero
    cmp x19, #0
    bne convert_loop
    
    // If number is zero, just write '0'
    mov w24, #48               // ASCII '0'
    strb w24, [x22, x23]       // Store in buffer
    add x23, x23, #1           // Increment counter
    b print_result             // Skip conversion loop
    
convert_loop:
    // Divide the number by 10
    mov x24, #10
    udiv x25, x19, x24         // x25 = x19 / 10 (quotient)
    msub x26, x25, x24, x19    // x26 = x19 - (x25 * 10) (remainder)
    
    // Convert remainder to ASCII and store in buffer
    add x26, x26, #48          // Convert to ASCII ('0' = 48)
    strb w26, [x22, x23]       // Store digit in buffer
    add x23, x23, #1           // Increment digit counter
    
    // Prepare for next iteration
    mov x19, x25               // Quotient becomes the new number
    cbnz x19, convert_loop     // If number is not zero, continue
    
    // Reverse the buffer since digits are in reverse order
    mov x27, #0                // Start index
reverse_loop:
    sub x28, x23, x27          // x28 = length - current index
    sub x28, x28, #1           // x28 = length - current index - 1
    
    cmp x27, x28               // Compare indices
    bge print_result           // If crossed, finish reversing
    
    // Swap characters
    ldrb w24, [x22, x27]       // Load character from start
    ldrb w25, [x22, x28]       // Load character from end
    strb w25, [x22, x27]       // Store end character at start
    strb w24, [x22, x28]       // Store start character at end
    
    add x27, x27, #1           // Increment start index
    b reverse_loop             // Continue reversing
    
print_result:
    // Add newline
    mov w24, #10               // Newline character
    strb w24, [x22, x23]       // Add to end of buffer
    add x23, x23, #1           // Increment counter
    
    // Print the result
    mov x0, #1                 // fd = 1 (stdout)
    mov x1, x22                // Buffer address
    mov x2, x23                // Buffer length
    mov w8, #64                // Syscall write
    svc #0
    
    // Clean up and restore registers
    add sp, sp, #32            // Free buffer space
    ldp x27, x28, [sp], #16    // Restore callee-saved registers
    ldp x25, x26, [sp], #16
    ldp x23, x24, [sp], #16
    ldp x21, x22, [sp], #16
    ldp x19, x20, [sp], #16
    ldp x29, x30, [sp], #16    // Restore frame pointer and link register
    ret                        // Return to caller

minus_sign:
    .ascii ""-""               // Minus sign"
    },

    { "print_integer_no_newline", @"
//--------------------------------------------------------------
// print_integer_no_newline - Prints a signed integer to stdout without newline
//
// Input:
//   x0 - The integer value to print
//--------------------------------------------------------------
print_integer_no_newline:
    // Save registers
    stp x29, x30, [sp, #-16]!  // Save frame pointer and link register
    stp x19, x20, [sp, #-16]!  // Save callee-saved registers
    stp x21, x22, [sp, #-16]!
    stp x23, x24, [sp, #-16]!
    stp x25, x26, [sp, #-16]!
    stp x27, x28, [sp, #-16]!
    
    // Check if number is negative
    mov x19, x0                // Save original number
    cmp x19, #0                // Compare with zero
    bge positive_number_nonl   // Branch if greater or equal to zero
    
    // Handle negative number
    mov x0, #1                 // fd = 1 (stdout)
    adr x1, minus_sign_nonl    // Address of minus sign
    mov x2, #1                 // Length = 1
    mov w8, #64                // Syscall write
    svc #0
    
    neg x19, x19               // Make number positive
    
positive_number_nonl:
    // Prepare buffer for converting result to ASCII
    sub sp, sp, #32            // Reserve space on stack
    mov x22, sp                // x22 points to buffer
    
    // Initialize digit counter
    mov x23, #0                // Digit counter
    
    // Handle special case for zero
    cmp x19, #0
    bne convert_loop_nonl
    
    // If number is zero, just write '0'
    mov w24, #48               // ASCII '0'
    strb w24, [x22, x23]       // Store in buffer
    add x23, x23, #1           // Increment counter
    b print_result_nonl        // Skip conversion loop
    
convert_loop_nonl:
    // Divide the number by 10
    mov x24, #10
    udiv x25, x19, x24         // x25 = x19 / 10 (quotient)
    msub x26, x25, x24, x19    // x26 = x19 - (x25 * 10) (remainder)
    
    // Convert remainder to ASCII and store in buffer
    add x26, x26, #48          // Convert to ASCII ('0' = 48)
    strb w26, [x22, x23]       // Store digit in buffer
    add x23, x23, #1           // Increment digit counter
    
    // Prepare for next iteration
    mov x19, x25               // Quotient becomes the new number
    cbnz x19, convert_loop_nonl // If number is not zero, continue
    
    // Reverse the buffer since digits are in reverse order
    mov x27, #0                // Start index
reverse_loop_nonl:
    sub x28, x23, x27          // x28 = length - current index
    sub x28, x28, #1           // x28 = length - current index - 1
    
    cmp x27, x28               // Compare indices
    bge print_result_nonl      // If crossed, finish reversing
    
    // Swap characters
    ldrb w24, [x22, x27]       // Load character from start
    ldrb w25, [x22, x28]       // Load character from end
    strb w25, [x22, x27]       // Store end character at start
    strb w24, [x22, x28]       // Store start character at end
    
    add x27, x27, #1           // Increment start index
    b reverse_loop_nonl        // Continue reversing
    
print_result_nonl:
    // Print the result WITHOUT newline
    mov x0, #1                 // fd = 1 (stdout)
    mov x1, x22                // Buffer address
    mov x2, x23                // Buffer length
    mov w8, #64                // Syscall write
    svc #0
    
    // Clean up and restore registers
    add sp, sp, #32            // Free buffer space
    ldp x27, x28, [sp], #16    // Restore callee-saved registers
    ldp x25, x26, [sp], #16
    ldp x23, x24, [sp], #16
    ldp x21, x22, [sp], #16
    ldp x19, x20, [sp], #16
    ldp x29, x30, [sp], #16    // Restore frame pointer and link register
    ret                        // Return to caller

minus_sign_nonl:
    .ascii ""-""               // Minus sign
" },

    { "print_string", @"
//--------------------------------------------------------------
// print_string - Prints a null-terminated string to stdout
//
// Input:
//   x0 - The address of the null-terminated string to print
//--------------------------------------------------------------
print_string:
    // Save link register and other registers we'll use
    stp     x29, x30, [sp, #-16]!
    stp     x19, x20, [sp, #-16]!
    stp     x21, x22, [sp, #-16]!  // Registros adicionales para manejar escapes
    
    // x19 will hold the string address
    mov     x19, x0
    // x21 para control de modo de escape
    mov     x21, #0             // 0 = modo normal, 1 = modo escape

print_loop:
    // Load a byte from the string
    ldrb    w20, [x19]     // Load byte

    // Check for null terminator
    cbz w20, print_done

    // Check if we're in escape mode
    cmp x21, #1
    beq handle_escape

    // Check if this is an escape character
    cmp w20, #92           // ASCII code for '\'
    bne print_char
    
    // Enter escape mode
    mov x21, #1
    add x19, x19, #1       // Move to next character
    b print_loop

handle_escape:
    // Reset escape mode
    mov x21, #0
    
    // Handle different escape sequences
    cmp w20, #110          // 'n'
    bne check_t
    mov w20, #10           // Newline ASCII
    b print_char
    
check_t:
    cmp w20, #116          // 't'
    bne check_r
    mov w20, #9            // Tab ASCII
    b print_char
    
check_r:
    cmp w20, #114          // 'r'
    bne check_backslash
    mov w20, #13           // Carriage return ASCII
    b print_char
    
check_backslash:
    cmp w20, #92           // '\'
    bne print_char         // If not recognized, print as-is
    // w20 already holds '\' ASCII, so just continue

print_char:
    // Prepare for write syscall
    mov     x0, #1         // File descriptor (stdout)
    sub     sp, sp, #16    // Reservar espacio temporal para el carácter
    mov     x22, sp        // Apuntar x22 al espacio temporal
    strb    w20, [x22]     // Almacenar el carácter

    mov     x1, x22        // Address of the character
    mov     x2, #1         // Number of bytes to write
    mov     w8, #64        // Syscall number for write
    svc     #0             // Make syscall
    
    add     sp, sp, #16    // Liberar espacio temporal

    // Move to the next character
    add     x19, x19, #1

    // Continue loop
    b       print_loop    
print_done:
    // Eliminar la adición del newline
    // El salto de línea lo agregará VisitPrintStatement al final de toda la instrucción fmt.Println

    // Clean up and restore registers
    ldp     x21, x22, [sp], #16
    ldp     x19, x20, [sp], #16
    ldp     x29, x30, [sp], #16
    ret
    // Return to caller

newline_char:
    .ascii ""\n""          // Newline character"
    },

    { "print_rune", @"
//--------------------------------------------------------------
// print_rune - Prints a rune (Unicode character) to stdout
//
// Input:
//   x0 - The rune value to print
//--------------------------------------------------------------
print_rune:
    // Save registers
    stp x29, x30, [sp, #-16]!  // Save frame pointer and link register
    stp x19, x20, [sp, #-16]!  // Save callee-saved registers
    stp x21, x22, [sp, #-16]!
    
    // Save the rune value in a callee-saved register
    mov x19, x0
    
    // Prepare buffer for UTF-8 encoding
    sub sp, sp, #16            // Reserve space on stack
    mov x20, sp                // x20 points to buffer
    
    // Initialize byte count
    mov x21, #0                // Counter for number of bytes
    
    // Check rune value range to determine UTF-8 encoding
    cmp x19, #0x80             // Check if value <= 127 (ASCII)
    bge multi_byte_rune
    
    // Single byte rune (ASCII)
    strb w19, [x20]            // Store the byte
    mov x21, #1                // Set byte count to 1
    b print_rune_bytes
    
multi_byte_rune:
    cmp x19, #0x0800           // Check if value < 0x0800
    bge three_byte_rune
    
    // Two-byte rune
    mov w22, w19               // Copy rune value
    and w22, w22, #0x3F        // Keep 6 low bits
    orr w22, w22, #0x80        // Add 10xx xxxx marker
    strb w22, [x20, #1]        // Store second byte
    
    lsr x22, x19, #6           // Shift right by 6
    orr w22, w22, #0xC0        // Add 110x xxxx marker
    strb w22, [x20]            // Store first byte
    
    mov x21, #2                // Set byte count to 2
    b print_rune_bytes
    
three_byte_rune:
    cmp x19, #0x10000          // Check if value < 0x10000
    bge four_byte_rune
    
    // Three-byte rune
    mov w22, w19               // Copy rune value
    and w22, w22, #0x3F        // Keep 6 low bits
    orr w22, w22, #0x80        // Add 10xx xxxx marker
    strb w22, [x20, #2]        // Store third byte
    
    mov w22, w19, lsr #6       // Shift right by 6
    and w22, w22, #0x3F        // Keep 6 bits
    orr w22, w22, #0x80        // Add 10xx xxxx marker
    strb w22, [x20, #1]        // Store second byte
    
    mov w22, w19, lsr #12      // Shift right by 12
    orr w22, w22, #0xE0        // Add 1110 xxxx marker
    strb w22, [x20]            // Store first byte
    
    mov x21, #3                // Set byte count to 3
    b print_rune_bytes
    
four_byte_rune:
    // Four-byte rune
    mov w22, w19               // Copy rune value
    and w22, w22, #0x3F        // Keep 6 low bits
    orr w22, w22, #0x80        // Add 10xx xxxx marker
    strb w22, [x20, #3]        // Store fourth byte
    
    mov w22, w19, lsr #6       // Shift right by 6
    and w22, w22, #0x3F        // Keep 6 bits
    orr w22, w22, #0x80        // Add 10xx xxxx marker
    strb w22, [x20, #2]        // Store third byte
    
    mov w22, w19, lsr #12      // Shift right by 12
    and w22, w22, #0x3F        // Keep 6 bits
    orr w22, w22, #0x80        // Add 10xx xxxx marker
    strb w22, [x20, #1]        // Store second byte
    
    mov w22, w19, lsr #18      // Shift right by 18
    orr w22, w22, #0xF0        // Add 1111 0xxx marker
    strb w22, [x20]            // Store first byte
    
    mov x21, #4                // Set byte count to 4
    
print_rune_bytes:
    // Print the UTF-8 bytes
    mov x0, #1                 // fd = 1 (stdout)
    mov x1, x20                // Buffer address
    mov x2, x21                // Buffer length (number of bytes)
    mov w8, #64                // Syscall write
    svc #0
    
    // Eliminar la adición del newline
    // El salto de línea lo agregará VisitPrintStatement al final de toda la instrucción fmt.Println
    
    // Clean up and restore registers
    add sp, sp, #16            // Free buffer space
    ldp x21, x22, [sp], #16    // Restore callee-saved registers
    ldp x19, x20, [sp], #16    // Restore callee-saved registers
    ldp x29, x30, [sp], #16    // Restore frame pointer and link register
    ret                        // Return to caller

rune_newline:
    .ascii ""\n""              // Newline character"
    },

    { "print_bool", @"
//--------------------------------------------------------------
// print_bool - Prints a boolean value as 'true' or 'false'
//
// Input:
//   x0 - The boolean value to print (0 = false, non-zero = true)
//--------------------------------------------------------------
print_bool:
    // Save registers
    stp x29, x30, [sp, #-16]!  // Save frame pointer and link register
    stp x19, x20, [sp, #-16]!  // Save callee-saved registers
    
    // Check if value is zero (false) or non-zero (true)
    cbnz x0, print_true        // If non-zero, print true
    
    // Print ""false""
    mov x0, #1                 // fd = 1 (stdout)
    adr x1, false_string       // Address of ""false"" string
    mov x2, #5                 // Length = 5 (f-a-l-s-e)
    mov w8, #64                // Syscall write
    svc #0
    b print_bool_done
    
print_true:
    // Print ""true""
    mov x0, #1                 // fd = 1 (stdout)
    adr x1, true_string        // Address of ""true"" string
    mov x2, #4                 // Length = 4 (t-r-u-e)
    mov w8, #64                // Syscall write
    svc #0
    
print_bool_done:
    // Eliminar la adición del newline
    // El salto de línea lo agregará VisitPrintStatement al final de toda la instrucción fmt.Println
    
    // Restore registers and return
    ldp x19, x20, [sp], #16    // Restore callee-saved registers
    ldp x29, x30, [sp], #16    // Restore frame pointer and link register
    ret                        // Return to caller

true_string:
    .ascii ""true""            // ""true"" string
    
false_string:
    .ascii ""false""           // ""false"" string
    
bool_newline:
    .ascii ""\n""              // Newline character"
    },

    { "concat_strings", @"
//--------------------------------------------------------------
// concat_strings - Concatenates two strings
//
// Input:
//   x0 - Address of the first string
//   x1 - Address of the second string
//
// Output:
//   x0 - Address of the concatenated string (in heap)
//--------------------------------------------------------------
concat_strings:
    // Save registers
    stp x29, x30, [sp, #-16]!  // Save frame pointer and link register
    stp x19, x20, [sp, #-16]!  // Save callee-saved registers
    stp x21, x22, [sp, #-16]!
    stp x23, x24, [sp, #-16]!
    
    // x19 will hold the first string address
    mov x19, x0
    // x20 will hold the second string address
    mov x20, x1
    
    // Calculate length of first string
    mov x21, #0                // Initialize counter for first string length
len_first_loop:
    ldrb w0, [x19, x21]        // Load byte from string
    cbz w0, len_first_done     // If zero (end of string), exit loop
    add x21, x21, #1           // Increment counter
    b len_first_loop           // Continue loop
len_first_done:
    
    // Calculate length of second string
    mov x22, #0                // Initialize counter for second string length
len_second_loop:
    ldrb w0, [x20, x22]        // Load byte from string
    cbz w0, len_second_done    // If zero (end of string), exit loop
    add x22, x22, #1           // Increment counter
    b len_second_loop          // Continue loop
len_second_done:
    
    // Calculate total size needed
    add x23, x21, x22
    add x23, x23, #1           // Add 1 for the NULL terminator
    
    // Get heap pointer (assumed to be in x10)
    mov x24, x10               // Save current heap pointer for our result
    add x10, x10, x23          // Advance heap pointer for next allocation
    
    // Copy first string to the result
    mov x0, #0                 // Initialize index
copy_first_loop:
    cmp x0, x21                // Compare with length of first string
    beq copy_first_done        // If equal, we're done
    ldrb w1, [x19, x0]         // Load byte from first string
    strb w1, [x24, x0]         // Store byte to result
    add x0, x0, #1             // Increment index
    b copy_first_loop          // Continue loop
copy_first_done:

    // Copy second string to the result (append)
    mov x0, #0                 // Initialize index for second string
copy_second_loop:
    cmp x0, x22                // Compare with length of second string
    beq copy_second_done       // If equal, we're done
    ldrb w1, [x20, x0]         // Load byte from second string
    add x2, x0, x21            // Calculate position in result (offset by length of first string)
    strb w1, [x24, x2]         // Store byte to result
    add x0, x0, #1             // Increment index
    b copy_second_loop          // Continue loop
copy_second_done:

    // Add null terminator
    add x0, x21, x22           // Calculate position for null terminator
    mov w1, #0                 // Null byte
    strb w1, [x24, x0]         // Store null terminator
    
    // Return pointer to concatenated string
    mov x0, x24
    
    // Clean up and restore registers
    ldp x23, x24, [sp], #16
    ldp x21, x22, [sp], #16
    ldp x19, x20, [sp], #16
    ldp x29, x30, [sp], #16
    ret
" },

    { "string_equals", @"
//--------------------------------------------------------------
// string_equals - Compares two strings for equality
//
// Input:
//   x0 - Address of the first string
//   x1 - Address of the second string
//
// Output:
//   x0 - 1 if strings are equal, 0 if not equal
//--------------------------------------------------------------
string_equals:
    // Save registers
    stp x29, x30, [sp, #-16]!  // Save frame pointer and link register
    stp x19, x20, [sp, #-16]!  // Save callee-saved registers
    stp x21, x22, [sp, #-16]!  // Save more callee-saved registers
    
    // x19 will hold the first string address
    mov x19, x0
    // x20 will hold the second string address
    mov x20, x1
    
compare_loop:
    // Load bytes from both strings
    ldrb w21, [x19], #1        // Load byte from first string and advance pointer
    ldrb w22, [x20], #1        // Load byte from second string and advance pointer
    
    // Check if bytes are different
    cmp w21, w22
    bne strings_not_equal
    
    // Check if we've reached the end of both strings
    cbz w21, strings_equal     // If current byte is zero and both are equal so far
    
    // Continue comparing
    b compare_loop
    
strings_equal:
    // Strings are equal
    mov x0, #1                 // Return true (1)
    b string_equals_done
    
strings_not_equal:
    // Strings are not equal
    mov x0, #0                 // Return false (0)
    
string_equals_done:
    // Restore registers and return
    ldp x21, x22, [sp], #16    // Restore callee-saved registers
    ldp x19, x20, [sp], #16    // Restore callee-saved registers
    ldp x29, x30, [sp], #16    // Restore frame pointer and link register
    ret                        // Return to caller
"
    },
    { "float_mod", @"
//--------------------------------------------------------------
// float_mod - Calcula el módulo de dos valores de punto flotante (fmod)
//
// Input:
//   d0 - Dividendo (x)
//   d1 - Divisor (y)
//
// Output:
//   d0 - El resto de la división (x mod y)
//--------------------------------------------------------------
float_mod:
    // Guardar registros
    stp x29, x30, [sp, #-16]!  // Guardar frame pointer y link register
    stp x19, x20, [sp, #-16]!  // Guardar registros callee-saved
    stp d8, d9, [sp, #-16]!    // Guardar registros SIMD/FP

    // Guardar los operandos en registros seguros
    fmov d8, d0                // d8 = x (dividendo)
    fmov d9, d1                // d9 = y (divisor)

    // Calcular x / y
    fdiv d0, d8, d9            // d0 = x / y
    
    // Truncar hacia cero para obtener el cociente entero
    frintm d0, d0              // Redondear hacia -∞
    
    // Multiplicar el cociente entero por el divisor
    fmul d0, d0, d9            // d0 = (int)(x / y) * y
    
    // Restar del dividendo original para obtener el módulo
    fsub d0, d8, d0            // d0 = x - (int)(x / y) * y
    
    // Restaurar registros y retornar
    ldp d8, d9, [sp], #16      // Restaurar registros SIMD/FP
    ldp x19, x20, [sp], #16    // Restaurar registros callee-saved
    ldp x29, x30, [sp], #16    // Restaurar frame pointer y link register
    ret                        // Retornar a caller
" },

    { "print_double", @"
//--------------------------------------------------------------
// print_double - Prints a double value to stdout
// 
// Input:
//    d0 - The double value to print
//--------------------------------------------------------------
print_double:
    // Save context
    stp x29, x30, [sp, #-16]!  // Save frame pointer and link register
    stp x19, x20, [sp, #-16]!  // Save callee-saved registers
    stp x21, x22, [sp, #-16]!  // Save more callee-saved registers
    stp x23, x24, [sp, #-16]!  // Save even more callee-saved registers

    // Check if number is negative
    fmov x19, d0                // Save original number
    tst x19, #(1 << 63)         // Check sign bit
    beq skip_minus              // Branch if not negative (equal to zero test)

    // Print minus sign
    mov x0, #1                 // fd = 1 (stdout)
    adr x1, minus_sign         // Address of minus sign
    mov x2, #1                 // Length = 1
    mov w8, #64                // Syscall write
    svc #0

    // Make value positive
    fneg d0, d0                // Negate the double value

skip_minus:
    // Save original value in d7 for later use
    fmov d7, d0

    // Convert integer part
    fcvtzs x0, d0              // Convert double to signed integer
    scvtf d1, x0               // Convert back to float to get the integer part only
    
    // Print integer part WITHOUT newline
    bl print_integer_no_newline // Call modified function

    // Get the fractional part (d2 = d0 - integer part)
    fsub d2, d7, d1            

    // Check if the fractional part is zero
    fcmp d2, #0.0
    beq exit_function          // Si la parte fraccional es cero, saltar a la salida (sin salto de línea)

    // Print dot
    mov x0, #1                 // fd = 1 (stdout)
    adr x1, dot_char           // Address of dot character
    mov x2, #1                 // Length = 1
    mov x8, #64                // Syscall write
    svc #0                     // Print dot

    // Multiply by precision (6 digits after decimal)
    movz x1, #0x000F, lsl #16  // 0x000F0000
    movk x1, #0x4240, lsl #0   // x1 = 1000000 (1e6)
    scvtf d3, x1               // d3 = 1000000.0
    fmul d2, d2, d3            // d2 = frac * 1000000.0

    // Round to nearest integer    
    frintn d2, d2              // Round to nearest integer
    fcvtzs x0, d2              // Convert double to signed integer 
    
    // Remove trailing zeros if needed
    // x0 now contains fractional part * 1000000
    mov x19, x0                // Save in x19
    cbz x19, exit_function     // Si es cero, saltar a la salida (sin salto de línea)

    // Count trailing zeros
    mov x21, #10               // Divisor
    mov x22, #0                // Counter for trailing zeros
    mov x20, x19               // Working copy

trailing_zeros_loop:
    // Check if number is divisible by 10 with no remainder
    udiv x23, x20, x21         // x23 = x20 / 10
    msub x24, x23, x21, x20    // x24 = x20 - (x23 * 10) = remainder
    cbnz x24, print_frac_part  // If there's a remainder, we're done counting

    // No remainder, so it's trailing zero
    udiv x20, x20, x21         // Remove last digit
    add x22, x22, #1           // Increment counter
    cbnz x20, trailing_zeros_loop // Continue if not zero
    b exit_function            // Si solo hay ceros, saltar a la salida (sin salto de línea)

print_frac_part:
    // Calculate divisor to remove trailing zeros
    mov x20, #1                // Start with divisor = 1
    mov x24, x22               // Copy counter to x24

calc_divisor_loop:
    cbz x24, print_adjusted_frac // If counter is zero, we're done
    mul x20, x20, x21          // Multiply by 10
    sub x24, x24, #1           // Decrement counter
    b calc_divisor_loop        // Continue

print_adjusted_frac:
    // Divide by calculated divisor to remove trailing zeros
    udiv x0, x19, x20          // x0 = adjusted fractional part
    bl print_integer_no_newline // Print fractional part WITHOUT newline

exit_function:
    // Eliminar la adición del newline
    // El salto de línea lo agregará VisitPrintStatement al final de toda la instrucción fmt.Println
    
    // Restore context
    ldp x23, x24, [sp], #16    // Restore callee-saved registers
    ldp x21, x22, [sp], #16    // Restore callee-saved registers
    ldp x19, x20, [sp], #16    // Restore callee-saved registers
    ldp x29, x30, [sp], #16    // Restore frame pointer and link register
    ret                        // Return to caller

dot_char:
    .ascii ""."" 

nl_char:
    .ascii ""\n""              // Newline character
" }
};
}