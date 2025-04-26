.data
heap: .space 4096
.text
.balign 16       // Alineamiento para sección de código
.global _start
_start:
    adr x10, heap
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: División
STR x10, [SP, #-8]!
// Pushing character 0: 68
MOV w0, #68
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 118
MOV w0, #118
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 243
MOV w0, #243
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Popping value 1 for printing
LDR x0, [SP], #8
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
BL print_string
.balign 16     // Garantizar alineamiento después de llamada a función
// Adding newline at end
// Print newline character
MOV X0, #1
SUB SP, SP, #16
MOV W1, #10
STRB W1, [SP]
MOV X1, SP
MOV X2, #1
MOV W8, #64
SVC #0
ADD SP, SP, #16
// Implicit declaration: resultadoDiv1
// MulDiv operation
// Visiting left operand
// Constant 10
MOV x0, #10
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 2
MOV x0, #2
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Converting operands to float if needed
// Converting left operand from int to float
SCVTF d0, x0
// Converting right operand from int to float
SCVTF d1, x1
// Performing float / operation
FDIV d0, d0, d1
// Pushing float result
STR d0, [SP, #-8]!
// Implicit declaration: resultadoDiv2
// MulDiv operation
// Visiting left operand
// Float constant: 10.0
// Loading float value: 10 (hex: 0x4024000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4024, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Visiting right operand
// Float constant: 4.0
// Loading float value: 4 (hex: 0x4010000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4010, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Popping operands
LDR d1, [SP], #8
LDR d0, [SP], #8
// Converting operands to float if needed
// Performing float / operation
FDIV d0, d0, d1
// Pushing float result
STR d0, [SP, #-8]!
// Implicit declaration: resultadoDiv3
// MulDiv operation
// Visiting left operand
// Constant 10
MOV x0, #10
STR x0, [SP, #-8]!
// Visiting right operand
// Float constant: 4.0
// Loading float value: 4 (hex: 0x4010000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4010, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Popping operands
LDR d1, [SP], #8
LDR x0, [SP], #8
// Converting operands to float if needed
// Converting left operand from int to float
SCVTF d0, x0
// Performing float / operation
FDIV d0, d0, d1
// Pushing float result
STR d0, [SP, #-8]!
// Implicit declaration: resultadoDiv4
// MulDiv operation
// Visiting left operand
// Float constant: 10.0
// Loading float value: 10 (hex: 0x4024000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4024, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Visiting right operand
// Constant 4
MOV x0, #4
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR d0, [SP], #8
// Converting operands to float if needed
// Converting right operand from int to float
SCVTF d1, x1
// Performing float / operation
FDIV d0, d0, d1
// Pushing float result
STR d0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: 10 / 2 =
STR x10, [SP, #-8]!
// Pushing character 0: 49
MOV w0, #49
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 48
MOV w0, #48
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 47
MOV w0, #47
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 50
MOV w0, #50
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Popping value 1 for printing
LDR x0, [SP], #8
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
BL print_string
.balign 16     // Garantizar alineamiento después de llamada a función
// Printing space between values
// Print space character
MOV X0, #1
SUB SP, SP, #16
MOV W1, #32
STRB W1, [SP]
MOV X1, SP
MOV X2, #1
MOV W8, #64
SVC #0
ADD SP, SP, #16
// Processing expression 2 of 2
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Popping value 2 for printing
LDR x0, [SP], #8
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
BL print_integer_no_newline
.balign 16     // Garantizar alineamiento después de llamada a función
// Adding newline at end
// Print newline character
MOV X0, #1
SUB SP, SP, #16
MOV W1, #10
STRB W1, [SP]
MOV X1, SP
MOV X2, #1
MOV W8, #64
SVC #0
ADD SP, SP, #16
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: 10.0 / 4.0 =
STR x10, [SP, #-8]!
// Pushing character 0: 49
MOV w0, #49
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 48
MOV w0, #48
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 46
MOV w0, #46
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 48
MOV w0, #48
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 47
MOV w0, #47
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 52
MOV w0, #52
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 46
MOV w0, #46
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 48
MOV w0, #48
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Popping value 1 for printing
LDR x0, [SP], #8
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
BL print_string
.balign 16     // Garantizar alineamiento después de llamada a función
// Printing space between values
// Print space character
MOV X0, #1
SUB SP, SP, #16
MOV W1, #32
STRB W1, [SP]
MOV X1, SP
MOV X2, #1
MOV W8, #64
SVC #0
ADD SP, SP, #16
// Processing expression 2 of 2
// Loading variable 'resultadoDiv2'
// Calculating offset for variable 'resultadoDiv2'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoDiv2'
STR x0, [SP, #-8]!
// Popping value 2 for printing
LDR d0, [SP], #8
.balign 16     // Garantizar alineamiento a 16 bytes
BL print_double
.balign 16     // Garantizar alineamiento después de llamada a función
// Adding newline at end
// Print newline character
MOV X0, #1
SUB SP, SP, #16
MOV W1, #10
STRB W1, [SP]
MOV X1, SP
MOV X2, #1
MOV W8, #64
SVC #0
ADD SP, SP, #16
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: 10 / 4.0 =
STR x10, [SP, #-8]!
// Pushing character 0: 49
MOV w0, #49
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 48
MOV w0, #48
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 47
MOV w0, #47
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 52
MOV w0, #52
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 46
MOV w0, #46
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 48
MOV w0, #48
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Popping value 1 for printing
LDR x0, [SP], #8
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
BL print_string
.balign 16     // Garantizar alineamiento después de llamada a función
// Printing space between values
// Print space character
MOV X0, #1
SUB SP, SP, #16
MOV W1, #32
STRB W1, [SP]
MOV X1, SP
MOV X2, #1
MOV W8, #64
SVC #0
ADD SP, SP, #16
// Processing expression 2 of 2
// Loading variable 'resultadoDiv3'
// Calculating offset for variable 'resultadoDiv3'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoDiv3'
STR x0, [SP, #-8]!
// Popping value 2 for printing
LDR d0, [SP], #8
.balign 16     // Garantizar alineamiento a 16 bytes
BL print_double
.balign 16     // Garantizar alineamiento después de llamada a función
// Adding newline at end
// Print newline character
MOV X0, #1
SUB SP, SP, #16
MOV W1, #10
STRB W1, [SP]
MOV X1, SP
MOV X2, #1
MOV W8, #64
SVC #0
ADD SP, SP, #16
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: 10.0 / 4 =
STR x10, [SP, #-8]!
// Pushing character 0: 49
MOV w0, #49
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 48
MOV w0, #48
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 46
MOV w0, #46
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 48
MOV w0, #48
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 47
MOV w0, #47
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 52
MOV w0, #52
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Popping value 1 for printing
LDR x0, [SP], #8
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
BL print_string
.balign 16     // Garantizar alineamiento después de llamada a función
// Printing space between values
// Print space character
MOV X0, #1
SUB SP, SP, #16
MOV W1, #32
STRB W1, [SP]
MOV X1, SP
MOV X2, #1
MOV W8, #64
SVC #0
ADD SP, SP, #16
// Processing expression 2 of 2
// Loading variable 'resultadoDiv4'
// Calculating offset for variable 'resultadoDiv4'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoDiv4'
STR x0, [SP, #-8]!
// Popping value 2 for printing
LDR d0, [SP], #8
.balign 16     // Garantizar alineamiento a 16 bytes
BL print_double
.balign 16     // Garantizar alineamiento después de llamada a función
// Adding newline at end
// Print newline character
MOV X0, #1
SUB SP, SP, #16
MOV W1, #10
STRB W1, [SP]
MOV X1, SP
MOV X2, #1
MOV W8, #64
SVC #0
ADD SP, SP, #16
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// Equality operation
// Visiting left operand
// MulDiv operation
// Visiting left operand
// Constant 10
MOV x0, #10
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 2
MOV x0, #2
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Converting operands to float if needed
// Converting left operand from int to float
SCVTF d0, x0
// Converting right operand from int to float
SCVTF d1, x1
// Performing float / operation
FDIV d0, d0, d1
// Pushing float result
STR d0, [SP, #-8]!
// Visiting right operand
// Constant 5
MOV x0, #5
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Equality check with operator: ==
CMP x0, x1
B.eq eq_true_ab443ad9
MOV x0, #0
B eq_end_11839b2b
eq_true_ab443ad9:
MOV x0, #1
eq_end_11839b2b:
STR x0, [SP, #-8]!
// Popping value 1 for printing
LDR x0, [SP], #8
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
BL print_bool
.balign 16     // Garantizar alineamiento después de llamada a función
// Adding newline at end
// Print newline character
MOV X0, #1
SUB SP, SP, #16
MOV W1, #10
STRB W1, [SP]
MOV X1, SP
MOV X2, #1
MOV W8, #64
SVC #0
ADD SP, SP, #16
.balign 16       // Alineamiento para código de salida
// Program Exit
    MOV X0, #0
    MOV X8, #93
    SVC #0


// Standard Library Functions

//--------------------------------------------------------------
// print_string - Prints a null-terminated string to stdout
//
// Input:
//   x0 - The address of the null-terminated string to print
//--------------------------------------------------------------
.balign 4       // Alinear a 4 bytes (una palabra)
print_string:
    // Save link register and other registers we'll use
    stp     x29, x30, [sp, #-16]!
    stp     x19, x20, [sp, #-16]!
    stp     x21, x22, [sp, #-16]!  // Registros adicionales para manejar escapes
    
    // x19 will hold the string address
    mov     x19, x0
    // x21 para control de modo de escape
    mov     x21, #0             // 0 = modo normal, 1 = modo escape

.balign 4       // Alinear a 4 bytes (una palabra)
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

.balign 4       // Alinear a 4 bytes (una palabra)
handle_escape:
    // Reset escape mode
    mov x21, #0
    
    // Handle different escape sequences
    cmp w20, #110          // 'n'
    bne check_t
    mov w20, #10           // Newline ASCII
    b print_char
    
.balign 4       // Alinear a 4 bytes (una palabra)
check_t:
    cmp w20, #116          // 't'
    bne check_r
    mov w20, #9            // Tab ASCII
    b print_char
    
.balign 4       // Alinear a 4 bytes (una palabra)
check_r:
    cmp w20, #114          // 'r'
    bne check_backslash
    mov w20, #13           // Carriage return ASCII
    b print_char
    
.balign 4       // Alinear a 4 bytes (una palabra)
check_backslash:
    cmp w20, #92           // '\'
    bne print_char         // If not recognized, print as-is
    // w20 already holds '\' ASCII, so just continue

.balign 4       // Alinear a 4 bytes (una palabra)
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
.balign 4       // Alinear a 4 bytes (una palabra)
print_done:
    // Eliminar la adición del newline
    // El salto de línea lo agregará VisitPrintStatement al final de toda la instrucción fmt.Println

    // Clean up and restore registers
    ldp     x21, x22, [sp], #16
    ldp     x19, x20, [sp], #16
    ldp     x29, x30, [sp], #16
    ret
    // Return to caller

.balign 4       // Alinear a 4 bytes (una palabra)
newline_char:
    .ascii "\n"          // Newline character


//--------------------------------------------------------------
// print_integer_no_newline - Prints a signed integer to stdout without newline
//
// Input:
//   x0 - The integer value to print
//--------------------------------------------------------------
.balign 4       // Alinear a 4 bytes (una palabra)
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
    
.balign 4       // Alinear a 4 bytes (una palabra)
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
    
.balign 4       // Alinear a 4 bytes (una palabra)
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
.balign 4       // Alinear a 4 bytes (una palabra)
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
    
.balign 4       // Alinear a 4 bytes (una palabra)
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

.balign 4       // Alinear a 4 bytes (una palabra)
minus_sign_nonl:
    .ascii "-"               // Minus sign



//--------------------------------------------------------------
// print_integer - Prints a signed integer to stdout
//
// Input:
//   x0 - The integer value to print
//--------------------------------------------------------------
.balign 4       // Alinear a 4 bytes (una palabra)
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
    
.balign 4       // Alinear a 4 bytes (una palabra)
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
    
.balign 4       // Alinear a 4 bytes (una palabra)
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
.balign 4       // Alinear a 4 bytes (una palabra)
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
    
.balign 4       // Alinear a 4 bytes (una palabra)
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

.balign 4       // Alinear a 4 bytes (una palabra)
minus_sign:
    .ascii "-"               // Minus sign


//--------------------------------------------------------------
// print_double - Prints a double value to stdout
// 
// Input:
//    d0 - The double value to print
//--------------------------------------------------------------
.balign 4       // Alinear a 4 bytes (una palabra)
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

.balign 4       // Alinear a 4 bytes (una palabra)
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

.balign 4       // Alinear a 4 bytes (una palabra)
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

.balign 4       // Alinear a 4 bytes (una palabra)
print_frac_part:
    // Calculate divisor to remove trailing zeros
    mov x20, #1                // Start with divisor = 1
    mov x24, x22               // Copy counter to x24

.balign 4       // Alinear a 4 bytes (una palabra)
calc_divisor_loop:
    cbz x24, print_adjusted_frac // If counter is zero, we're done
    mul x20, x20, x21          // Multiply by 10
    sub x24, x24, #1           // Decrement counter
    b calc_divisor_loop        // Continue

.balign 4       // Alinear a 4 bytes (una palabra)
print_adjusted_frac:
    // Divide by calculated divisor to remove trailing zeros
    udiv x0, x19, x20          // x0 = adjusted fractional part
    bl print_integer_no_newline // Print fractional part WITHOUT newline

.balign 4       // Alinear a 4 bytes (una palabra)
exit_function:
    // Eliminar la adición del newline
    // El salto de línea lo agregará VisitPrintStatement al final de toda la instrucción fmt.Println
    
    // Restore context
    ldp x23, x24, [sp], #16    // Restore callee-saved registers
    ldp x21, x22, [sp], #16    // Restore callee-saved registers
    ldp x19, x20, [sp], #16    // Restore callee-saved registers
    ldp x29, x30, [sp], #16    // Restore frame pointer and link register
    ret                        // Return to caller

.balign 4       // Alinear a 4 bytes (una palabra)
dot_char:
    .ascii "." 

.balign 4       // Alinear a 4 bytes (una palabra)
nl_char:
    .ascii "\n"              // Newline character



//--------------------------------------------------------------
// print_bool - Prints a boolean value as 'true' or 'false'
//
// Input:
//   x0 - The boolean value to print (0 = false, non-zero = true)
//--------------------------------------------------------------
.balign 4       // Alinear a 4 bytes (una palabra)
print_bool:
    // Save registers
    stp x29, x30, [sp, #-16]!  // Save frame pointer and link register
    stp x19, x20, [sp, #-16]!  // Save callee-saved registers
    
    // Check if value is zero (false) or non-zero (true)
    cbnz x0, print_true        // If non-zero, print true
    
    // Print "false"
    mov x0, #1                 // fd = 1 (stdout)
    adr x1, false_string       // Address of "false" string
    mov x2, #5                 // Length = 5 (f-a-l-s-e)
    mov w8, #64                // Syscall write
    svc #0
    b print_bool_done
    
.balign 4       // Alinear a 4 bytes (una palabra)
print_true:
    // Print "true"
    mov x0, #1                 // fd = 1 (stdout)
    adr x1, true_string        // Address of "true" string
    mov x2, #4                 // Length = 4 (t-r-u-e)
    mov w8, #64                // Syscall write
    svc #0
    
.balign 4       // Alinear a 4 bytes (una palabra)
print_bool_done:
    // Eliminar la adición del newline
    // El salto de línea lo agregará VisitPrintStatement al final de toda la instrucción fmt.Println
    
    // Restore registers and return
    ldp x19, x20, [sp], #16    // Restore callee-saved registers
    ldp x29, x30, [sp], #16    // Restore frame pointer and link register
    ret                        // Return to caller

.balign 4       // Alinear a 4 bytes (una palabra)
true_string:
    .ascii "true"            // "true" string
    
.balign 4       // Alinear a 4 bytes (una palabra)
false_string:
    .ascii "false"           // "false" string
    
.balign 4       // Alinear a 4 bytes (una palabra)
bool_newline:
    .ascii "\n"              // Newline character



