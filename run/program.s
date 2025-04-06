.text
.balign 16       // Alineamiento para sección de código
.global _start
_start:
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// AddSub operation
// Visiting left operand
// AddSub operation
// Visiting left operand
// MulDiv operation
// Visiting left operand
// Constant 2
MOV x0, #2
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 2
MOV x0, #2
STR x0, [SP, #-8]!
// Floating point operation
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Converting both integer operands to float
SCVTF d0, x0
SCVTF d1, x1
FDIV d0, d0, d1
FMOV x0, d0
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Floating point operation
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Converting right operand from int to float
FMOV d0, x0
SCVTF d1, x1
FADD d0, d0, d1
FMOV x0, d0
STR x0, [SP, #-8]!
// Visiting right operand
// Float constant 5.0
// Load constant 4617315517961601024 (0x4014000000000000)
MOVZ x0, #0
MOVK x0, #0, LSL #16
MOVK x0, #0, LSL #32
MOVK x0, #16404, LSL #48
STR x0, [SP, #-8]!
// Floating point operation
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
FMOV d0, x0
FMOV d1, x1
FADD d0, d0, d1
FMOV x0, d0
STR x0, [SP, #-8]!
// Popping float value
LDR x0, [SP], #8
.balign 16     // Garantizar alineamiento a 16 bytes
FMOV D0, x0
BL print_float
.balign 16     // Garantizar alineamiento después de llamada a función
.balign 16     // Garantizar alineamiento a 16 bytes
.balign 16       // Alineamiento para código de salida
// Program Exit
    MOV X0, #0
    MOV X8, #93
    SVC #0


// Standard Library Functions

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
    .ascii "."
    
.align 4
float_minus:
    .ascii "-"               // Minus sign

.align 4
float_newline:
    .ascii "\n"               // Newline

.align 4
zero_char:
    .ascii "0"               // Zero character for padding

.align 8
million_float:
    .double 1000000.0          // Valor de 10^6 para precisión

.align 8
ten_million_float:
    .double 10000000.0         // Valor de 10^7 para precisión y redondeo
    
