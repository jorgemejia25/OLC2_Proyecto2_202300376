.text
.balign 16       // Alineamiento para sección de código
.global _start
_start:
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// OR operation (||)
// Evaluating left operand
// Boolean false
MOV x0, #0
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Check if left operand is true
CMP x0, #0
BNE or_op_true_0
or_op_eval_right_0:
// Evaluating right operand
// NOT operation (!)
// AND operation (&&)
// Evaluating left operand
// Boolean true
MOV x0, #1
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Check if left operand is false
CMP x0, #0
BEQ and_op_false_1
and_op_eval_right_1:
// Evaluating right operand
// Boolean false
MOV x0, #0
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_op_end_1
and_op_false_1:
MOV x0, #0
and_op_end_1:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Compare with 0 (false)
CMP x0, #0
BEQ not_op_true_2
MOV x0, #0
B not_op_end_2
not_op_true_2:
MOV x0, #1
not_op_end_2:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B or_op_end_0
or_op_true_0:
MOV x0, #1
or_op_end_0:
STR x0, [SP, #-8]!
// Popping boolean value
LDR x0, [SP], #8
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
BL print_boolean
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
// print_boolean - Imprime un valor booleano ("true" o "false")
//
// Input:
//   x0 - El valor booleano (0 = false, cualquier otro = true)
//--------------------------------------------------------------
print_boolean:
    // Guardar registros
    stp x29, x30, [sp, #-16]!
    stp x19, x20, [sp, #-16]!
    
    // Guardar el valor booleano
    mov x19, x0
    
    // Comprobar si es true (diferente de cero)
    cmp x19, #0
    beq print_false
    
    // Imprimir "true"
    mov x0, #1                // fd = 1 (stdout)
    adr x1, true_str          // Dirección de la cadena "true"
    mov x2, #4                // Longitud de "true"
    mov w8, #64               // Syscall write
    svc #0
    b done_bool_print
    
print_false:
    // Imprimir "false"
    mov x0, #1                // fd = 1 (stdout)
    adr x1, false_str         // Dirección de la cadena "false"
    mov x2, #5                // Longitud de "false"
    mov w8, #64               // Syscall write
    svc #0
    
done_bool_print:
    // Imprimir salto de línea
    mov x0, #1                // fd = 1 (stdout)
    adr x1, bool_newline      // Dirección de salto de línea
    mov x2, #1                // Longitud de salto de línea
    mov w8, #64               // Syscall write
    svc #0
    
    // Restaurar registros y retornar
    ldp x19, x20, [sp], #16
    ldp x29, x30, [sp], #16
    ret

.align 4
true_str:
    .ascii "true"           // Cadena "true"
    
.align 4
false_str:
    .ascii "false"          // Cadena "false"

.align 4
bool_newline:
    .ascii "\n"             // Salto de línea

