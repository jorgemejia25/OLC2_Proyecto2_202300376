public class StandardLibrary
{
    private readonly HashSet<string> _usedFunctions = new HashSet<string>();

    public void Use(string function)
    {
        System.Console.WriteLine($"Using function: {function}");
        _usedFunctions.Add(function);
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


        return string.Join("\n\n", functions);
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
    // Add newline
    mov     x0, #1         // File descriptor (stdout)
    adr     x1, newline_char // Address of the newline character
    mov     x2, #1         // Number of bytes to write
    mov     w8, #64        // Syscall number for write
    svc     #0             // Make syscall

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
    
    // Add newline
    mov x0, #1                 // fd = 1 (stdout)
    adr x1, rune_newline       // Address of newline character
    mov x2, #1                 // Length = 1
    mov w8, #64                // Syscall write
    svc #0
    
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
    b print_bool_newline
    
print_true:
    // Print ""true""
    mov x0, #1                 // fd = 1 (stdout)
    adr x1, true_string        // Address of ""true"" string
    mov x2, #4                 // Length = 4 (t-r-u-e)
    mov w8, #64                // Syscall write
    svc #0
    
print_bool_newline:
    // Add newline
    mov x0, #1                 // fd = 1 (stdout)
    adr x1, bool_newline       // Address of newline character
    mov x2, #1                 // Length = 1
    mov w8, #64                // Syscall write
    svc #0
    
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
    }
};
}