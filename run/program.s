.data
heap: .space 4096
.text
.balign 16       // Alineamiento para sección de código
.global _start
_start:
    adr x10, heap
// Variable declaration: a
// Constant 5
MOV x0, #5
STR x0, [SP, #-8]!
// Variable declaration: b
// Constant 10
MOV x0, #10
STR x0, [SP, #-8]!
// Variable declaration: c
// Comparison operation
// Visiting left operand
// Loading variable 'a'
// Calculating offset for variable 'a'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'a'
STR x0, [SP, #-8]!
// Visiting right operand
// Loading variable 'b'
// Calculating offset for variable 'b'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'b'
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Comparison with operator: <
CMP x0, x1
B.lt cmp_true_6768708a
MOV x0, #0
B cmp_end_2ebf3571
cmp_true_6768708a:
MOV x0, #1
cmp_end_2ebf3571:
STR x0, [SP, #-8]!
// Variable declaration: d
// Comparison operation
// Visiting left operand
// Loading variable 'a'
// Calculating offset for variable 'a'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'a'
STR x0, [SP, #-8]!
// Visiting right operand
// Loading variable 'b'
// Calculating offset for variable 'b'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'b'
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Comparison with operator: >
CMP x0, x1
B.gt cmp_true_04e21206
MOV x0, #0
B cmp_end_df26be97
cmp_true_04e21206:
MOV x0, #1
cmp_end_df26be97:
STR x0, [SP, #-8]!
// Variable declaration: e
// Comparison operation
// Visiting left operand
// Loading variable 'a'
// Calculating offset for variable 'a'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'a'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 5
MOV x0, #5
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Comparison with operator: <=
CMP x0, x1
B.le cmp_true_40c13a66
MOV x0, #0
B cmp_end_ec9e00d4
cmp_true_40c13a66:
MOV x0, #1
cmp_end_ec9e00d4:
STR x0, [SP, #-8]!
// Variable declaration: f
// Comparison operation
// Visiting left operand
// Loading variable 'a'
// Calculating offset for variable 'a'
MOV x0, #32
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'a'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 10
MOV x0, #10
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Comparison with operator: >=
CMP x0, x1
B.ge cmp_true_c6d7f77a
MOV x0, #0
B cmp_end_47a1a82a
cmp_true_c6d7f77a:
MOV x0, #1
cmp_end_47a1a82a:
STR x0, [SP, #-8]!
// Variable declaration: g
// Equality operation
// Visiting left operand
// Loading variable 'a'
// Calculating offset for variable 'a'
MOV x0, #40
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'a'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 5
MOV x0, #5
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Equality check with operator: ==
CMP x0, x1
B.eq eq_true_57a7882a
MOV x0, #0
B eq_end_54980195
eq_true_57a7882a:
MOV x0, #1
eq_end_54980195:
STR x0, [SP, #-8]!
// Variable declaration: h
// Equality operation
// Visiting left operand
// Loading variable 'a'
// Calculating offset for variable 'a'
MOV x0, #48
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'a'
STR x0, [SP, #-8]!
// Visiting right operand
// Loading variable 'b'
// Calculating offset for variable 'b'
MOV x0, #48
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'b'
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Equality check with operator: !=
CMP x0, x1
B.ne eq_true_865dc393
MOV x0, #0
B eq_end_b644fd56
eq_true_865dc393:
MOV x0, #1
eq_end_b644fd56:
STR x0, [SP, #-8]!
// If statement
// Evaluating condition
// Comparison operation
// Visiting left operand
// Loading variable 'a'
// Calculating offset for variable 'a'
MOV x0, #56
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'a'
STR x0, [SP, #-8]!
// Visiting right operand
// Loading variable 'b'
// Calculating offset for variable 'b'
MOV x0, #56
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'b'
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Comparison with operator: <
CMP x0, x1
B.lt cmp_true_31d48846
MOV x0, #0
B cmp_end_657916ad
cmp_true_31d48846:
MOV x0, #1
cmp_end_657916ad:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Checking condition
CBZ x0, else_04a76d36
// Then block
// Block statement
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// String constant: a es MENOR que b
STR x10, [SP, #-8]!
// Pushing character 0: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 77
MOV w0, #77
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 69
MOV w0, #69
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 78
MOV w0, #78
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 79
MOV w0, #79
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 82
MOV w0, #82
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 113
MOV w0, #113
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 98
MOV w0, #98
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Popping value for printing
LDR x0, [SP], #8
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
BL print_string
.balign 16     // Garantizar alineamiento después de llamada a función
B endif_ce5abe77
else_04a76d36:
endif_ce5abe77:
// For statement
// For with clause (C-style)
// For initialization
// Implicit declaration: i
// Constant 0
MOV x0, #0
STR x0, [SP, #-8]!
B for_cond_24a9a644
for_post_63616f3c:
// For post-statement
// Increment/Decrement operation: i ++
// Loading variable 'i'
MOV x1, #0
ADD x1, sp, x1
LDR x0, [x1, #0]
// Incrementing 'i'
ADD x0, x0, #1
// Saving updated value back to 'i'
STR x0, [x1, #0]
for_cond_24a9a644:
// Evaluating for condition
// Comparison operation
// Visiting left operand
// Loading variable 'i'
// Calculating offset for variable 'i'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'i'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 10
MOV x0, #10
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Comparison with operator: <
CMP x0, x1
B.lt cmp_true_1023e98d
MOV x0, #0
B cmp_end_af4d246f
cmp_true_1023e98d:
MOV x0, #1
cmp_end_af4d246f:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Checking condition
CBZ x0, for_end_4adab503
// For body
// Block statement
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Loading variable 'i'
// Calculating offset for variable 'i'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'i'
STR x0, [SP, #-8]!
// Popping value for printing
LDR x0, [SP], #8
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
BL print_integer
.balign 16     // Garantizar alineamiento después de llamada a función
// Break statement
B for_end_4adab503
B for_post_63616f3c
for_end_4adab503:
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

.balign 4       // Alinear a 4 bytes (una palabra)
newline_char:
    .ascii "\n"          // Newline character


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

