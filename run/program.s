.data
heap: .space 4096
.text
.balign 16       // Alineamiento para sección de código
.global _start
_start:
    adr x10, heap
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// AddSub operation
// Visiting left operand
// String constant: Hola
STR x10, [SP, #-8]!
// Pushing character 0: 72
MOV w0, #72
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Visiting right operand
// String constant:  mundo
STR x10, [SP, #-8]!
// Pushing character 0: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 110
MOV w0, #110
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
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// String concatenation
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
MOV X1, x1
BL concat_strings
.balign 16     // Garantizar alineamiento después de llamada a función
// Pushing string result
STR x0, [SP, #-8]!
// Popping value for printing
LDR x0, [SP], #8
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
BL print_string
.balign 16     // Garantizar alineamiento después de llamada a función
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// AddSub operation
// Visiting left operand
// String constant: Hola
STR x10, [SP, #-8]!
// Pushing character 0: 72
MOV w0, #72
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Visiting right operand
// String constant:  mundo2
STR x10, [SP, #-8]!
// Pushing character 0: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 110
MOV w0, #110
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
// Pushing character 6: 50
MOV w0, #50
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// String concatenation
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
MOV X1, x1
BL concat_strings
.balign 16     // Garantizar alineamiento después de llamada a función
// Pushing string result
STR x0, [SP, #-8]!
// Popping value for printing
LDR x0, [SP], #8
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
BL print_string
.balign 16     // Garantizar alineamiento después de llamada a función
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// AddSub operation
// Visiting left operand
// String constant: String
STR x10, [SP, #-8]!
// Pushing character 0: 83
MOV w0, #83
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 114
MOV w0, #114
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
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Visiting right operand
// String constant:  concatenado
STR x10, [SP, #-8]!
// Pushing character 0: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 97
MOV w0, #97
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
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// String concatenation
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
MOV X1, x1
BL concat_strings
.balign 16     // Garantizar alineamiento después de llamada a función
// Pushing string result
STR x0, [SP, #-8]!
// Popping value for printing
LDR x0, [SP], #8
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
BL print_string
.balign 16     // Garantizar alineamiento después de llamada a función
// Implicit declaration: i
// AddSub operation
// Visiting left operand
// String constant: Hola soy
STR x10, [SP, #-8]!
// Pushing character 0: 72
MOV w0, #72
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 121
MOV w0, #121
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Visiting right operand
// String constant: : i
STR x10, [SP, #-8]!
// Pushing character 0: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// String concatenation
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
MOV X1, x1
BL concat_strings
.balign 16     // Garantizar alineamiento después de llamada a función
// Pushing string result
STR x0, [SP, #-8]!
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
BL print_string
.balign 16     // Garantizar alineamiento después de llamada a función
.balign 16       // Alineamiento para código de salida
// Program Exit
    MOV X0, #0
    MOV X8, #93
    SVC #0


// Standard Library Functions

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
.balign 4       // Alinear a 4 bytes (una palabra)
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
.balign 4       // Alinear a 4 bytes (una palabra)
len_first_loop:
    ldrb w0, [x19, x21]        // Load byte from string
    cbz w0, len_first_done     // If zero (end of string), exit loop
    add x21, x21, #1           // Increment counter
    b len_first_loop           // Continue loop
.balign 4       // Alinear a 4 bytes (una palabra)
len_first_done:
    
    // Calculate length of second string
    mov x22, #0                // Initialize counter for second string length
.balign 4       // Alinear a 4 bytes (una palabra)
len_second_loop:
    ldrb w0, [x20, x22]        // Load byte from string
    cbz w0, len_second_done    // If zero (end of string), exit loop
    add x22, x22, #1           // Increment counter
    b len_second_loop          // Continue loop
.balign 4       // Alinear a 4 bytes (una palabra)
len_second_done:
    
    // Calculate total size needed
    add x23, x21, x22
    add x23, x23, #1           // Add 1 for the NULL terminator
    
    // Get heap pointer (assumed to be in x10)
    mov x24, x10               // Save current heap pointer for our result
    add x10, x10, x23          // Advance heap pointer for next allocation
    
    // Copy first string to the result
    mov x0, #0                 // Initialize index
.balign 4       // Alinear a 4 bytes (una palabra)
copy_first_loop:
    cmp x0, x21                // Compare with length of first string
    beq copy_first_done        // If equal, we're done
    ldrb w1, [x19, x0]         // Load byte from first string
    strb w1, [x24, x0]         // Store byte to result
    add x0, x0, #1             // Increment index
    b copy_first_loop          // Continue loop
.balign 4       // Alinear a 4 bytes (una palabra)
copy_first_done:

    // Copy second string to the result (append)
    mov x0, #0                 // Initialize index for second string
.balign 4       // Alinear a 4 bytes (una palabra)
copy_second_loop:
    cmp x0, x22                // Compare with length of second string
    beq copy_second_done       // If equal, we're done
    ldrb w1, [x20, x0]         // Load byte from second string
    add x2, x0, x21            // Calculate position in result (offset by length of first string)
    strb w1, [x24, x2]         // Store byte to result
    add x0, x0, #1             // Increment index
    b copy_second_loop         // Continue loop
.balign 4       // Alinear a 4 bytes (una palabra)
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

