.data
heap: .space 4096
.text
.balign 16       // Alineamiento para sección de código
.global _start
_start:
    adr x10, heap
// Implicit declaration: dia
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Switch statement
// Evaluating switch expression
// Loading variable 'dia'
// Calculating offset for variable 'dia'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'dia'
STR x0, [SP, #-8]!
LDR x19, [SP], #8
// Evaluating case 0 expression
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Comparing switch expression with case expression
CMP x19, x0
// If not equal, jump to next case
B.ne case_next_0_abed89a9
// Executing case 0 body
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// String constant: Lunes
STR x10, [SP, #-8]!
// Pushing character 0: 76
MOV w0, #76
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 115
MOV w0, #115
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
// Implicit break at end of case
B switch_end_44abb26d
case_next_0_abed89a9:
// Evaluating case 1 expression
// Constant 2
MOV x0, #2
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Comparing switch expression with case expression
CMP x19, x0
// If not equal, jump to next case
B.ne case_next_1_36b3dade
// Executing case 1 body
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// String constant: Martes
STR x10, [SP, #-8]!
// Pushing character 0: 77
MOV w0, #77
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 115
MOV w0, #115
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
// Implicit break at end of case
B switch_end_44abb26d
case_next_1_36b3dade:
// Evaluating case 2 expression
// Constant 3
MOV x0, #3
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Comparing switch expression with case expression
CMP x19, x0
// If not equal, jump to next case
B.ne case_next_2_6371f0c1
// Executing case 2 body
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// String constant: Miércoles
STR x10, [SP, #-8]!
// Pushing character 0: 77
MOV w0, #77
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 233
MOV w0, #233
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 115
MOV w0, #115
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
// Implicit break at end of case
B switch_end_44abb26d
case_next_2_6371f0c1:
// Evaluating case 3 expression
// Constant 4
MOV x0, #4
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Comparing switch expression with case expression
CMP x19, x0
// If not equal, jump to next case
B.ne case_next_3_9ed109b1
// Executing case 3 body
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// String constant: Jueves
STR x10, [SP, #-8]!
// Pushing character 0: 74
MOV w0, #74
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 118
MOV w0, #118
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 115
MOV w0, #115
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
// Implicit break at end of case
B switch_end_44abb26d
case_next_3_9ed109b1:
// Evaluating case 4 expression
// Constant 5
MOV x0, #5
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Comparing switch expression with case expression
CMP x19, x0
// If not equal, jump to next case
B.ne case_next_4_dfedc05a
// Executing case 4 body
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// String constant: Viernes
STR x10, [SP, #-8]!
// Pushing character 0: 86
MOV w0, #86
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 115
MOV w0, #115
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
// Implicit break at end of case
B switch_end_44abb26d
case_next_4_dfedc05a:
// Evaluating case 5 expression
// Constant 6
MOV x0, #6
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Comparing switch expression with case expression
CMP x19, x0
// If not equal, jump to next case
B.ne case_next_5_60756d9c
// Executing case 5 body
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// String constant: Sábado
STR x10, [SP, #-8]!
// Pushing character 0: 83
MOV w0, #83
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 225
MOV w0, #225
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 98
MOV w0, #98
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 111
MOV w0, #111
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
// Implicit break at end of case
B switch_end_44abb26d
case_next_5_60756d9c:
// Evaluating case 6 expression
// Constant 7
MOV x0, #7
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Comparing switch expression with case expression
CMP x19, x0
// If not equal, jump to next case
B.ne case_next_6_4565c2d4
// Executing case 6 body
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// String constant: Domingo
STR x10, [SP, #-8]!
// Pushing character 0: 68
MOV w0, #68
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 103
MOV w0, #103
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 111
MOV w0, #111
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
// Implicit break at end of case
B switch_end_44abb26d
case_next_6_4565c2d4:
// Default case
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// String constant: Día inválido
STR x10, [SP, #-8]!
// Pushing character 0: 68
MOV w0, #68
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 237
MOV w0, #237
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 118
MOV w0, #118
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 225
MOV w0, #225
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 111
MOV w0, #111
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
switch_end_44abb26d:
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

