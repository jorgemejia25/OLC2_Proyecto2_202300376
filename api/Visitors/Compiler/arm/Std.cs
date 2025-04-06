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

        System.Console.WriteLine("Used functions:");
        foreach (var function in _usedFunctions)
        {
            System.Console.WriteLine(function);
        }

        // Asegurar que print_integer esté definido antes de print_string
        // para evitar problemas con saltos hacia adelante
        var orderedFunctions = new List<string>(_usedFunctions);
        if (orderedFunctions.Contains("print_integer") && orderedFunctions.Contains("print_string"))
        {
            orderedFunctions.Remove("print_integer");
            orderedFunctions.Insert(0, "print_integer");
        }

        foreach (var function in orderedFunctions)
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
.text
.balign 16                        // Alineación a 16 bytes para compatibilidad ABI ARM64
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
    
.align 4                       // Alinear etiqueta de destino
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
    
.align 4                       // Alinear etiqueta de destino
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

.align 4                       // Alinear etiqueta de destino
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
    
.align 4                       // Alinear etiqueta de destino
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

.align 4                       // Alinear datos
minus_sign:
    .ascii ""-""               // Minus sign"
        },
        { "print_string", @"
.text
.balign 16                        // Alineación a 16 bytes para compatibilidad ABI ARM64
//--------------------------------------------------------------
// print_string - Prints a string to stdout followed by a newline
//
// Input:
//   x0 - The address of the string
//   x1 - The length of the string
//--------------------------------------------------------------
print_string:
    // Save registers
    stp x29, x30, [sp, #-16]!  // Save frame pointer and link register
    stp x19, x20, [sp, #-16]!  // Save callee-saved registers
    stp x21, x22, [sp, #-16]!
    stp x23, x24, [sp, #-16]!
    stp x25, x26, [sp, #-16]!
    stp x27, x28, [sp, #-16]!
    
    // Save the string address and length
    mov x19, x0                // Save string address
    mov x20, x1                // Save string length
    
    // Write the string to stdout
    mov x0, #1                 // fd = 1 (stdout)
    mov x1, x19                // buffer address
    mov x2, x20                // buffer length
    mov w8, #64                // Syscall write
    svc #0
    
    // Write newline character
    mov x0, #1                 // fd = 1 (stdout)
    adr x1, newline            // Address of newline
    mov x2, #1                 // Length = 1
    mov w8, #64                // Syscall write
    svc #0
    
    // Restore registers
    ldp x27, x28, [sp], #16    // Restore callee-saved registers
    ldp x25, x26, [sp], #16
    ldp x23, x24, [sp], #16
    ldp x21, x22, [sp], #16
    ldp x19, x20, [sp], #16
    ldp x29, x30, [sp], #16    // Restore frame pointer and link register
    ret                        // Return to caller

.align 4                       // Alinear datos
newline:
    .ascii ""\n""               // Newline character"
        },
        {
            "print_float", @"
.text
.balign 16
//--------------------------------------------------------------
// print_float - Prints a float to stdout followed by a newline
//
// Input:
//   d0 - The float value to print
//--------------------------------------------------------------
print_float:
    // Save registers
    stp x29, x30, [sp, #-16]!  // Save frame pointer and link register
    stp x19, x20, [sp, #-16]!  // Save callee-saved registers
    stp x21, x22, [sp, #-16]!
    stp x23, x24, [sp, #-16]!
    stp d8, d9, [sp, #-16]!    // Save float registers
    
    // Save the float value
    fmov d8, d0
    
    // Print the integer part
    fcvtzs x19, d8            // Convert to integer (truncate toward zero)
    mov x0, x19
    
    // Integrado: print_int_part en lugar de usar bl
    // Handle negative numbers
    cmp x0, #0
    bge 1f  // branch a la etiqueta local 1 (positive_int)
    
    // Print minus sign
    mov x21, x0               // Save original number
    mov x0, #1                // fd = 1 (stdout)
    adr x1, float_minus       // Address of minus sign
    mov x2, #1                // Length = 1
    mov w8, #64               // Syscall write
    svc #0
    
    neg x0, x21               // Make number positive
    
1:  // positive_int:
    // Integrado: print_dec_int
    // Special case for zero
    cmp x0, #0
    bne 2f  // branch a no_zero
    
    mov x0, #1                // fd = 1 (stdout)
    adr x1, zero_char         // Address of '0'
    mov x2, #1                // Length = 1
    mov w8, #64               // Syscall write
    svc #0
    b 3f  // saltar a int_print_done
    
2:  // no_zero:
    // Convert integer to ASCII and print it
    mov x21, x0               // Save original number
    sub sp, sp, #32           // Reserve stack space
    mov x22, sp               // Stack buffer
    mov x23, #0               // String length
    
    // Convert to decimal string
int_convert_loop:
    mov x24, #10              // Divisor
    udiv x25, x21, x24        // Quotient
    msub x26, x25, x24, x21   // Remainder
    
    add x26, x26, #'0'        // Convert to ASCII
    strb w26, [x22, x23]      // Store in buffer
    add x23, x23, #1          // Increment length
    
    mov x21, x25              // Prepare for next iteration
    cbnz x21, int_convert_loop
    
    // Reverse the string
    mov x25, #0               // Start index
    sub x26, x23, #1          // End index
    
int_reverse_loop:
    cmp x25, x26
    bge int_print_buffer
    
    ldrb w27, [x22, x25]      // Load char from start
    ldrb w28, [x22, x26]      // Load char from end
    
    strb w28, [x22, x25]      // Swap
    strb w27, [x22, x26]
    
    add x25, x25, #1
    sub x26, x26, #1
    b int_reverse_loop
    
int_print_buffer:
    mov x0, #1                // fd = 1
    mov x1, x22               // buffer
    mov x2, x23               // length
    mov w8, #64               // write
    svc #0
    
    add sp, sp, #32           // Free buffer

3:  // int_print_done:
    
    // Print decimal point
    mov x0, #1                // fd = 1 (stdout)
    adr x1, decimal_point     // Address of decimal point
    mov x2, #1                // Length = 1
    mov w8, #64               // Syscall write
    svc #0
    
    // Print fractional part (6 decimal places)
    fmov d9, d8
    scvtf d9, x19            // Convert integer part back to float
    fsub d9, d8, d9          // Get fractional part
    
    // Redondeo para corregir problemas como 2.599999 vs 2.6
    // Multiplicamos por 10^7 en lugar de 10^6 para tener un dígito extra para el redondeo
    adr x0, ten_million_float
    ldr d8, [x0]             // Cargar 10^7 en d8
    fmul d9, d9, d8          // Multiplicar por 10^7
    
    // Redondeo adecuado: añadimos 0.5 y truncamos
    fmov d8, #0.5            // Cargamos 0.5 para redondeo
    fadd d9, d9, d8          // Sumamos 0.5 para redondeo
    
    // Convertir a entero (con truncamiento)
    fcvtzs x19, d9           // Convert to integer

    // Dividir por 10 para volver a 6 dígitos
    mov x20, #10
    udiv x19, x19, x20       // Dividir por 10
    
    // Handle negative fractional part
    cmp x19, #0
    bge print_fraction
    mov x19, #0              // If negative, set to zero
    
print_fraction:
    // Eliminar ceros no significativos de la parte fraccionaria
    mov x22, x19             // Copia del valor fraccionario
    mov x23, #10             // Divisor para eliminar dígitos
    mov x24, #6              // Contador inicial (máximo 6 dígitos)
    
trim_zeros:
    // Si ya sólo queda un dígito, no seguir recortando
    cmp x24, #1
    ble print_padded
    
    // Si el último dígito no es cero, no recortar más
    udiv x25, x22, x23        // División por 10
    msub x26, x25, x23, x22   // Obtener el resto (último dígito)
    cmp x26, #0
    bne print_padded
    
    // Eliminar el último dígito (que era cero)
    mov x22, x25              // Actualizar valor
    sub x24, x24, #1          // Reducir contador de dígitos
    b trim_zeros
    
print_padded:
    // Integrado: print_int_padded (implementación completa)
    mov x0, x19               // Valor original
    mov x21, x24              // Número de dígitos a imprimir
    
    // Count digits in x0
    mov x20, x0               // Copy of number
    mov x22, #0               // Digit counter
    
    // Special case for zero
    cmp x20, #0
    bne 4f // branch a count_digits
    mov x22, #1
    b 5f  // branch a pad_zeros
    
4:  // count_digits:
    cmp x20, #0
    beq 5f  // branch a pad_zeros
    mov x23, #10
    udiv x20, x20, x23
    add x22, x22, #1
    b 4b  // branch back a count_digits
    
5:  // pad_zeros:
    // Print leading zeros if needed
    cmp x22, x21
    bge 6f  // branch a print_frac_num
    
    sub x23, x21, x22         // Number of zeros needed
    
zero_loop:
    cmp x23, #0
    beq 6f  // branch a print_frac_num
    
    mov x0, #1                // fd = 1 (stdout)
    adr x1, zero_char         // Address of '0'
    mov x2, #1                // Length = 1
    mov w8, #64               // Syscall write
    svc #0
    
    sub x23, x23, #1
    b zero_loop
    
6:  // print_frac_num:
    // Imprimir el número fraccionario (ya con padding)
    mov x0, x19
    
    // Special case for zero
    cmp x0, #0
    bne 7f  // branch a not_zero_frac
    
    mov x0, #1                // fd = 1 (stdout)
    adr x1, zero_char         // Address of '0'
    mov x2, #1                // Length = 1
    mov w8, #64               // Syscall write
    svc #0
    b 8f  // branch a frac_done
    
7:  // not_zero_frac:
    // Convert to decimal and print
    sub sp, sp, #32           // Reserve stack space
    mov x20, sp               // Stack buffer
    mov x21, #0               // String length
    
frac_convert_loop:
    cmp x0, #0
    beq frac_done_convert
    
    mov x22, #10              // Divisor
    udiv x23, x0, x22         // Quotient
    msub x24, x23, x22, x0    // Remainder
    
    add x24, x24, #'0'        // Convert to ASCII
    strb w24, [x20, x21]      // Store in buffer
    add x21, x21, #1          // Increment length
    
    mov x0, x23               // Prepare for next iteration
    b frac_convert_loop
    
frac_done_convert:
    // Reverse the string
    mov x23, #0               // Start index
    sub x24, x21, #1          // End index
    
frac_reverse_loop:
    cmp x23, x24
    bge frac_print_buffer
    
    ldrb w25, [x20, x23]      // Load char from start
    ldrb w26, [x20, x24]      // Load char from end
    
    strb w26, [x20, x23]      // Swap
    strb w25, [x20, x24]
    
    add x23, x23, #1
    sub x24, x24, #1
    b frac_reverse_loop
    
frac_print_buffer:
    mov x0, #1                // fd = 1
    mov x1, x20               // buffer
    mov x2, x21               // length
    mov w8, #64               // write
    svc #0
    
    add sp, sp, #32           // Free buffer

8:  // frac_done:
    
    // Print newline
    mov x0, #1                // fd = 1 (stdout)
    adr x1, float_newline     // Address of newline
    mov x2, #1                // Length = 1
    mov w8, #64               // Syscall write
    svc #0
    
    // Restore registers
    ldp d8, d9, [sp], #16     // Restore float registers
    ldp x23, x24, [sp], #16   // Restore callee-saved registers
    ldp x21, x22, [sp], #16
    ldp x19, x20, [sp], #16
    ldp x29, x30, [sp], #16   // Restore frame pointer and link register
    ret                       // Return to caller

.align 4
decimal_point:
    .ascii "".""
    
.align 4
float_minus:
    .ascii ""-""               // Minus sign

.align 4
float_newline:
    .ascii ""\n""               // Newline

.align 4
zero_char:
    .ascii ""0""               // Zero character for padding

.align 8
million_float:
    .double 1000000.0          // Valor de 10^6 para precisión

.align 8
ten_million_float:
    .double 10000000.0         // Valor de 10^7 para precisión y redondeo
    "              // Decimal point

        }
    };
}