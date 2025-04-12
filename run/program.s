.data
heap: .space 4096
.text
.balign 16       // Alineamiento para sección de código
.global _start
_start:
    adr x10, heap
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Logical NOT operation
// Evaluating expression
// Logical AND operation
// Evaluating first operand
// Boolean constant: false
MOV x0, #0
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_cde5eedc
// First operand is true, evaluating second operand
// Boolean constant: false
MOV x0, #0
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_0275dd3f
and_false_cde5eedc:
MOV x0, #0
and_end_0275dd3f:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Inverting boolean value
EOR x0, x0, #1
STR x0, [SP, #-8]!
// Popping value for printing
LDR x0, [SP], #8
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
BL print_bool
.balign 16     // Garantizar alineamiento después de llamada a función
.balign 16       // Alineamiento para código de salida
// Program Exit
    MOV X0, #0
    MOV X8, #93
    SVC #0


// Standard Library Functions

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
    b print_bool_newline
    
.balign 4       // Alinear a 4 bytes (una palabra)
print_true:
    // Print "true"
    mov x0, #1                 // fd = 1 (stdout)
    adr x1, true_string        // Address of "true" string
    mov x2, #4                 // Length = 4 (t-r-u-e)
    mov w8, #64                // Syscall write
    svc #0
    
.balign 4       // Alinear a 4 bytes (una palabra)
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

.balign 4       // Alinear a 4 bytes (una palabra)
true_string:
    .ascii "true"            // "true" string
    
.balign 4       // Alinear a 4 bytes (una palabra)
false_string:
    .ascii "false"           // "false" string
    
.balign 4       // Alinear a 4 bytes (una palabra)
bool_newline:
    .ascii "\n"              // Newline character

