.data
heap: .space 4096
.text
.balign 16       // Alineamiento para sección de código
.global _start
_start:
    adr x10, heap
// Program start - compiling statements
// Function declaration: main
B skip_main
func_main:
// Function prologue: saving frame pointer and return address
STR x29, [SP, #-8]!
STR x30, [SP, #-8]!
// FP = SP
MOV x29, sp
// Function body
// Block statement
// Implicit declaration: puntos
// Constant 0
MOV x0, #0
STR x0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: === Archivo de prueba de slices ===
STR x10, [SP, #-8]!
// Pushing character 0: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 65
MOV w0, #65
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 104
MOV w0, #104
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 118
MOV w0, #118
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 100
MOV w0, #100
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
// Pushing character 15: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 98
MOV w0, #98
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 31: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 32: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 33: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 34: 61
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
// String constant: ==== Creación de slices ====
STR x10, [SP, #-8]!
// Pushing character 0: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 67
MOV w0, #67
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 243
MOV w0, #243
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 61
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
// Implicit declaration: puntosCreacion
// Constant 0
MOV x0, #0
STR x0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: Creación con literales:
STR x10, [SP, #-8]!
// Pushing character 0: 67
MOV w0, #67
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 99
MOV w0, #99
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
// Pushing character 8: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 58
MOV w0, #58
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
// Variable declaration: numeros
// Slice initialization
// Initializing slice with 5 elements
STR x10, [SP, #-8]!
MOV x0, #5
STR x0, [x10, #0]
ADD x10, x10, #8
// Evaluating and storing element 0
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
LDR x0, [SP], #8
STR x0, [x10, #0]
ADD x10, x10, #8
// Evaluating and storing element 1
// Constant 2
MOV x0, #2
STR x0, [SP, #-8]!
LDR x0, [SP], #8
STR x0, [x10, #0]
ADD x10, x10, #8
// Evaluating and storing element 2
// Constant 3
MOV x0, #3
STR x0, [SP, #-8]!
LDR x0, [SP], #8
STR x0, [x10, #0]
ADD x10, x10, #8
// Evaluating and storing element 3
// Constant 4
MOV x0, #4
STR x0, [SP, #-8]!
LDR x0, [SP], #8
STR x0, [x10, #0]
ADD x10, x10, #8
// Evaluating and storing element 4
// Constant 5
MOV x0, #5
STR x0, [SP, #-8]!
LDR x0, [SP], #8
STR x0, [x10, #0]
ADD x10, x10, #8
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: ###Validacion Manual
STR x10, [SP, #-8]!
// Pushing character 0: 35
MOV w0, #35
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 35
MOV w0, #35
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 35
MOV w0, #35
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 86
MOV w0, #86
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 77
MOV w0, #77
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 108
MOV w0, #108
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: numeros:
STR x10, [SP, #-8]!
// Pushing character 0: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 58
MOV w0, #58
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
// Loading variable 'numeros'
// Calculating offset for variable 'numeros'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'numeros'
STR x0, [SP, #-8]!
// Popping value 2 for printing
LDR x0, [SP], #8
// Printing int slice
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
BL print_int_slice
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
// String constant: OK Creación con literales: correcto
STR x10, [SP, #-8]!
// Pushing character 0: 79
MOV w0, #79
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 75
MOV w0, #75
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 67
MOV w0, #67
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 243
MOV w0, #243
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 31: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 32: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 33: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 34: 111
MOV w0, #111
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
// Assignment statement
// Assignment to variable: puntosCreacion
// AddSub operation
// Visiting left operand
// Loading variable 'puntosCreacion'
// Calculating offset for variable 'puntosCreacion'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosCreacion'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 6
MOV x0, #6
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'puntosCreacion' at offset 8
MOV x1, #8
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: \n==== Acceso de Elementos ====
STR x10, [SP, #-8]!
// Pushing escape sequence character: \
MOV w0, #92
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing escape sequence character: n
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 65
MOV w0, #65
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 69
MOV w0, #69
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 61
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
// Implicit declaration: puntosAcceso
// Constant 0
MOV x0, #0
STR x0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: Acceso por índice:
STR x10, [SP, #-8]!
// Pushing character 0: 65
MOV w0, #65
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 99
MOV w0, #99
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
// Pushing character 5: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 237
MOV w0, #237
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 58
MOV w0, #58
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
// Implicit declaration: primerElemento
// Index access operation (slice[index])
// Visiting slice expression
// Loading variable 'numeros'
// Calculating offset for variable 'numeros'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'numeros'
STR x0, [SP, #-8]!
// Visiting index expression
// Constant 0
MOV x0, #0
STR x0, [SP, #-8]!
// Popping index value
LDR x1, [SP], #8
// Popping slice address
LDR x0, [SP], #8
// Checking index bounds
LDR x2, [x0, #0]
CMP x1, x2
B.lt index_ok_0624b5e6
index_error_97575fa0:
// Index out of bounds error: Using default value 0
MOV x0, #0
B index_end_6a184229
index_ok_0624b5e6:
// Calculating element address: base + 8 + index*8
ADD x0, x0, 8
MOV x2, #8
MUL x1, x1, x2
ADD x0, x0, x1
LDR x0, [x0, #0]
index_end_6a184229:
// Pushing element value to stack
STR x0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: Primer elemento:
STR x10, [SP, #-8]!
// Pushing character 0: 80
MOV w0, #80
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 58
MOV w0, #58
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
// Loading variable 'primerElemento'
// Calculating offset for variable 'primerElemento'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'primerElemento'
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
// If statement
// Evaluating condition
// Equality operation
// Visiting left operand
// Loading variable 'primerElemento'
// Calculating offset for variable 'primerElemento'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'primerElemento'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_fd15a068
MOV x0, #0
B eq_end_9a5cf89e
eq_true_fd15a068:
MOV x0, #1
eq_end_9a5cf89e:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Checking condition
CBZ x0, else_23e0d322
// Then block
// Block statement
// Assignment statement
// Assignment to variable: puntosAcceso
// AddSub operation
// Visiting left operand
// Loading variable 'puntosAcceso'
// Calculating offset for variable 'puntosAcceso'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosAcceso'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 2
MOV x0, #2
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'puntosAcceso' at offset 8
MOV x1, #8
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: OK Acceso por índice: correcto
STR x10, [SP, #-8]!
// Pushing character 0: 79
MOV w0, #79
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 75
MOV w0, #75
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 65
MOV w0, #65
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 237
MOV w0, #237
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 111
MOV w0, #111
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
B endif_76199217
else_23e0d322:
// Else block
// Else branch with block
// Block statement
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: X Acceso por índice: incorrecto
STR x10, [SP, #-8]!
// Pushing character 0: 88
MOV w0, #88
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 65
MOV w0, #65
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 99
MOV w0, #99
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
// Pushing character 7: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 237
MOV w0, #237
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 111
MOV w0, #111
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
endif_76199217:
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: \nModificación de elementos:
STR x10, [SP, #-8]!
// Pushing escape sequence character: \
MOV w0, #92
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing escape sequence character: n
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 77
MOV w0, #77
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 102
MOV w0, #102
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 243
MOV w0, #243
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 58
MOV w0, #58
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
// Assignment statement
// Slice/array index assignment: expr[index] = value
// Evaluating slice/array expression
// Loading variable 'numeros'
// Calculating offset for variable 'numeros'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'numeros'
STR x0, [SP, #-8]!
// Evaluating index expression
// Constant 0
MOV x0, #0
STR x0, [SP, #-8]!
// Evaluating value expression
// Constant 10
MOV x0, #10
STR x0, [SP, #-8]!
// Popping value to assign
LDR x0, [SP], #8
// Popping index value
LDR x1, [SP], #8
// Popping slice/array address
LDR x2, [SP], #8
// Checking index bounds
LDR x3, [x2, #0]
CMP x1, x3
B.lt assign_index_ok_7b0040d9
assign_index_error_c0e56e73:
// Index out of bounds error in assignment
B assign_index_end_dd7bcf12
assign_index_ok_7b0040d9:
// Calculating element address: base + 8 + index*8
ADD x2, x2, 8
MOV x3, #8
MUL x1, x1, x3
ADD x2, x2, x1
// Storing value at the calculated address
STR x0, [x2, #0]
assign_index_end_dd7bcf12:
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: numeros después de modificar:
STR x10, [SP, #-8]!
// Pushing character 0: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 233
MOV w0, #233
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 102
MOV w0, #102
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 58
MOV w0, #58
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
// Loading variable 'numeros'
// Calculating offset for variable 'numeros'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'numeros'
STR x0, [SP, #-8]!
// Popping value 2 for printing
LDR x0, [SP], #8
// Printing int slice
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
BL print_int_slice
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
// If statement
// Evaluating condition
// Equality operation
// Visiting left operand
// Index access operation (slice[index])
// Visiting slice expression
// Loading variable 'numeros'
// Calculating offset for variable 'numeros'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'numeros'
STR x0, [SP, #-8]!
// Visiting index expression
// Constant 0
MOV x0, #0
STR x0, [SP, #-8]!
// Popping index value
LDR x1, [SP], #8
// Popping slice address
LDR x0, [SP], #8
// Checking index bounds
LDR x2, [x0, #0]
CMP x1, x2
B.lt index_ok_0f3b47fe
index_error_5a4c7e0a:
// Index out of bounds error: Using default value 0
MOV x0, #0
B index_end_9f86a443
index_ok_0f3b47fe:
// Calculating element address: base + 8 + index*8
ADD x0, x0, 8
MOV x2, #8
MUL x1, x1, x2
ADD x0, x0, x1
LDR x0, [x0, #0]
index_end_9f86a443:
// Pushing element value to stack
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 10
MOV x0, #10
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_c05fd9e6
MOV x0, #0
B eq_end_37df0f60
eq_true_c05fd9e6:
MOV x0, #1
eq_end_37df0f60:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Checking condition
CBZ x0, else_b5dd2b2a
// Then block
// Block statement
// Assignment statement
// Assignment to variable: puntosAcceso
// AddSub operation
// Visiting left operand
// Loading variable 'puntosAcceso'
// Calculating offset for variable 'puntosAcceso'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosAcceso'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 4
MOV x0, #4
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'puntosAcceso' at offset 8
MOV x1, #8
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: OK Modificación de elementos: correcto
STR x10, [SP, #-8]!
// Pushing character 0: 79
MOV w0, #79
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 75
MOV w0, #75
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 77
MOV w0, #77
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 102
MOV w0, #102
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 243
MOV w0, #243
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 31: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 32: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 33: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 34: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 35: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 36: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 37: 111
MOV w0, #111
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
B endif_91c098bd
else_b5dd2b2a:
// Else block
// Else branch with block
// Block statement
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: X Modificación de elementos: incorrecto
STR x10, [SP, #-8]!
// Pushing character 0: 88
MOV w0, #88
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 77
MOV w0, #77
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 102
MOV w0, #102
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 243
MOV w0, #243
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 31: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 32: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 33: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 34: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 35: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 36: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 37: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 38: 111
MOV w0, #111
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
endif_91c098bd:
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: \n==== Función slices.Index ====
STR x10, [SP, #-8]!
// Pushing escape sequence character: \
MOV w0, #92
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing escape sequence character: n
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 70
MOV w0, #70
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 243
MOV w0, #243
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 46
MOV w0, #46
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 73
MOV w0, #73
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 120
MOV w0, #120
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 31: 61
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
// Implicit declaration: puntosIndex
// Constant 0
MOV x0, #0
STR x0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: Búsqueda de elementos con slices.Index:
STR x10, [SP, #-8]!
// Pushing character 0: 66
MOV w0, #66
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 250
MOV w0, #250
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 113
MOV w0, #113
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 31: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 32: 46
MOV w0, #46
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 33: 73
MOV w0, #73
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 34: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 35: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 36: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 37: 120
MOV w0, #120
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 38: 58
MOV w0, #58
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
// Assignment statement
// Assignment to variable: numeros
// Slice initialization
// Initializing slice with 5 elements
STR x10, [SP, #-8]!
MOV x0, #5
STR x0, [x10, #0]
ADD x10, x10, #8
// Evaluating and storing element 0
// Constant 10
MOV x0, #10
STR x0, [SP, #-8]!
LDR x0, [SP], #8
STR x0, [x10, #0]
ADD x10, x10, #8
// Evaluating and storing element 1
// Constant 20
MOV x0, #20
STR x0, [SP, #-8]!
LDR x0, [SP], #8
STR x0, [x10, #0]
ADD x10, x10, #8
// Evaluating and storing element 2
// Constant 30
MOV x0, #30
STR x0, [SP, #-8]!
LDR x0, [SP], #8
STR x0, [x10, #0]
ADD x10, x10, #8
// Evaluating and storing element 3
// Constant 40
MOV x0, #40
STR x0, [SP, #-8]!
LDR x0, [SP], #8
STR x0, [x10, #0]
ADD x10, x10, #8
// Evaluating and storing element 4
// Constant 50
MOV x0, #50
STR x0, [SP, #-8]!
LDR x0, [SP], #8
STR x0, [x10, #0]
ADD x10, x10, #8
LDR x0, [SP], #8
// Storing value to variable 'numeros' at offset 24
MOV x1, #24
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Implicit declaration: indice1
// slices.Index operation
// Visiting slice expression
// Loading variable 'numeros'
// Calculating offset for variable 'numeros'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'numeros'
STR x0, [SP, #-8]!
// Visiting search element expression
// Constant 30
MOV x0, #30
STR x0, [SP, #-8]!
// Popping search element value
LDR x1, [SP], #8
// Popping slice address
LDR x0, [SP], #8
MOV x2, x0
LDR x3, [x2, #0]
MOV x4, #0
MOV x5, x1
sliceindex_loop_747f1540:
CMP x4, x3
B.ge sliceindex_notfound_928a2dfb
// Calculating element address: base + 8 + index*8
MOV x6, x2
ADD x6, x6, 8
MOV x7, #8
MUL x8, x4, x7
ADD x6, x6, x8
LDR x7, [x6, #0]
CMP x7, x5
B.eq sliceindex_found_06cf3e36
ADD x4, x4, 1
B sliceindex_loop_747f1540
sliceindex_found_06cf3e36:
MOV x0, x4
B sliceindex_end_376e4f45
sliceindex_notfound_928a2dfb:
MOV x0, #-1
sliceindex_end_376e4f45:
STR x0, [SP, #-8]!
// Implicit declaration: indice2
// slices.Index operation
// Visiting slice expression
// Loading variable 'numeros'
// Calculating offset for variable 'numeros'
MOV x0, #32
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'numeros'
STR x0, [SP, #-8]!
// Visiting search element expression
// Constant 60
MOV x0, #60
STR x0, [SP, #-8]!
// Popping search element value
LDR x1, [SP], #8
// Popping slice address
LDR x0, [SP], #8
MOV x2, x0
LDR x3, [x2, #0]
MOV x4, #0
MOV x5, x1
sliceindex_loop_28ff61c6:
CMP x4, x3
B.ge sliceindex_notfound_aa611063
// Calculating element address: base + 8 + index*8
MOV x6, x2
ADD x6, x6, 8
MOV x7, #8
MUL x8, x4, x7
ADD x6, x6, x8
LDR x7, [x6, #0]
CMP x7, x5
B.eq sliceindex_found_3bb4d08f
ADD x4, x4, 1
B sliceindex_loop_28ff61c6
sliceindex_found_3bb4d08f:
MOV x0, x4
B sliceindex_end_4c2f0c1d
sliceindex_notfound_aa611063:
MOV x0, #-1
sliceindex_end_4c2f0c1d:
STR x0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: Índice de 30:
STR x10, [SP, #-8]!
// Pushing character 0: 205
MOV w0, #205
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 51
MOV w0, #51
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 48
MOV w0, #48
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 58
MOV w0, #58
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
// Loading variable 'indice1'
// Calculating offset for variable 'indice1'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'indice1'
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
// String constant: Índice de 60:
STR x10, [SP, #-8]!
// Pushing character 0: 205
MOV w0, #205
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 54
MOV w0, #54
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 48
MOV w0, #48
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 58
MOV w0, #58
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
// Loading variable 'indice2'
// Calculating offset for variable 'indice2'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'indice2'
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
// Removing leftover object from stack
LDR x0, [SP], #8
// Removing leftover object from stack
LDR x0, [SP], #8
// Removing leftover object from stack
LDR x0, [SP], #8
// Removing leftover object from stack
LDR x0, [SP], #8
// Removing leftover object from stack
LDR x0, [SP], #8
// Removing leftover object from stack
LDR x0, [SP], #8
// Removing leftover object from stack
LDR x0, [SP], #8
// Removing leftover object from stack
LDR x0, [SP], #8
ret_main:
// Function epilogue
// SP = FP
MOV sp, x29
LDR x30, [SP], #8
LDR x29, [SP], #8
// Return to caller
RET
skip_main:
// Calling main function
BL func_main
.balign 16     // Garantizar alineamiento después de llamada a función
// Program end
MOV x0, #0
MOV x8, #93
SVC #0
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
// print_int_slice - Imprime un slice de enteros
//
// Input:
//   x0 - Dirección del slice (puntero al primer elemento)
//--------------------------------------------------------------
.balign 4       // Alinear a 4 bytes (una palabra)
print_int_slice:
    // Guardar registros
    stp x29, x30, [sp, #-16]!  // Guardar frame pointer y link register
    stp x19, x20, [sp, #-16]!  // Guardar registros callee-saved
    stp x21, x22, [sp, #-16]!  // Guardar registros para trabajo temporal
    stp x23, x24, [sp, #-16]!  // Guardar más registros
    
    // x19 = dirección del slice
    mov x19, x0
    
    // Imprimir corchete de apertura '['
    mov x0, #1                 // fd = 1 (stdout)
    sub sp, sp, #16            // Reservar espacio temporal
    mov w1, #91                // '[' en ASCII
    strb w1, [sp]              // Guardar en espacio reservado
    mov x1, sp                 // Dirección del carácter
    mov x2, #1                 // Longitud = 1 byte
    mov w8, #64                // Syscall write
    svc #0
    
    // Cargar la longitud del slice (primeros 8 bytes)
    ldr x20, [x19]             // x20 = longitud
    add x19, x19, #8           // Avanzar al primer elemento
    
    // x21 = contador de elementos
    mov x21, #0
    
.balign 4       // Alinear a 4 bytes (una palabra)
print_slice_loop:
    // Verificar si llegamos al final del slice
    cmp x21, x20
    beq print_slice_end
    
    // Si no es el primer elemento, imprimir espacio
    cbz x21, skip_slice_space
    
    // Imprimir espacio entre elementos
    mov w1, #32                // ' ' en ASCII
    strb w1, [sp]              // Guardar en espacio reservado
    mov x0, #1                 // fd = 1 (stdout)
    mov x1, sp                 // Dirección del carácter
    mov x2, #1                 // Longitud = 1 byte
    mov w8, #64                // Syscall write
    svc #0
    
.balign 4       // Alinear a 4 bytes (una palabra)
skip_slice_space:
    // Cargar el valor numérico en x22
    lsl x23, x21, #3           // Multiplicar índice por 8
    add x23, x19, x23          // Calcular dirección del elemento
    ldr x22, [x23]             // Cargar valor del elemento
    
    // Imprimir el número entero (implementación simple)
    // Reservar espacio para buffer de conversión
    sub sp, sp, #32
    mov x23, sp                // x23 = puntero a buffer
    
    // Verificar si el número es negativo
    cmp x22, #0
    bge slice_positive_num
    
    // Manejar número negativo
    mov w1, #45                // '-' en ASCII
    strb w1, [sp, #-1]!        // Guardar y decrementar stack
    mov x0, #1                 // fd = 1 (stdout)
    mov x1, sp                 // Dirección del carácter
    mov x2, #1                 // Longitud = 1 byte
    mov w8, #64                // Syscall write
    svc #0
    add sp, sp, #1             // Restaurar stack
    
    neg x22, x22               // Convertir a positivo
    
.balign 4       // Alinear a 4 bytes (una palabra)
slice_positive_num:
    // Inicializar contador de dígitos
    mov x24, #0
    
    // Caso especial para el cero
    cmp x22, #0
    bne slice_convert_loop
    
    // Si es cero, simplemente imprimimos '0'
    mov w1, #48                // '0' en ASCII
    strb w1, [x23]             // Guardar en buffer
    mov x24, #1                // Un dígito
    b slice_print_digits
    
.balign 4       // Alinear a 4 bytes (una palabra)
slice_convert_loop:
    // Si el número es cero, terminar la conversión
    cbz x22, slice_reverse_digits
    
    // Obtener el último dígito
    mov x0, #10
    udiv x1, x22, x0           // x1 = x22 / 10
    msub x2, x1, x0, x22       // x2 = x22 - (x1 * 10) = último dígito
    
    // Convertir a ASCII y guardar
    add w2, w2, #48            // Convertir a ASCII ('0' = 48)
    strb w2, [x23, x24]        // Guardar en buffer
    add x24, x24, #1           // Incrementar contador
    
    // Dividir entre 10 para siguiente iteración
    udiv x22, x22, x0          // x22 = x22 / 10
    b slice_convert_loop
    
.balign 4       // Alinear a 4 bytes (una palabra)
slice_reverse_digits:
    // Si no hay dígitos, salir
    cbz x24, slice_print_digits
    
    // Invertir los dígitos (están al revés)
    mov x0, #0                 // Índice inicio
    sub x1, x24, #1            // Índice final = longitud - 1
    
.balign 4       // Alinear a 4 bytes (una palabra)
slice_reverse_loop:
    // Verificar si terminamos
    cmp x0, x1
    bge slice_print_digits
    
    // Intercambiar dígitos
    ldrb w2, [x23, x0]         // Cargar dígito inicio
    ldrb w3, [x23, x1]         // Cargar dígito final
    strb w3, [x23, x0]         // Guardar dígito final en inicio
    strb w2, [x23, x1]         // Guardar dígito inicio en final
    
    // Actualizar índices
    add x0, x0, #1             // Incrementar índice inicio
    sub x1, x1, #1             // Decrementar índice final
    b slice_reverse_loop
    
.balign 4       // Alinear a 4 bytes (una palabra)
slice_print_digits:
    // Imprimir los dígitos
    mov x0, #1                 // fd = 1 (stdout)
    mov x1, x23                // Dirección del buffer
    mov x2, x24                // Longitud = contador de dígitos
    mov w8, #64                // Syscall write
    svc #0
    
    // Liberar espacio del buffer
    add sp, sp, #32
    
    // Incrementar contador y continuar
    add x21, x21, #1           // Siguiente elemento
    b print_slice_loop
    
.balign 4       // Alinear a 4 bytes (una palabra)
print_slice_end:
    // Imprimir corchete de cierre ']'
    mov w1, #93                // ']' en ASCII
    strb w1, [sp]              // Guardar en espacio reservado
    mov x0, #1                 // fd = 1 (stdout)
    mov x1, sp                 // Dirección del carácter
    mov x2, #1                 // Longitud = 1 byte
    mov w8, #64                // Syscall write
    svc #0
    
    // Liberar espacio reservado
    add sp, sp, #16
    
    // Restaurar registros y retornar
    ldp x23, x24, [sp], #16
    ldp x21, x22, [sp], #16
    ldp x19, x20, [sp], #16
    ldp x29, x30, [sp], #16
    ret



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




