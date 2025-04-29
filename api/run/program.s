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
// String constant: === Archivo de prueba básico ===
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
// Pushing character 22: 98
MOV w0, #98
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 225
MOV w0, #225
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 32
MOV w0, #32
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: Validaciones manuales esperadas: 4
STR x10, [SP, #-8]!
// Pushing character 0: 86
MOV w0, #86
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 110
MOV w0, #110
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
// Pushing character 12: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 97
MOV w0, #97
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
// Pushing character 22: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 31: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 32: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 33: 52
MOV w0, #52
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
// String constant: ==== Declaración de variables ====
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
// Pushing character 5: 68
MOV w0, #68
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 243
MOV w0, #243
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 118
MOV w0, #118
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 98
MOV w0, #98
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 32
MOV w0, #32
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
// Implicit declaration: puntosDeclaracion
// Constant 0
MOV x0, #0
STR x0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: Declaración explícita con tipo y valor
STR x10, [SP, #-8]!
// Pushing character 0: 68
MOV w0, #68
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 114
MOV w0, #114
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
// Pushing character 12: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 120
MOV w0, #120
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 237
MOV w0, #237
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 116
MOV w0, #116
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
// Pushing character 26: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 31: 121
MOV w0, #121
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 32: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 33: 118
MOV w0, #118
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 34: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 35: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 36: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 37: 114
MOV w0, #114
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
// Variable declaration: entero
// Constant 42
MOV x0, #42
STR x0, [SP, #-8]!
// Variable declaration: decimal
// Float constant: 3.14
// Loading float value: 3.14 (hex: 0x40091EB851EB851F)
MOVZ x0, #0x851F, LSL #0
MOVK x0, #0x51EB, LSL #16
MOVK x0, #0x1EB8, LSL #32
MOVK x0, #0x4009, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Variable declaration: texto
// String constant: Hola!
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
// Pushing character 4: 33
MOV w0, #33
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Variable declaration: booleano
// Boolean constant: true
MOV x0, #1
STR x0, [SP, #-8]!
// Variable declaration: caracter
// Rune constant: 'A' (Unicode: 65)
MOV x0, #65
STR x0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: \n\n###Validacion Manual
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
// Pushing character 4: 35
MOV w0, #35
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 35
MOV w0, #35
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 35
MOV w0, #35
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 86
MOV w0, #86
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 77
MOV w0, #77
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 108
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
// String constant: entero:
STR x10, [SP, #-8]!
// Pushing character 0: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 116
MOV w0, #116
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
// Pushing character 6: 58
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
// Loading variable 'entero'
// Calculating offset for variable 'entero'
MOV x0, #32
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'entero'
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
// String constant: decimal:
STR x10, [SP, #-8]!
// Pushing character 0: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 108
MOV w0, #108
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
// Loading variable 'decimal'
// Calculating offset for variable 'decimal'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'decimal'
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
// String constant: texto:
STR x10, [SP, #-8]!
// Pushing character 0: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 120
MOV w0, #120
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 58
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
// Loading variable 'texto'
// Calculating offset for variable 'texto'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'texto'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// String constant: booleano:
STR x10, [SP, #-8]!
// Pushing character 0: 98
MOV w0, #98
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 58
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
// Loading variable 'booleano'
// Calculating offset for variable 'booleano'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'booleano'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: caracter:
STR x10, [SP, #-8]!
// Pushing character 0: 99
MOV w0, #99
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
// Pushing character 5: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 58
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
// Loading variable 'caracter'
// Calculating offset for variable 'caracter'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'caracter'
STR x0, [SP, #-8]!
// Popping value 2 for printing
LDR x0, [SP], #8
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
BL print_rune
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
// String constant: 
STR x10, [SP, #-8]!
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
// If statement
// Evaluating condition
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Equality operation
// Visiting left operand
// Loading variable 'entero'
// Calculating offset for variable 'entero'
MOV x0, #32
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'entero'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 42
MOV x0, #42
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_afd61997
MOV x0, #0
B eq_end_ae9be26f
eq_true_afd61997:
MOV x0, #1
eq_end_ae9be26f:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_fd749956
// First operand is true, evaluating second operand
// Comparison operation
// Visiting left operand
// Loading variable 'decimal'
// Calculating offset for variable 'decimal'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'decimal'
STR x0, [SP, #-8]!
// Visiting right operand
// Float constant: 3.0
// Loading float value: 3 (hex: 0x4008000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4008, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Comparison with operator: >
CMP x0, x1
B.gt cmp_true_f051d6e0
MOV x0, #0
B cmp_end_c6babc70
cmp_true_f051d6e0:
MOV x0, #1
cmp_end_c6babc70:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_69bc3965
and_false_fd749956:
MOV x0, #0
and_end_69bc3965:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_909330e3
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'texto'
// Calculating offset for variable 'texto'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'texto'
STR x0, [SP, #-8]!
// Visiting right operand
// String constant: Hola!
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
// Pushing character 4: 33
MOV w0, #33
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
// String equality comparison
.balign 16     // Garantizar alineamiento a 16 bytes
// X0 contains first string address
// X1 contains second string address
BL string_equals
.balign 16     // Garantizar alineamiento después de llamada a función
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_23335870
and_false_909330e3:
MOV x0, #0
and_end_23335870:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_c225745b
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'booleano'
// Calculating offset for variable 'booleano'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'booleano'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: true
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_233a83fb
MOV x0, #0
B eq_end_beee2aaa
eq_true_233a83fb:
MOV x0, #1
eq_end_beee2aaa:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_0d788978
and_false_c225745b:
MOV x0, #0
and_end_0d788978:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_980dfc09
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'caracter'
// Calculating offset for variable 'caracter'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'caracter'
STR x0, [SP, #-8]!
// Visiting right operand
// Rune constant: 'A' (Unicode: 65)
MOV x0, #65
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_054c4c8d
MOV x0, #0
B eq_end_1d640f0c
eq_true_054c4c8d:
MOV x0, #1
eq_end_1d640f0c:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_c55be3dd
and_false_980dfc09:
MOV x0, #0
and_end_c55be3dd:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Checking condition
CBZ x0, else_4fe4ebc3
// Then block
// Block statement
// Assignment statement
// Assignment to variable: puntosDeclaracion
// AddSub operation
// Visiting left operand
// Loading variable 'puntosDeclaracion'
// Calculating offset for variable 'puntosDeclaracion'
MOV x0, #40
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosDeclaracion'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'puntosDeclaracion' at offset 40
MOV x1, #40
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: OK Declaración explícita: correcto
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
// Pushing character 3: 68
MOV w0, #68
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 114
MOV w0, #114
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
// Pushing character 15: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 120
MOV w0, #120
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 237
MOV w0, #237
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 31: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 32: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 33: 111
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
B endif_d7637961
else_4fe4ebc3:
// Else block
// Else branch with block
// Block statement
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: X Declaración explícita: incorrecto
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
// Pushing character 2: 68
MOV w0, #68
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 114
MOV w0, #114
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
// Pushing character 14: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 120
MOV w0, #120
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 237
MOV w0, #237
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 110
MOV w0, #110
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
endif_d7637961:
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: Declaración sin valor
STR x10, [SP, #-8]!
// Pushing character 0: 68
MOV w0, #68
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 114
MOV w0, #114
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
// Pushing character 12: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 105
MOV w0, #105
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
// Pushing character 16: 118
MOV w0, #118
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 114
MOV w0, #114
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
// Variable declaration: enteroSinValor
// Using default value for type: int
MOV x0, #0
STR x0, [SP, #-8]!
// Variable declaration: decimalSinValor
// Using default value for type: float64
MOV x0, #0
STR x0, [SP, #-8]!
// Variable declaration: textoSinValor
// Using default value for type: string
STR x10, [SP, #-8]!
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Variable declaration: booleanoSinValor
// Using default value for type: bool
MOV x0, #0
STR x0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: enteroSinValor:
STR x10, [SP, #-8]!
// Pushing character 0: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 116
MOV w0, #116
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
// Pushing character 6: 83
MOV w0, #83
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 86
MOV w0, #86
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 58
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
// Loading variable 'enteroSinValor'
// Calculating offset for variable 'enteroSinValor'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'enteroSinValor'
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
// String constant: decimalSinValor:
STR x10, [SP, #-8]!
// Pushing character 0: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 83
MOV w0, #83
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 86
MOV w0, #86
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 114
MOV w0, #114
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
// Loading variable 'decimalSinValor'
// Calculating offset for variable 'decimalSinValor'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'decimalSinValor'
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
// String constant: textoSinValor:
STR x10, [SP, #-8]!
// Pushing character 0: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 120
MOV w0, #120
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 83
MOV w0, #83
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 86
MOV w0, #86
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 108
MOV w0, #108
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
// Pushing character 13: 58
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
// Loading variable 'textoSinValor'
// Calculating offset for variable 'textoSinValor'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'textoSinValor'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// String constant: booleanoSinValor:
STR x10, [SP, #-8]!
// Pushing character 0: 98
MOV w0, #98
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 83
MOV w0, #83
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 86
MOV w0, #86
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 58
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
// Loading variable 'booleanoSinValor'
// Calculating offset for variable 'booleanoSinValor'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'booleanoSinValor'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// If statement
// Evaluating condition
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Equality operation
// Visiting left operand
// Loading variable 'enteroSinValor'
// Calculating offset for variable 'enteroSinValor'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'enteroSinValor'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 0
MOV x0, #0
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_9bc6d073
MOV x0, #0
B eq_end_1241d0fe
eq_true_9bc6d073:
MOV x0, #1
eq_end_1241d0fe:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_7298da13
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'decimalSinValor'
// Calculating offset for variable 'decimalSinValor'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'decimalSinValor'
STR x0, [SP, #-8]!
// Visiting right operand
// Float constant: 0.0
// Loading float value: 0 (hex: 0x0)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x0, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Popping operands
LDR d1, [SP], #8
LDR x0, [SP], #8
// Float equality comparison
// Converting left operand from int to float
SCVTF d0, x0
// Comparing float values
FCMP d0, d1
B.eq eq_true_651d8414
MOV x0, #0
B eq_end_b629da0e
eq_true_651d8414:
MOV x0, #1
eq_end_b629da0e:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_d208ccde
and_false_7298da13:
MOV x0, #0
and_end_d208ccde:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_4f8c468a
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'textoSinValor'
// Calculating offset for variable 'textoSinValor'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'textoSinValor'
STR x0, [SP, #-8]!
// Visiting right operand
// String constant: 
STR x10, [SP, #-8]!
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// String equality comparison
.balign 16     // Garantizar alineamiento a 16 bytes
// X0 contains first string address
// X1 contains second string address
BL string_equals
.balign 16     // Garantizar alineamiento después de llamada a función
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_1897fdbf
and_false_4f8c468a:
MOV x0, #0
and_end_1897fdbf:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_d2072450
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'booleanoSinValor'
// Calculating offset for variable 'booleanoSinValor'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'booleanoSinValor'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: false
MOV x0, #0
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_01631c2b
MOV x0, #0
B eq_end_adffca00
eq_true_01631c2b:
MOV x0, #1
eq_end_adffca00:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_7ffab282
and_false_d2072450:
MOV x0, #0
and_end_7ffab282:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Checking condition
CBZ x0, else_bef0c669
// Then block
// Block statement
// Assignment statement
// Assignment to variable: puntosDeclaracion
// AddSub operation
// Visiting left operand
// Loading variable 'puntosDeclaracion'
// Calculating offset for variable 'puntosDeclaracion'
MOV x0, #72
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosDeclaracion'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'puntosDeclaracion' at offset 72
MOV x1, #72
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: OK Declaración sin valor: correcto
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
// Pushing character 3: 68
MOV w0, #68
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 114
MOV w0, #114
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
// Pushing character 15: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 118
MOV w0, #118
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 31: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 32: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 33: 111
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
B endif_b70e0b86
else_bef0c669:
// Else block
// Else branch with block
// Block statement
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: X Declaración sin valor: incorrecto
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
// Pushing character 2: 68
MOV w0, #68
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 114
MOV w0, #114
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
// Pushing character 14: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 118
MOV w0, #118
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 110
MOV w0, #110
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
endif_b70e0b86:
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: Declaración con inferencia de tipo
STR x10, [SP, #-8]!
// Pushing character 0: 68
MOV w0, #68
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 114
MOV w0, #114
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
// Pushing character 16: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 102
MOV w0, #102
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
// Pushing character 23: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 31: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 32: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 33: 111
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
// Implicit declaration: enteroInferido
// Constant 100
MOV x0, #100
STR x0, [SP, #-8]!
// Implicit declaration: decimalInferido
// Float constant: 2.71
// Loading float value: 2.71 (hex: 0x4005AE147AE147AE)
MOVZ x0, #0x47AE, LSL #0
MOVK x0, #0x7AE1, LSL #16
MOVK x0, #0xAE14, LSL #32
MOVK x0, #0x4005, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Implicit declaration: textoInferido
// String constant: Adios!
STR x10, [SP, #-8]!
// Pushing character 0: 65
MOV w0, #65
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 33
MOV w0, #33
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Implicit declaration: booleanoInferido
// Boolean constant: false
MOV x0, #0
STR x0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: enteroInferido:
STR x10, [SP, #-8]!
// Pushing character 0: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 116
MOV w0, #116
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
// Pushing character 6: 73
MOV w0, #73
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 102
MOV w0, #102
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 58
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
// Loading variable 'enteroInferido'
// Calculating offset for variable 'enteroInferido'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'enteroInferido'
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
// String constant: decimalInferido:
STR x10, [SP, #-8]!
// Pushing character 0: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 73
MOV w0, #73
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 102
MOV w0, #102
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 100
MOV w0, #100
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
// Loading variable 'decimalInferido'
// Calculating offset for variable 'decimalInferido'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'decimalInferido'
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
// String constant: textoInferido:
STR x10, [SP, #-8]!
// Pushing character 0: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 120
MOV w0, #120
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 73
MOV w0, #73
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 102
MOV w0, #102
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 58
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
// Loading variable 'textoInferido'
// Calculating offset for variable 'textoInferido'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'textoInferido'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// String constant: booleanoInferido:
STR x10, [SP, #-8]!
// Pushing character 0: 98
MOV w0, #98
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 73
MOV w0, #73
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 102
MOV w0, #102
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 58
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
// Loading variable 'booleanoInferido'
// Calculating offset for variable 'booleanoInferido'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'booleanoInferido'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// If statement
// Evaluating condition
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Equality operation
// Visiting left operand
// Loading variable 'enteroInferido'
// Calculating offset for variable 'enteroInferido'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'enteroInferido'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 100
MOV x0, #100
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_99fa0d96
MOV x0, #0
B eq_end_9cd45bd5
eq_true_99fa0d96:
MOV x0, #1
eq_end_9cd45bd5:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_f8cc4752
// First operand is true, evaluating second operand
// Comparison operation
// Visiting left operand
// Loading variable 'decimalInferido'
// Calculating offset for variable 'decimalInferido'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'decimalInferido'
STR x0, [SP, #-8]!
// Visiting right operand
// Float constant: 2.7
// Loading float value: 2.7 (hex: 0x400599999999999A)
MOVZ x0, #0x999A, LSL #0
MOVK x0, #0x9999, LSL #16
MOVK x0, #0x9999, LSL #32
MOVK x0, #0x4005, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Comparison with operator: >
CMP x0, x1
B.gt cmp_true_d06d8af5
MOV x0, #0
B cmp_end_6df09b1e
cmp_true_d06d8af5:
MOV x0, #1
cmp_end_6df09b1e:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_5f0d254f
and_false_f8cc4752:
MOV x0, #0
and_end_5f0d254f:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_204f0960
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'textoInferido'
// Calculating offset for variable 'textoInferido'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'textoInferido'
STR x0, [SP, #-8]!
// Visiting right operand
// String constant: Adios!
STR x10, [SP, #-8]!
// Pushing character 0: 65
MOV w0, #65
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 33
MOV w0, #33
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
// String equality comparison
.balign 16     // Garantizar alineamiento a 16 bytes
// X0 contains first string address
// X1 contains second string address
BL string_equals
.balign 16     // Garantizar alineamiento después de llamada a función
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_c05fc768
and_false_204f0960:
MOV x0, #0
and_end_c05fc768:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_0fd97de5
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'booleanoInferido'
// Calculating offset for variable 'booleanoInferido'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'booleanoInferido'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: false
MOV x0, #0
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_d2725f26
MOV x0, #0
B eq_end_f6d5e4d3
eq_true_d2725f26:
MOV x0, #1
eq_end_f6d5e4d3:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_8a0390ec
and_false_0fd97de5:
MOV x0, #0
and_end_8a0390ec:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Checking condition
CBZ x0, else_7dfb1461
// Then block
// Block statement
// Assignment statement
// Assignment to variable: puntosDeclaracion
// AddSub operation
// Visiting left operand
// Loading variable 'puntosDeclaracion'
// Calculating offset for variable 'puntosDeclaracion'
MOV x0, #104
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosDeclaracion'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'puntosDeclaracion' at offset 104
MOV x1, #104
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: OK Declaración con inferencia: correcto
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
// Pushing character 3: 68
MOV w0, #68
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 114
MOV w0, #114
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
// Pushing character 15: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 102
MOV w0, #102
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 32
MOV w0, #32
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
B endif_9a258d8e
else_7dfb1461:
// Else block
// Else branch with block
// Block statement
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: X Declaración con inferencia: incorrecto
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
// Pushing character 2: 68
MOV w0, #68
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 114
MOV w0, #114
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
// Pushing character 14: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 102
MOV w0, #102
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 114
MOV w0, #114
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
// Pushing character 25: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 97
MOV w0, #97
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
// Pushing character 30: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 31: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 32: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 33: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 34: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 35: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 36: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 37: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 38: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 39: 111
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
endif_9a258d8e:
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: \n==== Asignación de variables ====
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
// Pushing character 8: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 103
MOV w0, #103
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 243
MOV w0, #243
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 118
MOV w0, #118
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 98
MOV w0, #98
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 31: 61
MOV w0, #61
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
// Implicit declaration: puntosAsignacion
// Constant 0
MOV x0, #0
STR x0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: Asignación con tipo correcto
STR x10, [SP, #-8]!
// Pushing character 0: 65
MOV w0, #65
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 103
MOV w0, #103
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 243
MOV w0, #243
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 111
MOV w0, #111
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
// Pushing character 15: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 111
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
// Assignment to variable: entero
// Constant 99
MOV x0, #99
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'entero' at offset 104
MOV x1, #104
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Assignment statement
// Assignment to variable: decimal
// Float constant: 9.9
// Loading float value: 9.9 (hex: 0x4023CCCCCCCCCCCD)
MOVZ x0, #0xCCCD, LSL #0
MOVK x0, #0xCCCC, LSL #16
MOVK x0, #0xCCCC, LSL #32
MOVK x0, #0x4023, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'decimal' at offset 96
MOV x1, #96
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Assignment statement
// Assignment to variable: texto
// String constant: Nuevo
STR x10, [SP, #-8]!
// Pushing character 0: 78
MOV w0, #78
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
// Pushing character 4: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
LDR x0, [SP], #8
// Storing value to variable 'texto' at offset 88
MOV x1, #88
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Assignment statement
// Assignment to variable: booleano
// Logical NOT operation
// Evaluating expression
// Loading variable 'booleano'
// Calculating offset for variable 'booleano'
MOV x0, #80
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'booleano'
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Inverting boolean value
EOR x0, x0, #1
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'booleano' at offset 80
MOV x1, #80
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: \n\n###Validacion Manual
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
// Pushing character 4: 35
MOV w0, #35
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 35
MOV w0, #35
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 35
MOV w0, #35
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 86
MOV w0, #86
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 77
MOV w0, #77
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 108
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
// String constant: entero:
STR x10, [SP, #-8]!
// Pushing character 0: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 116
MOV w0, #116
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
// Pushing character 6: 58
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
// Loading variable 'entero'
// Calculating offset for variable 'entero'
MOV x0, #104
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'entero'
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
// String constant: decimal:
STR x10, [SP, #-8]!
// Pushing character 0: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 108
MOV w0, #108
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
// Loading variable 'decimal'
// Calculating offset for variable 'decimal'
MOV x0, #96
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'decimal'
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
// String constant: texto:
STR x10, [SP, #-8]!
// Pushing character 0: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 120
MOV w0, #120
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 58
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
// Loading variable 'texto'
// Calculating offset for variable 'texto'
MOV x0, #88
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'texto'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// String constant: booleano:
STR x10, [SP, #-8]!
// Pushing character 0: 98
MOV w0, #98
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 58
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
// Loading variable 'booleano'
// Calculating offset for variable 'booleano'
MOV x0, #80
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'booleano'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: 
STR x10, [SP, #-8]!
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
// If statement
// Evaluating condition
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Equality operation
// Visiting left operand
// Loading variable 'entero'
// Calculating offset for variable 'entero'
MOV x0, #104
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'entero'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 99
MOV x0, #99
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_ba7b9e0c
MOV x0, #0
B eq_end_05aae196
eq_true_ba7b9e0c:
MOV x0, #1
eq_end_05aae196:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_c49a9a26
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'decimal'
// Calculating offset for variable 'decimal'
MOV x0, #96
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'decimal'
STR x0, [SP, #-8]!
// Visiting right operand
// Float constant: 9.9
// Loading float value: 9.9 (hex: 0x4023CCCCCCCCCCCD)
MOVZ x0, #0xCCCD, LSL #0
MOVK x0, #0xCCCC, LSL #16
MOVK x0, #0xCCCC, LSL #32
MOVK x0, #0x4023, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Popping operands
LDR d1, [SP], #8
LDR d0, [SP], #8
// Float equality comparison
// Comparing float values
FCMP d0, d1
B.eq eq_true_fc6184ea
MOV x0, #0
B eq_end_a3686088
eq_true_fc6184ea:
MOV x0, #1
eq_end_a3686088:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_60e715cc
and_false_c49a9a26:
MOV x0, #0
and_end_60e715cc:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_d5a64d2b
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'texto'
// Calculating offset for variable 'texto'
MOV x0, #88
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'texto'
STR x0, [SP, #-8]!
// Visiting right operand
// String constant: Nuevo
STR x10, [SP, #-8]!
// Pushing character 0: 78
MOV w0, #78
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
// Pushing character 4: 111
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
// String equality comparison
.balign 16     // Garantizar alineamiento a 16 bytes
// X0 contains first string address
// X1 contains second string address
BL string_equals
.balign 16     // Garantizar alineamiento después de llamada a función
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_c5307dff
and_false_d5a64d2b:
MOV x0, #0
and_end_c5307dff:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_f675d29b
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'booleano'
// Calculating offset for variable 'booleano'
MOV x0, #80
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'booleano'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: false
MOV x0, #0
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_7936528d
MOV x0, #0
B eq_end_93cf67cf
eq_true_7936528d:
MOV x0, #1
eq_end_93cf67cf:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_39db41d0
and_false_f675d29b:
MOV x0, #0
and_end_39db41d0:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Checking condition
CBZ x0, else_b0b10466
// Then block
// Block statement
// Assignment statement
// Assignment to variable: puntosAsignacion
// AddSub operation
// Visiting left operand
// Loading variable 'puntosAsignacion'
// Calculating offset for variable 'puntosAsignacion'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosAsignacion'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'puntosAsignacion' at offset 0
MOV x1, #0
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: OK Asignación simple: correcto
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
// Pushing character 6: 103
MOV w0, #103
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 110
MOV w0, #110
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
// Pushing character 14: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 112
MOV w0, #112
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
B endif_1bcca821
else_b0b10466:
// Else block
// Else branch with block
// Block statement
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: X Asignación simple: incorrecto
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
// Pushing character 3: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 103
MOV w0, #103
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 243
MOV w0, #243
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
// Pushing character 13: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 108
MOV w0, #108
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
endif_1bcca821:
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: Asignación con expresiones
STR x10, [SP, #-8]!
// Pushing character 0: 65
MOV w0, #65
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 103
MOV w0, #103
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 243
MOV w0, #243
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 111
MOV w0, #111
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
// Pushing character 15: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 120
MOV w0, #120
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 114
MOV w0, #114
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
// Pushing character 21: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 115
MOV w0, #115
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
// Assignment to variable: entero
// AddSub operation
// Visiting left operand
// Loading variable 'entero'
// Calculating offset for variable 'entero'
MOV x0, #104
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'entero'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'entero' at offset 104
MOV x1, #104
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Assignment statement
// Assignment to variable: decimal
// MulDiv operation
// Visiting left operand
// Loading variable 'decimal'
// Calculating offset for variable 'decimal'
MOV x0, #96
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'decimal'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 2
MOV x0, #2
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR d0, [SP], #8
// Converting operands to float if needed
// Converting right operand from int to float
SCVTF d1, x1
// Performing float * operation
FMUL d0, d0, d1
// Pushing float result
STR d0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'decimal' at offset 96
MOV x1, #96
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Assignment statement
// Assignment to variable: texto
// AddSub operation
// Visiting left operand
// Loading variable 'texto'
// Calculating offset for variable 'texto'
MOV x0, #88
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'texto'
STR x0, [SP, #-8]!
// Visiting right operand
// String constant: !
STR x10, [SP, #-8]!
// Pushing character 0: 33
MOV w0, #33
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
LDR x0, [SP], #8
// Storing value to variable 'texto' at offset 88
MOV x1, #88
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Assignment statement
// Assignment to variable: booleano
// Logical NOT operation
// Evaluating expression
// Loading variable 'booleano'
// Calculating offset for variable 'booleano'
MOV x0, #80
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'booleano'
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Inverting boolean value
EOR x0, x0, #1
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'booleano' at offset 80
MOV x1, #80
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: entero:
STR x10, [SP, #-8]!
// Pushing character 0: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 116
MOV w0, #116
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
// Pushing character 6: 58
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
// Loading variable 'entero'
// Calculating offset for variable 'entero'
MOV x0, #104
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'entero'
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
// String constant: decimal:
STR x10, [SP, #-8]!
// Pushing character 0: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 108
MOV w0, #108
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
// Loading variable 'decimal'
// Calculating offset for variable 'decimal'
MOV x0, #96
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'decimal'
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
// String constant: texto:
STR x10, [SP, #-8]!
// Pushing character 0: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 120
MOV w0, #120
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 58
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
// Loading variable 'texto'
// Calculating offset for variable 'texto'
MOV x0, #88
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'texto'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// String constant: booleano:
STR x10, [SP, #-8]!
// Pushing character 0: 98
MOV w0, #98
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 58
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
// Loading variable 'booleano'
// Calculating offset for variable 'booleano'
MOV x0, #80
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'booleano'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// If statement
// Evaluating condition
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Equality operation
// Visiting left operand
// Loading variable 'entero'
// Calculating offset for variable 'entero'
MOV x0, #104
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'entero'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 100
MOV x0, #100
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_43076b8b
MOV x0, #0
B eq_end_2703ec8c
eq_true_43076b8b:
MOV x0, #1
eq_end_2703ec8c:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_5cf08114
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'decimal'
// Calculating offset for variable 'decimal'
MOV x0, #96
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'decimal'
STR x0, [SP, #-8]!
// Visiting right operand
// Float constant: 19.8
// Loading float value: 19.8 (hex: 0x4033CCCCCCCCCCCD)
MOVZ x0, #0xCCCD, LSL #0
MOVK x0, #0xCCCC, LSL #16
MOVK x0, #0xCCCC, LSL #32
MOVK x0, #0x4033, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Popping operands
LDR d1, [SP], #8
LDR d0, [SP], #8
// Float equality comparison
// Comparing float values
FCMP d0, d1
B.eq eq_true_d8d9117e
MOV x0, #0
B eq_end_d075b768
eq_true_d8d9117e:
MOV x0, #1
eq_end_d075b768:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_5c297ef3
and_false_5cf08114:
MOV x0, #0
and_end_5c297ef3:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_09ae595d
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'texto'
// Calculating offset for variable 'texto'
MOV x0, #88
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'texto'
STR x0, [SP, #-8]!
// Visiting right operand
// String constant: Nuevo!
STR x10, [SP, #-8]!
// Pushing character 0: 78
MOV w0, #78
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
// Pushing character 4: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 33
MOV w0, #33
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
// String equality comparison
.balign 16     // Garantizar alineamiento a 16 bytes
// X0 contains first string address
// X1 contains second string address
BL string_equals
.balign 16     // Garantizar alineamiento después de llamada a función
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_91c456a7
and_false_09ae595d:
MOV x0, #0
and_end_91c456a7:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_e5de7bde
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'booleano'
// Calculating offset for variable 'booleano'
MOV x0, #80
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'booleano'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: true
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_a08cd08f
MOV x0, #0
B eq_end_a24f5c13
eq_true_a08cd08f:
MOV x0, #1
eq_end_a24f5c13:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_d123ac41
and_false_e5de7bde:
MOV x0, #0
and_end_d123ac41:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Checking condition
CBZ x0, else_8564f126
// Then block
// Block statement
// Assignment statement
// Assignment to variable: puntosAsignacion
// AddSub operation
// Visiting left operand
// Loading variable 'puntosAsignacion'
// Calculating offset for variable 'puntosAsignacion'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosAsignacion'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'puntosAsignacion' at offset 0
MOV x1, #0
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: OK Asignación con expresiones: correcto
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
// Pushing character 6: 103
MOV w0, #103
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 110
MOV w0, #110
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
// Pushing character 14: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 110
MOV w0, #110
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
// Pushing character 19: 120
MOV w0, #120
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 32
MOV w0, #32
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
B endif_19ad99f8
else_8564f126:
// Else block
// Else branch with block
// Block statement
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: X Asignación con expresiones: incorrecto
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
// Pushing character 3: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 103
MOV w0, #103
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 243
MOV w0, #243
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
// Pushing character 13: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 120
MOV w0, #120
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 114
MOV w0, #114
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
// Pushing character 23: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 101
MOV w0, #101
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
// Pushing character 30: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 31: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 32: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 33: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 34: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 35: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 36: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 37: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 38: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 39: 111
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
endif_19ad99f8:
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: Asignación con tipo incorrecto
STR x10, [SP, #-8]!
// Pushing character 0: 65
MOV w0, #65
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 103
MOV w0, #103
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 243
MOV w0, #243
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 111
MOV w0, #111
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
// Pushing character 15: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 110
MOV w0, #110
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
// Assignment statement
// Assignment to variable: puntosAsignacion
// AddSub operation
// Visiting left operand
// Loading variable 'puntosAsignacion'
// Calculating offset for variable 'puntosAsignacion'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosAsignacion'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'puntosAsignacion' at offset 0
MOV x1, #0
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: OK Asignación con tipo incorrecto: correcto
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
// Pushing character 6: 103
MOV w0, #103
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 110
MOV w0, #110
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
// Pushing character 14: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 31: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 32: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 33: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 34: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 35: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 36: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 37: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 38: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 39: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 40: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 41: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 42: 111
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: \n==== Operaciones Aritméticas ====
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
// Pushing character 7: 79
MOV w0, #79
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 65
MOV w0, #65
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 233
MOV w0, #233
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 31: 61
MOV w0, #61
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
// Implicit declaration: puntosOperacionesAritmeticas
// Constant 0
MOV x0, #0
STR x0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: Suma
STR x10, [SP, #-8]!
// Pushing character 0: 83
MOV w0, #83
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
// Implicit declaration: resultadoSuma1
// AddSub operation
// Visiting left operand
// Constant 10
MOV x0, #10
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 5
MOV x0, #5
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
// Implicit declaration: resultadoSuma2
// AddSub operation
// Visiting left operand
// Float constant: 10.5
// Loading float value: 10.5 (hex: 0x4025000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4025, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Visiting right operand
// Float constant: 5.5
// Loading float value: 5.5 (hex: 0x4016000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4016, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Popping operands
LDR d1, [SP], #8
LDR d0, [SP], #8
// Converting operands to float if needed
// Performing float + operation
FADD d0, d0, d1
// Pushing float result
STR d0, [SP, #-8]!
// Implicit declaration: resultadoSuma3
// AddSub operation
// Visiting left operand
// Constant 10
MOV x0, #10
STR x0, [SP, #-8]!
// Visiting right operand
// Float constant: 5.5
// Loading float value: 5.5 (hex: 0x4016000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4016, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Popping operands
LDR d1, [SP], #8
LDR x0, [SP], #8
// Converting operands to float if needed
// Converting left operand from int to float
SCVTF d0, x0
// Performing float + operation
FADD d0, d0, d1
// Pushing float result
STR d0, [SP, #-8]!
// Implicit declaration: resultadoSuma4
// AddSub operation
// Visiting left operand
// Float constant: 10.5
// Loading float value: 10.5 (hex: 0x4025000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4025, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Visiting right operand
// Constant 5
MOV x0, #5
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR d0, [SP], #8
// Converting operands to float if needed
// Converting right operand from int to float
SCVTF d1, x1
// Performing float + operation
FADD d0, d0, d1
// Pushing float result
STR d0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: 10 + 5 =
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
// Pushing character 3: 43
MOV w0, #43
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 53
MOV w0, #53
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
// Loading variable 'resultadoSuma1'
// Calculating offset for variable 'resultadoSuma1'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoSuma1'
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
// String constant: 10.5 + 5.5 =
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
// Pushing character 3: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 43
MOV w0, #43
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 46
MOV w0, #46
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 53
MOV w0, #53
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
// Loading variable 'resultadoSuma2'
// Calculating offset for variable 'resultadoSuma2'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoSuma2'
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
// String constant: 10 + 5.5 =
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
// Pushing character 3: 43
MOV w0, #43
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 46
MOV w0, #46
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 53
MOV w0, #53
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
// Loading variable 'resultadoSuma3'
// Calculating offset for variable 'resultadoSuma3'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoSuma3'
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
// String constant: 10.5 + 5 =
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
// Pushing character 3: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 43
MOV w0, #43
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 53
MOV w0, #53
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
// Loading variable 'resultadoSuma4'
// Calculating offset for variable 'resultadoSuma4'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoSuma4'
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
// If statement
// Evaluating condition
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoSuma1'
// Calculating offset for variable 'resultadoSuma1'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoSuma1'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 15
MOV x0, #15
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_d6c952e9
MOV x0, #0
B eq_end_ba54ef90
eq_true_d6c952e9:
MOV x0, #1
eq_end_ba54ef90:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_f933ba0a
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoSuma2'
// Calculating offset for variable 'resultadoSuma2'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoSuma2'
STR x0, [SP, #-8]!
// Visiting right operand
// Float constant: 16.0
// Loading float value: 16 (hex: 0x4030000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4030, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Popping operands
LDR d1, [SP], #8
LDR d0, [SP], #8
// Float equality comparison
// Comparing float values
FCMP d0, d1
B.eq eq_true_ec05139c
MOV x0, #0
B eq_end_d72b0b6d
eq_true_ec05139c:
MOV x0, #1
eq_end_d72b0b6d:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_dfcb077b
and_false_f933ba0a:
MOV x0, #0
and_end_dfcb077b:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_7720f501
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoSuma3'
// Calculating offset for variable 'resultadoSuma3'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoSuma3'
STR x0, [SP, #-8]!
// Visiting right operand
// Float constant: 15.5
// Loading float value: 15.5 (hex: 0x402F000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x402F, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Popping operands
LDR d1, [SP], #8
LDR d0, [SP], #8
// Float equality comparison
// Comparing float values
FCMP d0, d1
B.eq eq_true_19b3b15b
MOV x0, #0
B eq_end_b7311f08
eq_true_19b3b15b:
MOV x0, #1
eq_end_b7311f08:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_b7c84cdb
and_false_7720f501:
MOV x0, #0
and_end_b7c84cdb:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_89307702
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoSuma4'
// Calculating offset for variable 'resultadoSuma4'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoSuma4'
STR x0, [SP, #-8]!
// Visiting right operand
// Float constant: 15.5
// Loading float value: 15.5 (hex: 0x402F000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x402F, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Popping operands
LDR d1, [SP], #8
LDR d0, [SP], #8
// Float equality comparison
// Comparing float values
FCMP d0, d1
B.eq eq_true_015202b7
MOV x0, #0
B eq_end_26cb1b78
eq_true_015202b7:
MOV x0, #1
eq_end_26cb1b78:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_91844ca3
and_false_89307702:
MOV x0, #0
and_end_91844ca3:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Checking condition
CBZ x0, else_988521fa
// Then block
// Block statement
// Assignment statement
// Assignment to variable: puntosOperacionesAritmeticas
// AddSub operation
// Visiting left operand
// Loading variable 'puntosOperacionesAritmeticas'
// Calculating offset for variable 'puntosOperacionesAritmeticas'
MOV x0, #32
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosOperacionesAritmeticas'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'puntosOperacionesAritmeticas' at offset 32
MOV x1, #32
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: OK Suma: correcto
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
// Pushing character 3: 83
MOV w0, #83
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 58
MOV w0, #58
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
// Pushing character 11: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 111
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
B endif_c8cc449f
else_988521fa:
// Else block
// Else branch with block
// Block statement
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: X Suma: incorrecto
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
// Pushing character 2: 83
MOV w0, #83
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 105
MOV w0, #105
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
// Pushing character 13: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 111
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
endif_c8cc449f:
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: Multiplicación
STR x10, [SP, #-8]!
// Pushing character 0: 77
MOV w0, #77
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 108
MOV w0, #108
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
// Implicit declaration: resultadoMult1
// MulDiv operation
// Visiting left operand
// Constant 5
MOV x0, #5
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 3
MOV x0, #3
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
MUL x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
// Implicit declaration: resultadoMult2
// MulDiv operation
// Visiting left operand
// Float constant: 5.5
// Loading float value: 5.5 (hex: 0x4016000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4016, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Visiting right operand
// Float constant: 2.0
// Loading float value: 2 (hex: 0x4000000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4000, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Popping operands
LDR d1, [SP], #8
LDR d0, [SP], #8
// Converting operands to float if needed
// Performing float * operation
FMUL d0, d0, d1
// Pushing float result
STR d0, [SP, #-8]!
// Implicit declaration: resultadoMult3
// MulDiv operation
// Visiting left operand
// Constant 5
MOV x0, #5
STR x0, [SP, #-8]!
// Visiting right operand
// Float constant: 2.5
// Loading float value: 2.5 (hex: 0x4004000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4004, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Popping operands
LDR d1, [SP], #8
LDR x0, [SP], #8
// Converting operands to float if needed
// Converting left operand from int to float
SCVTF d0, x0
// Performing float * operation
FMUL d0, d0, d1
// Pushing float result
STR d0, [SP, #-8]!
// Implicit declaration: resultadoMult4
// MulDiv operation
// Visiting left operand
// Float constant: 5.5
// Loading float value: 5.5 (hex: 0x4016000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4016, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Visiting right operand
// Constant 2
MOV x0, #2
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR d0, [SP], #8
// Converting operands to float if needed
// Converting right operand from int to float
SCVTF d1, x1
// Performing float * operation
FMUL d0, d0, d1
// Pushing float result
STR d0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: 5 * 3 =
STR x10, [SP, #-8]!
// Pushing character 0: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 42
MOV w0, #42
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 51
MOV w0, #51
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 61
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
// Loading variable 'resultadoMult1'
// Calculating offset for variable 'resultadoMult1'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoMult1'
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
// String constant: 5.5 * 2.0 =
STR x10, [SP, #-8]!
// Pushing character 0: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 46
MOV w0, #46
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 42
MOV w0, #42
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 50
MOV w0, #50
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 46
MOV w0, #46
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 48
MOV w0, #48
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 61
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
// Loading variable 'resultadoMult2'
// Calculating offset for variable 'resultadoMult2'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoMult2'
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
// String constant: 5 * 2.5 =
STR x10, [SP, #-8]!
// Pushing character 0: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 42
MOV w0, #42
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 50
MOV w0, #50
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 46
MOV w0, #46
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 61
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
// Loading variable 'resultadoMult3'
// Calculating offset for variable 'resultadoMult3'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoMult3'
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
// String constant: 5.5 * 2 =
STR x10, [SP, #-8]!
// Pushing character 0: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 46
MOV w0, #46
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 42
MOV w0, #42
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 50
MOV w0, #50
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 61
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
// Loading variable 'resultadoMult4'
// Calculating offset for variable 'resultadoMult4'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoMult4'
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
// If statement
// Evaluating condition
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoMult1'
// Calculating offset for variable 'resultadoMult1'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoMult1'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 15
MOV x0, #15
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_cba09ea7
MOV x0, #0
B eq_end_bd7ae022
eq_true_cba09ea7:
MOV x0, #1
eq_end_bd7ae022:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_3df98058
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoMult2'
// Calculating offset for variable 'resultadoMult2'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoMult2'
STR x0, [SP, #-8]!
// Visiting right operand
// Float constant: 11.0
// Loading float value: 11 (hex: 0x4026000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4026, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Popping operands
LDR d1, [SP], #8
LDR d0, [SP], #8
// Float equality comparison
// Comparing float values
FCMP d0, d1
B.eq eq_true_ade2c21d
MOV x0, #0
B eq_end_9ae82087
eq_true_ade2c21d:
MOV x0, #1
eq_end_9ae82087:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_4ae96670
and_false_3df98058:
MOV x0, #0
and_end_4ae96670:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_c76ace7c
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoMult3'
// Calculating offset for variable 'resultadoMult3'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoMult3'
STR x0, [SP, #-8]!
// Visiting right operand
// Float constant: 12.5
// Loading float value: 12.5 (hex: 0x4029000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4029, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Popping operands
LDR d1, [SP], #8
LDR d0, [SP], #8
// Float equality comparison
// Comparing float values
FCMP d0, d1
B.eq eq_true_10e620f2
MOV x0, #0
B eq_end_725ca8a7
eq_true_10e620f2:
MOV x0, #1
eq_end_725ca8a7:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_baebf088
and_false_c76ace7c:
MOV x0, #0
and_end_baebf088:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_199cf1cf
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoMult4'
// Calculating offset for variable 'resultadoMult4'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoMult4'
STR x0, [SP, #-8]!
// Visiting right operand
// Float constant: 11.0
// Loading float value: 11 (hex: 0x4026000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4026, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Popping operands
LDR d1, [SP], #8
LDR d0, [SP], #8
// Float equality comparison
// Comparing float values
FCMP d0, d1
B.eq eq_true_95fd94e4
MOV x0, #0
B eq_end_dcf6aa9e
eq_true_95fd94e4:
MOV x0, #1
eq_end_dcf6aa9e:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_4c4c9a6b
and_false_199cf1cf:
MOV x0, #0
and_end_4c4c9a6b:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Checking condition
CBZ x0, else_055ce1bd
// Then block
// Block statement
// Assignment statement
// Assignment to variable: puntosOperacionesAritmeticas
// AddSub operation
// Visiting left operand
// Loading variable 'puntosOperacionesAritmeticas'
// Calculating offset for variable 'puntosOperacionesAritmeticas'
MOV x0, #64
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosOperacionesAritmeticas'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'puntosOperacionesAritmeticas' at offset 64
MOV x1, #64
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: OK Multiplicación: correcto
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
// Pushing character 4: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 243
MOV w0, #243
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 99
MOV w0, #99
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
B endif_21f04a92
else_055ce1bd:
// Else block
// Else branch with block
// Block statement
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: X Multiplicación: incorrecto
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
// Pushing character 3: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 112
MOV w0, #112
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
// Pushing character 10: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 243
MOV w0, #243
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 111
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
endif_21f04a92:
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
// Loading variable 'resultadoDiv1'
// Calculating offset for variable 'resultadoDiv1'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoDiv1'
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
// If statement
// Evaluating condition
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoDiv1'
// Calculating offset for variable 'resultadoDiv1'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoDiv1'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 5
MOV x0, #5
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR d0, [SP], #8
// Float equality comparison
// Converting right operand from int to float
SCVTF d1, x1
// Comparing float values
FCMP d0, d1
B.eq eq_true_0004388b
MOV x0, #0
B eq_end_447fd1e3
eq_true_0004388b:
MOV x0, #1
eq_end_447fd1e3:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_9abab91f
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoDiv2'
// Calculating offset for variable 'resultadoDiv2'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoDiv2'
STR x0, [SP, #-8]!
// Visiting right operand
// Float constant: 2.5
// Loading float value: 2.5 (hex: 0x4004000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4004, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Popping operands
LDR d1, [SP], #8
LDR d0, [SP], #8
// Float equality comparison
// Comparing float values
FCMP d0, d1
B.eq eq_true_2836bd2a
MOV x0, #0
B eq_end_5cb0e911
eq_true_2836bd2a:
MOV x0, #1
eq_end_5cb0e911:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_e0180f0c
and_false_9abab91f:
MOV x0, #0
and_end_e0180f0c:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_28fe6a33
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoDiv3'
// Calculating offset for variable 'resultadoDiv3'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoDiv3'
STR x0, [SP, #-8]!
// Visiting right operand
// Float constant: 2.5
// Loading float value: 2.5 (hex: 0x4004000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4004, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Popping operands
LDR d1, [SP], #8
LDR d0, [SP], #8
// Float equality comparison
// Comparing float values
FCMP d0, d1
B.eq eq_true_476ec115
MOV x0, #0
B eq_end_7a72f1e6
eq_true_476ec115:
MOV x0, #1
eq_end_7a72f1e6:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_0f63a147
and_false_28fe6a33:
MOV x0, #0
and_end_0f63a147:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_31714682
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoDiv4'
// Calculating offset for variable 'resultadoDiv4'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoDiv4'
STR x0, [SP, #-8]!
// Visiting right operand
// Float constant: 2.5
// Loading float value: 2.5 (hex: 0x4004000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4004, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Popping operands
LDR d1, [SP], #8
LDR d0, [SP], #8
// Float equality comparison
// Comparing float values
FCMP d0, d1
B.eq eq_true_ffd1f8bb
MOV x0, #0
B eq_end_6dfcf417
eq_true_ffd1f8bb:
MOV x0, #1
eq_end_6dfcf417:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_a8775666
and_false_31714682:
MOV x0, #0
and_end_a8775666:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Checking condition
CBZ x0, else_d5632d7d
// Then block
// Block statement
// Assignment statement
// Assignment to variable: puntosOperacionesAritmeticas
// AddSub operation
// Visiting left operand
// Loading variable 'puntosOperacionesAritmeticas'
// Calculating offset for variable 'puntosOperacionesAritmeticas'
MOV x0, #96
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosOperacionesAritmeticas'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'puntosOperacionesAritmeticas' at offset 96
MOV x1, #96
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: OK División: correcto
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
// Pushing character 3: 68
MOV w0, #68
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 118
MOV w0, #118
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 115
MOV w0, #115
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
// Pushing character 11: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 111
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
B endif_c56f8a60
else_d5632d7d:
// Else block
// Else branch with block
// Block statement
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: X División: incorrecto
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
// Pushing character 2: 68
MOV w0, #68
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 118
MOV w0, #118
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 243
MOV w0, #243
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 111
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
endif_c56f8a60:
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: \n==== Operaciones Relacionales ====
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
// Pushing character 7: 79
MOV w0, #79
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 82
MOV w0, #82
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 108
MOV w0, #108
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
// Pushing character 35: 61
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
// Implicit declaration: puntosOperacionesRelacionales
// Constant 0
MOV x0, #0
STR x0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: Igualdad
STR x10, [SP, #-8]!
// Pushing character 0: 73
MOV w0, #73
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 103
MOV w0, #103
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 100
MOV w0, #100
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
// Implicit declaration: resultadoIgualdad1
// Equality operation
// Visiting left operand
// Constant 10
MOV x0, #10
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
B.eq eq_true_88c773a2
MOV x0, #0
B eq_end_cbf107f3
eq_true_88c773a2:
MOV x0, #1
eq_end_cbf107f3:
STR x0, [SP, #-8]!
// Implicit declaration: resultadoIgualdad2
// Equality operation
// Visiting left operand
// Constant 10
MOV x0, #10
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 5
MOV x0, #5
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_262180f4
MOV x0, #0
B eq_end_d5b14a0b
eq_true_262180f4:
MOV x0, #1
eq_end_d5b14a0b:
STR x0, [SP, #-8]!
// Implicit declaration: resultadoIgualdad3
// Equality operation
// Visiting left operand
// Float constant: 10.5
// Loading float value: 10.5 (hex: 0x4025000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4025, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Visiting right operand
// Float constant: 10.5
// Loading float value: 10.5 (hex: 0x4025000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4025, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Popping operands
LDR d1, [SP], #8
LDR d0, [SP], #8
// Float equality comparison
// Comparing float values
FCMP d0, d1
B.eq eq_true_307518b1
MOV x0, #0
B eq_end_a739ec1b
eq_true_307518b1:
MOV x0, #1
eq_end_a739ec1b:
STR x0, [SP, #-8]!
// Implicit declaration: resultadoIgualdad4
// Equality operation
// Visiting left operand
// Float constant: 10.5
// Loading float value: 10.5 (hex: 0x4025000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4025, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Visiting right operand
// Float constant: 5.5
// Loading float value: 5.5 (hex: 0x4016000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4016, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Popping operands
LDR d1, [SP], #8
LDR d0, [SP], #8
// Float equality comparison
// Comparing float values
FCMP d0, d1
B.eq eq_true_34dd37e2
MOV x0, #0
B eq_end_901964c6
eq_true_34dd37e2:
MOV x0, #1
eq_end_901964c6:
STR x0, [SP, #-8]!
// Implicit declaration: resultadoIgualdad5
// Equality operation
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
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// String equality comparison
.balign 16     // Garantizar alineamiento a 16 bytes
// X0 contains first string address
// X1 contains second string address
BL string_equals
.balign 16     // Garantizar alineamiento después de llamada a función
STR x0, [SP, #-8]!
// Implicit declaration: resultadoIgualdad6
// Equality operation
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
// String constant: Mundo
STR x10, [SP, #-8]!
// Pushing character 0: 77
MOV w0, #77
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
// Pushing character 3: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 111
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
// String equality comparison
.balign 16     // Garantizar alineamiento a 16 bytes
// X0 contains first string address
// X1 contains second string address
BL string_equals
.balign 16     // Garantizar alineamiento después de llamada a función
STR x0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: 10 == 10:
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
// Pushing character 5: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 49
MOV w0, #49
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 48
MOV w0, #48
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 58
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
// Loading variable 'resultadoIgualdad1'
// Calculating offset for variable 'resultadoIgualdad1'
MOV x0, #40
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoIgualdad1'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: 10 == 5:
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
// Pushing character 5: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 53
MOV w0, #53
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
// Loading variable 'resultadoIgualdad2'
// Calculating offset for variable 'resultadoIgualdad2'
MOV x0, #32
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoIgualdad2'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: 10.5 == 10.5:
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
// Pushing character 3: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 49
MOV w0, #49
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 48
MOV w0, #48
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 46
MOV w0, #46
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 53
MOV w0, #53
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
// Loading variable 'resultadoIgualdad3'
// Calculating offset for variable 'resultadoIgualdad3'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoIgualdad3'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: 10.5 == 5.5:
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
// Pushing character 3: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 46
MOV w0, #46
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 58
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
// Loading variable 'resultadoIgualdad4'
// Calculating offset for variable 'resultadoIgualdad4'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoIgualdad4'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: \"Hola\" == \"Hola\":
STR x10, [SP, #-8]!
// Pushing escape sequence character: \
MOV w0, #92
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing escape sequence character: "
MOV w0, #34
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 72
MOV w0, #72
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing escape sequence character: \
MOV w0, #92
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing escape sequence character: "
MOV w0, #34
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
// Pushing character 10: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing escape sequence character: \
MOV w0, #92
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing escape sequence character: "
MOV w0, #34
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 72
MOV w0, #72
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing escape sequence character: \
MOV w0, #92
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing escape sequence character: "
MOV w0, #34
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 58
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
// Loading variable 'resultadoIgualdad5'
// Calculating offset for variable 'resultadoIgualdad5'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoIgualdad5'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: \"Hola\" == \"Mundo\":
STR x10, [SP, #-8]!
// Pushing escape sequence character: \
MOV w0, #92
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing escape sequence character: "
MOV w0, #34
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 72
MOV w0, #72
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing escape sequence character: \
MOV w0, #92
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing escape sequence character: "
MOV w0, #34
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
// Pushing character 10: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing escape sequence character: \
MOV w0, #92
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing escape sequence character: "
MOV w0, #34
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 77
MOV w0, #77
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing escape sequence character: \
MOV w0, #92
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing escape sequence character: "
MOV w0, #34
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 58
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
// Loading variable 'resultadoIgualdad6'
// Calculating offset for variable 'resultadoIgualdad6'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoIgualdad6'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// If statement
// Evaluating condition
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoIgualdad1'
// Calculating offset for variable 'resultadoIgualdad1'
MOV x0, #40
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoIgualdad1'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: true
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_234ac04d
MOV x0, #0
B eq_end_79289ca0
eq_true_234ac04d:
MOV x0, #1
eq_end_79289ca0:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_e2df0980
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoIgualdad2'
// Calculating offset for variable 'resultadoIgualdad2'
MOV x0, #32
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoIgualdad2'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: false
MOV x0, #0
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_36db99a8
MOV x0, #0
B eq_end_5870eeb6
eq_true_36db99a8:
MOV x0, #1
eq_end_5870eeb6:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_07753d6f
and_false_e2df0980:
MOV x0, #0
and_end_07753d6f:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_28df1042
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoIgualdad3'
// Calculating offset for variable 'resultadoIgualdad3'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoIgualdad3'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: true
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_67ffb56e
MOV x0, #0
B eq_end_5360b6a4
eq_true_67ffb56e:
MOV x0, #1
eq_end_5360b6a4:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_e007afa3
and_false_28df1042:
MOV x0, #0
and_end_e007afa3:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_a3acf196
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoIgualdad4'
// Calculating offset for variable 'resultadoIgualdad4'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoIgualdad4'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: false
MOV x0, #0
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_7cd01a74
MOV x0, #0
B eq_end_4e8add11
eq_true_7cd01a74:
MOV x0, #1
eq_end_4e8add11:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_9efe8b79
and_false_a3acf196:
MOV x0, #0
and_end_9efe8b79:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_03bed537
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoIgualdad5'
// Calculating offset for variable 'resultadoIgualdad5'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoIgualdad5'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: true
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_8bc4e3f0
MOV x0, #0
B eq_end_866ff5f2
eq_true_8bc4e3f0:
MOV x0, #1
eq_end_866ff5f2:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_e3045f2b
and_false_03bed537:
MOV x0, #0
and_end_e3045f2b:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_2ee7c4b1
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoIgualdad6'
// Calculating offset for variable 'resultadoIgualdad6'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoIgualdad6'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: false
MOV x0, #0
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_c11f8513
MOV x0, #0
B eq_end_345deca0
eq_true_c11f8513:
MOV x0, #1
eq_end_345deca0:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_fcc50852
and_false_2ee7c4b1:
MOV x0, #0
and_end_fcc50852:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Checking condition
CBZ x0, else_4c485d7a
// Then block
// Block statement
// Assignment statement
// Assignment to variable: puntosOperacionesRelacionales
// AddSub operation
// Visiting left operand
// Loading variable 'puntosOperacionesRelacionales'
// Calculating offset for variable 'puntosOperacionesRelacionales'
MOV x0, #48
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosOperacionesRelacionales'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'puntosOperacionesRelacionales' at offset 48
MOV x1, #48
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: OK Igualdad: correcto
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
// Pushing character 3: 73
MOV w0, #73
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 103
MOV w0, #103
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 100
MOV w0, #100
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
// Pushing character 11: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 111
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
B endif_7c59869a
else_4c485d7a:
// Else block
// Else branch with block
// Block statement
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: X Igualdad: incorrecto
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
// Pushing character 2: 73
MOV w0, #73
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 103
MOV w0, #103
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 108
MOV w0, #108
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
// Pushing character 9: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 111
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
endif_7c59869a:
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: Mayor/Menor
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
// Pushing character 2: 121
MOV w0, #121
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 47
MOV w0, #47
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 77
MOV w0, #77
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
// Pushing character 9: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 114
MOV w0, #114
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
// Implicit declaration: resultadoComp1
// Comparison operation
// Visiting left operand
// Constant 10
MOV x0, #10
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 5
MOV x0, #5
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Comparison with operator: >
CMP x0, x1
B.gt cmp_true_d8c1fa3d
MOV x0, #0
B cmp_end_8c00c92c
cmp_true_d8c1fa3d:
MOV x0, #1
cmp_end_8c00c92c:
STR x0, [SP, #-8]!
// Implicit declaration: resultadoComp2
// Comparison operation
// Visiting left operand
// Constant 10
MOV x0, #10
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 5
MOV x0, #5
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Comparison with operator: <
CMP x0, x1
B.lt cmp_true_21cec3b5
MOV x0, #0
B cmp_end_8b6b76e2
cmp_true_21cec3b5:
MOV x0, #1
cmp_end_8b6b76e2:
STR x0, [SP, #-8]!
// Implicit declaration: resultadoComp3
// Comparison operation
// Visiting left operand
// Float constant: 10.5
// Loading float value: 10.5 (hex: 0x4025000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4025, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Visiting right operand
// Float constant: 5.5
// Loading float value: 5.5 (hex: 0x4016000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4016, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Comparison with operator: >
CMP x0, x1
B.gt cmp_true_1746c7f1
MOV x0, #0
B cmp_end_a92fd2f1
cmp_true_1746c7f1:
MOV x0, #1
cmp_end_a92fd2f1:
STR x0, [SP, #-8]!
// Implicit declaration: resultadoComp4
// Comparison operation
// Visiting left operand
// Float constant: 10.5
// Loading float value: 10.5 (hex: 0x4025000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4025, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Visiting right operand
// Float constant: 5.5
// Loading float value: 5.5 (hex: 0x4016000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4016, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Comparison with operator: <
CMP x0, x1
B.lt cmp_true_39e2662a
MOV x0, #0
B cmp_end_a655167e
cmp_true_39e2662a:
MOV x0, #1
cmp_end_a655167e:
STR x0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: 10 > 5:
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
// Pushing character 3: 62
MOV w0, #62
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 58
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
// Loading variable 'resultadoComp1'
// Calculating offset for variable 'resultadoComp1'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoComp1'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: 10 < 5:
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
// Pushing character 3: 60
MOV w0, #60
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 58
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
// Loading variable 'resultadoComp2'
// Calculating offset for variable 'resultadoComp2'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoComp2'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: 10.5 > 5.5:
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
// Pushing character 3: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 62
MOV w0, #62
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 46
MOV w0, #46
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 58
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
// Loading variable 'resultadoComp3'
// Calculating offset for variable 'resultadoComp3'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoComp3'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: 10.5 < 5.5:
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
// Pushing character 3: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 60
MOV w0, #60
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 46
MOV w0, #46
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 58
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
// Loading variable 'resultadoComp4'
// Calculating offset for variable 'resultadoComp4'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoComp4'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// If statement
// Evaluating condition
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoComp1'
// Calculating offset for variable 'resultadoComp1'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoComp1'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: true
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_d984a17d
MOV x0, #0
B eq_end_e97d1328
eq_true_d984a17d:
MOV x0, #1
eq_end_e97d1328:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_31fc9155
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoComp2'
// Calculating offset for variable 'resultadoComp2'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoComp2'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: false
MOV x0, #0
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_dea1cebe
MOV x0, #0
B eq_end_25c7441f
eq_true_dea1cebe:
MOV x0, #1
eq_end_25c7441f:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_4cfee31b
and_false_31fc9155:
MOV x0, #0
and_end_4cfee31b:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_4ad2e789
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoComp3'
// Calculating offset for variable 'resultadoComp3'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoComp3'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: true
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_71b8d573
MOV x0, #0
B eq_end_6d853105
eq_true_71b8d573:
MOV x0, #1
eq_end_6d853105:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_5b958022
and_false_4ad2e789:
MOV x0, #0
and_end_5b958022:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_91d2a812
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoComp4'
// Calculating offset for variable 'resultadoComp4'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoComp4'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: false
MOV x0, #0
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_ed283043
MOV x0, #0
B eq_end_f18168e6
eq_true_ed283043:
MOV x0, #1
eq_end_f18168e6:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_61458d22
and_false_91d2a812:
MOV x0, #0
and_end_61458d22:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Checking condition
CBZ x0, else_4fa9f55b
// Then block
// Block statement
// Assignment statement
// Assignment to variable: puntosOperacionesRelacionales
// AddSub operation
// Visiting left operand
// Loading variable 'puntosOperacionesRelacionales'
// Calculating offset for variable 'puntosOperacionesRelacionales'
MOV x0, #80
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosOperacionesRelacionales'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'puntosOperacionesRelacionales' at offset 80
MOV x1, #80
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: OK Mayor/Menor: correcto
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
// Pushing character 4: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 121
MOV w0, #121
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 47
MOV w0, #47
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 77
MOV w0, #77
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 111
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
B endif_a2bcf03d
else_4fa9f55b:
// Else block
// Else branch with block
// Block statement
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: X Mayor/Menor: incorrecto
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
// Pushing character 3: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 121
MOV w0, #121
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 47
MOV w0, #47
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 77
MOV w0, #77
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 110
MOV w0, #110
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
// Pushing character 13: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 99
MOV w0, #99
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
endif_a2bcf03d:
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: Mayor o igual/Menor o igual
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
// Pushing character 2: 121
MOV w0, #121
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 103
MOV w0, #103
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 47
MOV w0, #47
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 77
MOV w0, #77
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 103
MOV w0, #103
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 108
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
// Implicit declaration: resultadoComp5
// Comparison operation
// Visiting left operand
// Constant 10
MOV x0, #10
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
B.ge cmp_true_b28400a1
MOV x0, #0
B cmp_end_b1e4a3e3
cmp_true_b28400a1:
MOV x0, #1
cmp_end_b1e4a3e3:
STR x0, [SP, #-8]!
// Implicit declaration: resultadoComp6
// Comparison operation
// Visiting left operand
// Constant 10
MOV x0, #10
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
B.le cmp_true_0114419b
MOV x0, #0
B cmp_end_155ea9c7
cmp_true_0114419b:
MOV x0, #1
cmp_end_155ea9c7:
STR x0, [SP, #-8]!
// Implicit declaration: resultadoComp7
// Comparison operation
// Visiting left operand
// Float constant: 10.5
// Loading float value: 10.5 (hex: 0x4025000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4025, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Visiting right operand
// Float constant: 5.5
// Loading float value: 5.5 (hex: 0x4016000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4016, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Comparison with operator: >=
CMP x0, x1
B.ge cmp_true_014378ca
MOV x0, #0
B cmp_end_6ce90c57
cmp_true_014378ca:
MOV x0, #1
cmp_end_6ce90c57:
STR x0, [SP, #-8]!
// Implicit declaration: resultadoComp8
// Comparison operation
// Visiting left operand
// Float constant: 10.5
// Loading float value: 10.5 (hex: 0x4025000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4025, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Visiting right operand
// Float constant: 10.5
// Loading float value: 10.5 (hex: 0x4025000000000000)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x4025, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Comparison with operator: <=
CMP x0, x1
B.le cmp_true_b5bfed36
MOV x0, #0
B cmp_end_2cffc977
cmp_true_b5bfed36:
MOV x0, #1
cmp_end_2cffc977:
STR x0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: 10 >= 10:
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
// Pushing character 3: 62
MOV w0, #62
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 49
MOV w0, #49
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 48
MOV w0, #48
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 58
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
// Loading variable 'resultadoComp5'
// Calculating offset for variable 'resultadoComp5'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoComp5'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: 10 <= 5:
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
// Pushing character 3: 60
MOV w0, #60
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 53
MOV w0, #53
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
// Loading variable 'resultadoComp6'
// Calculating offset for variable 'resultadoComp6'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoComp6'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: 10.5 >= 5.5:
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
// Pushing character 3: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 62
MOV w0, #62
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 46
MOV w0, #46
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 58
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
// Loading variable 'resultadoComp7'
// Calculating offset for variable 'resultadoComp7'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoComp7'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: 10.5 <= 10.5:
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
// Pushing character 3: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 60
MOV w0, #60
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 49
MOV w0, #49
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 48
MOV w0, #48
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 46
MOV w0, #46
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 53
MOV w0, #53
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
// Loading variable 'resultadoComp8'
// Calculating offset for variable 'resultadoComp8'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoComp8'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// If statement
// Evaluating condition
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoComp5'
// Calculating offset for variable 'resultadoComp5'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoComp5'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: true
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_99e65c7b
MOV x0, #0
B eq_end_10c23e71
eq_true_99e65c7b:
MOV x0, #1
eq_end_10c23e71:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_bd640918
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoComp6'
// Calculating offset for variable 'resultadoComp6'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoComp6'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: false
MOV x0, #0
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_77005624
MOV x0, #0
B eq_end_6412b7eb
eq_true_77005624:
MOV x0, #1
eq_end_6412b7eb:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_0319028e
and_false_bd640918:
MOV x0, #0
and_end_0319028e:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_90ffb72d
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoComp7'
// Calculating offset for variable 'resultadoComp7'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoComp7'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: true
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_2fa4f706
MOV x0, #0
B eq_end_3892978f
eq_true_2fa4f706:
MOV x0, #1
eq_end_3892978f:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_37b62378
and_false_90ffb72d:
MOV x0, #0
and_end_37b62378:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_26d95c00
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoComp8'
// Calculating offset for variable 'resultadoComp8'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoComp8'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: true
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_72c9c4a2
MOV x0, #0
B eq_end_244418d8
eq_true_72c9c4a2:
MOV x0, #1
eq_end_244418d8:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_da8e7386
and_false_26d95c00:
MOV x0, #0
and_end_da8e7386:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Checking condition
CBZ x0, else_21293fd9
// Then block
// Block statement
// Assignment statement
// Assignment to variable: puntosOperacionesRelacionales
// AddSub operation
// Visiting left operand
// Loading variable 'puntosOperacionesRelacionales'
// Calculating offset for variable 'puntosOperacionesRelacionales'
MOV x0, #112
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosOperacionesRelacionales'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'puntosOperacionesRelacionales' at offset 112
MOV x1, #112
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: OK Mayor o igual/Menor o igual: correcto
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
// Pushing character 4: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 121
MOV w0, #121
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 103
MOV w0, #103
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 47
MOV w0, #47
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 77
MOV w0, #77
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 103
MOV w0, #103
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 31: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 32: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 33: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 34: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 35: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 36: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 37: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 38: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 39: 111
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
B endif_b99063eb
else_21293fd9:
// Else block
// Else branch with block
// Block statement
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: X Mayor o igual/Menor o igual: incorrecto
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
// Pushing character 3: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 121
MOV w0, #121
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 32
MOV w0, #32
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
// Pushing character 10: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 103
MOV w0, #103
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 47
MOV w0, #47
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 77
MOV w0, #77
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 103
MOV w0, #103
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 31: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 32: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 33: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 34: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 35: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 36: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 37: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 38: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 39: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 40: 111
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
endif_b99063eb:
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: \n==== Operaciones Lógicas ====
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
// Pushing character 7: 79
MOV w0, #79
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 76
MOV w0, #76
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 243
MOV w0, #243
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 103
MOV w0, #103
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 97
MOV w0, #97
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
// Implicit declaration: puntosOperacionesLogicas
// Constant 0
MOV x0, #0
STR x0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: AND
STR x10, [SP, #-8]!
// Pushing character 0: 65
MOV w0, #65
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 78
MOV w0, #78
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 68
MOV w0, #68
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
// Implicit declaration: resultadoAnd1
// Logical AND operation
// Evaluating first operand
// Boolean constant: true
MOV x0, #1
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_97ddf41a
// First operand is true, evaluating second operand
// Boolean constant: true
MOV x0, #1
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_fd30b015
and_false_97ddf41a:
MOV x0, #0
and_end_fd30b015:
STR x0, [SP, #-8]!
// Implicit declaration: resultadoAnd2
// Logical AND operation
// Evaluating first operand
// Boolean constant: true
MOV x0, #1
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_5551e469
// First operand is true, evaluating second operand
// Boolean constant: false
MOV x0, #0
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_5a88d236
and_false_5551e469:
MOV x0, #0
and_end_5a88d236:
STR x0, [SP, #-8]!
// Implicit declaration: resultadoAnd3
// Logical AND operation
// Evaluating first operand
// Equality operation
// Visiting left operand
// Constant 10
MOV x0, #10
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
B.eq eq_true_b3a26c17
MOV x0, #0
B eq_end_5d711ffa
eq_true_b3a26c17:
MOV x0, #1
eq_end_5d711ffa:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_f6532c3a
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Constant 5
MOV x0, #5
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 5
MOV x0, #5
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_bfd5bdb7
MOV x0, #0
B eq_end_f312627e
eq_true_bfd5bdb7:
MOV x0, #1
eq_end_f312627e:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_73d4c6fe
and_false_f6532c3a:
MOV x0, #0
and_end_73d4c6fe:
STR x0, [SP, #-8]!
// Implicit declaration: resultadoAnd4
// Logical AND operation
// Evaluating first operand
// Equality operation
// Visiting left operand
// Constant 10
MOV x0, #10
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
B.eq eq_true_9aaffcea
MOV x0, #0
B eq_end_7c007306
eq_true_9aaffcea:
MOV x0, #1
eq_end_7c007306:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_6cb55776
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Constant 5
MOV x0, #5
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 6
MOV x0, #6
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_de44a15c
MOV x0, #0
B eq_end_e5a6ffb8
eq_true_de44a15c:
MOV x0, #1
eq_end_e5a6ffb8:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_beead161
and_false_6cb55776:
MOV x0, #0
and_end_beead161:
STR x0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: true && true:
STR x10, [SP, #-8]!
// Pushing character 0: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 38
MOV w0, #38
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 38
MOV w0, #38
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 101
MOV w0, #101
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
// Loading variable 'resultadoAnd1'
// Calculating offset for variable 'resultadoAnd1'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoAnd1'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: true && false:
STR x10, [SP, #-8]!
// Pushing character 0: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 38
MOV w0, #38
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 38
MOV w0, #38
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 102
MOV w0, #102
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 58
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
// Loading variable 'resultadoAnd2'
// Calculating offset for variable 'resultadoAnd2'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoAnd2'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: (10 == 10) && (5 == 5):
STR x10, [SP, #-8]!
// Pushing character 0: 40
MOV w0, #40
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 49
MOV w0, #49
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 48
MOV w0, #48
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 32
MOV w0, #32
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
// Pushing character 7: 49
MOV w0, #49
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 48
MOV w0, #48
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 41
MOV w0, #41
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 38
MOV w0, #38
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 38
MOV w0, #38
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 40
MOV w0, #40
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 41
MOV w0, #41
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
// Loading variable 'resultadoAnd3'
// Calculating offset for variable 'resultadoAnd3'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoAnd3'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: (10 == 10) && (5 == 6):
STR x10, [SP, #-8]!
// Pushing character 0: 40
MOV w0, #40
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 49
MOV w0, #49
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 48
MOV w0, #48
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 32
MOV w0, #32
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
// Pushing character 7: 49
MOV w0, #49
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 48
MOV w0, #48
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 41
MOV w0, #41
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 38
MOV w0, #38
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 38
MOV w0, #38
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 40
MOV w0, #40
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 54
MOV w0, #54
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 41
MOV w0, #41
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
// Loading variable 'resultadoAnd4'
// Calculating offset for variable 'resultadoAnd4'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoAnd4'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// If statement
// Evaluating condition
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoAnd1'
// Calculating offset for variable 'resultadoAnd1'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoAnd1'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: true
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_67ad930c
MOV x0, #0
B eq_end_1671f116
eq_true_67ad930c:
MOV x0, #1
eq_end_1671f116:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_04d7843b
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoAnd2'
// Calculating offset for variable 'resultadoAnd2'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoAnd2'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: false
MOV x0, #0
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_44d2ac36
MOV x0, #0
B eq_end_bfc346ee
eq_true_44d2ac36:
MOV x0, #1
eq_end_bfc346ee:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_177acc79
and_false_04d7843b:
MOV x0, #0
and_end_177acc79:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_6af7d713
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoAnd3'
// Calculating offset for variable 'resultadoAnd3'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoAnd3'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: true
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_74449fb4
MOV x0, #0
B eq_end_ad62c9f1
eq_true_74449fb4:
MOV x0, #1
eq_end_ad62c9f1:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_9ad7a65a
and_false_6af7d713:
MOV x0, #0
and_end_9ad7a65a:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_733a1639
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoAnd4'
// Calculating offset for variable 'resultadoAnd4'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoAnd4'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: false
MOV x0, #0
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_21ce7316
MOV x0, #0
B eq_end_872bc72c
eq_true_21ce7316:
MOV x0, #1
eq_end_872bc72c:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_eee97cde
and_false_733a1639:
MOV x0, #0
and_end_eee97cde:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Checking condition
CBZ x0, else_4042b390
// Then block
// Block statement
// Assignment statement
// Assignment to variable: puntosOperacionesLogicas
// AddSub operation
// Visiting left operand
// Loading variable 'puntosOperacionesLogicas'
// Calculating offset for variable 'puntosOperacionesLogicas'
MOV x0, #32
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosOperacionesLogicas'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'puntosOperacionesLogicas' at offset 32
MOV x1, #32
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: OK AND: correcto
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
// Pushing character 4: 78
MOV w0, #78
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 68
MOV w0, #68
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 111
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
B endif_830afef9
else_4042b390:
// Else block
// Else branch with block
// Block statement
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: X AND: incorrecto
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
// Pushing character 3: 78
MOV w0, #78
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 68
MOV w0, #68
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 110
MOV w0, #110
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
// Pushing character 11: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 111
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
endif_830afef9:
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: OR
STR x10, [SP, #-8]!
// Pushing character 0: 79
MOV w0, #79
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 82
MOV w0, #82
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
// Implicit declaration: resultadoOr1
// Logical OR operation
// Evaluating first operand
// Boolean constant: true
MOV x0, #1
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is true, result is true
CBNZ x0, or_true_44bc5827
// First operand is false, evaluating second operand
// Boolean constant: false
MOV x0, #0
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B or_end_c1ebf8c5
or_true_44bc5827:
MOV x0, #1
or_end_c1ebf8c5:
STR x0, [SP, #-8]!
// Implicit declaration: resultadoOr2
// Logical OR operation
// Evaluating first operand
// Boolean constant: false
MOV x0, #0
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is true, result is true
CBNZ x0, or_true_1c1ed937
// First operand is false, evaluating second operand
// Boolean constant: false
MOV x0, #0
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B or_end_90ce286b
or_true_1c1ed937:
MOV x0, #1
or_end_90ce286b:
STR x0, [SP, #-8]!
// Implicit declaration: resultadoOr3
// Logical OR operation
// Evaluating first operand
// Equality operation
// Visiting left operand
// Constant 10
MOV x0, #10
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
B.eq eq_true_0c595fcb
MOV x0, #0
B eq_end_cf7eae22
eq_true_0c595fcb:
MOV x0, #1
eq_end_cf7eae22:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is true, result is true
CBNZ x0, or_true_aa634b77
// First operand is false, evaluating second operand
// Equality operation
// Visiting left operand
// Constant 5
MOV x0, #5
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 6
MOV x0, #6
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_d5551f78
MOV x0, #0
B eq_end_e482cc18
eq_true_d5551f78:
MOV x0, #1
eq_end_e482cc18:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B or_end_ebf205b3
or_true_aa634b77:
MOV x0, #1
or_end_ebf205b3:
STR x0, [SP, #-8]!
// Implicit declaration: resultadoOr4
// Logical OR operation
// Evaluating first operand
// Equality operation
// Visiting left operand
// Constant 10
MOV x0, #10
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 11
MOV x0, #11
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_309db121
MOV x0, #0
B eq_end_d3ada998
eq_true_309db121:
MOV x0, #1
eq_end_d3ada998:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is true, result is true
CBNZ x0, or_true_4ac8aec4
// First operand is false, evaluating second operand
// Equality operation
// Visiting left operand
// Constant 5
MOV x0, #5
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 6
MOV x0, #6
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_455b42b8
MOV x0, #0
B eq_end_2f6f5429
eq_true_455b42b8:
MOV x0, #1
eq_end_2f6f5429:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B or_end_9e9f0001
or_true_4ac8aec4:
MOV x0, #1
or_end_9e9f0001:
STR x0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: true || false:
STR x10, [SP, #-8]!
// Pushing character 0: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 102
MOV w0, #102
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 58
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
// Loading variable 'resultadoOr1'
// Calculating offset for variable 'resultadoOr1'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoOr1'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: false || false:
STR x10, [SP, #-8]!
// Pushing character 0: 102
MOV w0, #102
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 102
MOV w0, #102
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 58
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
// Loading variable 'resultadoOr2'
// Calculating offset for variable 'resultadoOr2'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoOr2'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: (10 == 10) || (5 == 6):
STR x10, [SP, #-8]!
// Pushing character 0: 40
MOV w0, #40
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 49
MOV w0, #49
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 48
MOV w0, #48
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 32
MOV w0, #32
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
// Pushing character 7: 49
MOV w0, #49
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 48
MOV w0, #48
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 41
MOV w0, #41
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 40
MOV w0, #40
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 54
MOV w0, #54
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 41
MOV w0, #41
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
// Loading variable 'resultadoOr3'
// Calculating offset for variable 'resultadoOr3'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoOr3'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: (10 == 11) || (5 == 6):
STR x10, [SP, #-8]!
// Pushing character 0: 40
MOV w0, #40
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 49
MOV w0, #49
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 48
MOV w0, #48
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 32
MOV w0, #32
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
// Pushing character 7: 49
MOV w0, #49
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 49
MOV w0, #49
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 41
MOV w0, #41
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 40
MOV w0, #40
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 53
MOV w0, #53
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 54
MOV w0, #54
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 41
MOV w0, #41
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
// Loading variable 'resultadoOr4'
// Calculating offset for variable 'resultadoOr4'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoOr4'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// If statement
// Evaluating condition
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoOr1'
// Calculating offset for variable 'resultadoOr1'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoOr1'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: true
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_31182d1b
MOV x0, #0
B eq_end_78206f14
eq_true_31182d1b:
MOV x0, #1
eq_end_78206f14:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_664348c0
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoOr2'
// Calculating offset for variable 'resultadoOr2'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoOr2'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: false
MOV x0, #0
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_93c9f906
MOV x0, #0
B eq_end_f33d3bc5
eq_true_93c9f906:
MOV x0, #1
eq_end_f33d3bc5:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_090b839b
and_false_664348c0:
MOV x0, #0
and_end_090b839b:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_519f077d
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoOr3'
// Calculating offset for variable 'resultadoOr3'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoOr3'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: true
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_75cf878c
MOV x0, #0
B eq_end_fbe23379
eq_true_75cf878c:
MOV x0, #1
eq_end_fbe23379:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_c9bfc809
and_false_519f077d:
MOV x0, #0
and_end_c9bfc809:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_52fa513c
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoOr4'
// Calculating offset for variable 'resultadoOr4'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoOr4'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: false
MOV x0, #0
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_2f886787
MOV x0, #0
B eq_end_0e6b20c0
eq_true_2f886787:
MOV x0, #1
eq_end_0e6b20c0:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_067c8e2f
and_false_52fa513c:
MOV x0, #0
and_end_067c8e2f:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Checking condition
CBZ x0, else_56867dc4
// Then block
// Block statement
// Assignment statement
// Assignment to variable: puntosOperacionesLogicas
// AddSub operation
// Visiting left operand
// Loading variable 'puntosOperacionesLogicas'
// Calculating offset for variable 'puntosOperacionesLogicas'
MOV x0, #64
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosOperacionesLogicas'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'puntosOperacionesLogicas' at offset 64
MOV x1, #64
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: OK OR: correcto
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
// Pushing character 3: 79
MOV w0, #79
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 82
MOV w0, #82
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 99
MOV w0, #99
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
// Pushing character 10: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 99
MOV w0, #99
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
B endif_7beee262
else_56867dc4:
// Else block
// Else branch with block
// Block statement
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: X OR: incorrecto
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
// Pushing character 2: 79
MOV w0, #79
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 82
MOV w0, #82
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 111
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
endif_7beee262:
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: NOT
STR x10, [SP, #-8]!
// Pushing character 0: 78
MOV w0, #78
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 79
MOV w0, #79
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 84
MOV w0, #84
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
// Implicit declaration: resultadoNot1
// Logical NOT operation
// Evaluating expression
// Boolean constant: true
MOV x0, #1
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Inverting boolean value
EOR x0, x0, #1
STR x0, [SP, #-8]!
// Implicit declaration: resultadoNot2
// Logical NOT operation
// Evaluating expression
// Boolean constant: false
MOV x0, #0
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Inverting boolean value
EOR x0, x0, #1
STR x0, [SP, #-8]!
// Implicit declaration: resultadoNot3
// Logical NOT operation
// Evaluating expression
// Equality operation
// Visiting left operand
// Constant 10
MOV x0, #10
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
B.eq eq_true_803ac37a
MOV x0, #0
B eq_end_c1838cc1
eq_true_803ac37a:
MOV x0, #1
eq_end_c1838cc1:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Inverting boolean value
EOR x0, x0, #1
STR x0, [SP, #-8]!
// Implicit declaration: resultadoNot4
// Logical NOT operation
// Evaluating expression
// Equality operation
// Visiting left operand
// Constant 10
MOV x0, #10
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 11
MOV x0, #11
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_1aea20df
MOV x0, #0
B eq_end_77d4d37b
eq_true_1aea20df:
MOV x0, #1
eq_end_77d4d37b:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Inverting boolean value
EOR x0, x0, #1
STR x0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: !true:
STR x10, [SP, #-8]!
// Pushing character 0: 33
MOV w0, #33
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
// Pushing character 3: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 58
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
// Loading variable 'resultadoNot1'
// Calculating offset for variable 'resultadoNot1'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoNot1'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: !false:
STR x10, [SP, #-8]!
// Pushing character 0: 33
MOV w0, #33
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 102
MOV w0, #102
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 58
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
// Loading variable 'resultadoNot2'
// Calculating offset for variable 'resultadoNot2'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoNot2'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: !(10 == 10):
STR x10, [SP, #-8]!
// Pushing character 0: 33
MOV w0, #33
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 40
MOV w0, #40
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 49
MOV w0, #49
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
// Pushing character 5: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 49
MOV w0, #49
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 48
MOV w0, #48
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 41
MOV w0, #41
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 58
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
// Loading variable 'resultadoNot3'
// Calculating offset for variable 'resultadoNot3'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoNot3'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: !(10 == 11):
STR x10, [SP, #-8]!
// Pushing character 0: 33
MOV w0, #33
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 40
MOV w0, #40
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 49
MOV w0, #49
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
// Pushing character 5: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 49
MOV w0, #49
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 49
MOV w0, #49
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 41
MOV w0, #41
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 58
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
// Loading variable 'resultadoNot4'
// Calculating offset for variable 'resultadoNot4'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoNot4'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// If statement
// Evaluating condition
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoNot1'
// Calculating offset for variable 'resultadoNot1'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoNot1'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: false
MOV x0, #0
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_567e5751
MOV x0, #0
B eq_end_893ff740
eq_true_567e5751:
MOV x0, #1
eq_end_893ff740:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_de55a052
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoNot2'
// Calculating offset for variable 'resultadoNot2'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoNot2'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: true
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_92958586
MOV x0, #0
B eq_end_271e6fcc
eq_true_92958586:
MOV x0, #1
eq_end_271e6fcc:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_215524a5
and_false_de55a052:
MOV x0, #0
and_end_215524a5:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_8a45651f
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoNot3'
// Calculating offset for variable 'resultadoNot3'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoNot3'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: false
MOV x0, #0
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_20770c0e
MOV x0, #0
B eq_end_f3778257
eq_true_20770c0e:
MOV x0, #1
eq_end_f3778257:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_d11e1dcd
and_false_8a45651f:
MOV x0, #0
and_end_d11e1dcd:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_68ec4e50
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'resultadoNot4'
// Calculating offset for variable 'resultadoNot4'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoNot4'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: true
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_172789d8
MOV x0, #0
B eq_end_071ccaae
eq_true_172789d8:
MOV x0, #1
eq_end_071ccaae:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_da916a6f
and_false_68ec4e50:
MOV x0, #0
and_end_da916a6f:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Checking condition
CBZ x0, else_28f6364b
// Then block
// Block statement
// Assignment statement
// Assignment to variable: puntosOperacionesLogicas
// AddSub operation
// Visiting left operand
// Loading variable 'puntosOperacionesLogicas'
// Calculating offset for variable 'puntosOperacionesLogicas'
MOV x0, #96
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosOperacionesLogicas'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'puntosOperacionesLogicas' at offset 96
MOV x1, #96
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: OK NOT: correcto
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
// Pushing character 3: 78
MOV w0, #78
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 79
MOV w0, #79
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 84
MOV w0, #84
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 111
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
B endif_87e80660
else_28f6364b:
// Else block
// Else branch with block
// Block statement
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: X NOT: incorrecto
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
// Pushing character 2: 78
MOV w0, #78
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 79
MOV w0, #79
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 84
MOV w0, #84
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 110
MOV w0, #110
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
// Pushing character 11: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 111
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
endif_87e80660:
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: \n==== fmt.Println ====
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
// Pushing character 7: 102
MOV w0, #102
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 46
MOV w0, #46
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 80
MOV w0, #80
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 61
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
// Implicit declaration: puntosPrintln
// Constant 0
MOV x0, #0
STR x0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: \n\n###Validacion Manual
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
// Pushing character 4: 35
MOV w0, #35
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 35
MOV w0, #35
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 35
MOV w0, #35
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 86
MOV w0, #86
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 77
MOV w0, #77
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 108
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
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: Impresión de valores simples
STR x10, [SP, #-8]!
// Pushing character 0: 73
MOV w0, #73
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 114
MOV w0, #114
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
// Pushing character 6: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 243
MOV w0, #243
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 118
MOV w0, #118
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 115
MOV w0, #115
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
// Constant 42
MOV x0, #42
STR x0, [SP, #-8]!
// Popping value 1 for printing
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
// Processing 1 expressions to print
// Processing expression 1 of 1
// Float constant: 3.14
// Loading float value: 3.14 (hex: 0x40091EB851EB851F)
MOVZ x0, #0x851F, LSL #0
MOVK x0, #0x51EB, LSL #16
MOVK x0, #0x1EB8, LSL #32
MOVK x0, #0x4009, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Popping value 1 for printing
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
// String constant: Texto
STR x10, [SP, #-8]!
// Pushing character 0: 84
MOV w0, #84
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 120
MOV w0, #120
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 111
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// Boolean constant: true
MOV x0, #1
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// Rune constant: 'A' (Unicode: 65)
MOV x0, #65
STR x0, [SP, #-8]!
// Popping value 1 for printing
LDR x0, [SP], #8
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
BL print_rune
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
// String constant: 
STR x10, [SP, #-8]!
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
// Assignment to variable: puntosPrintln
// AddSub operation
// Visiting left operand
// Loading variable 'puntosPrintln'
// Calculating offset for variable 'puntosPrintln'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosPrintln'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'puntosPrintln' at offset 0
MOV x1, #0
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: OK Impresión de valores simples: correcto
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
// Pushing character 3: 73
MOV w0, #73
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 112
MOV w0, #112
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
// Pushing character 8: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 243
MOV w0, #243
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
// Pushing character 13: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 118
MOV w0, #118
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 114
MOV w0, #114
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
// Pushing character 24: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 108
MOV w0, #108
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
// Pushing character 31: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 32: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 33: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 34: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 35: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 36: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 37: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 38: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 39: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 40: 111
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: Impresión de múltiples valores
STR x10, [SP, #-8]!
// Pushing character 0: 73
MOV w0, #73
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 114
MOV w0, #114
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
// Pushing character 6: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 243
MOV w0, #243
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 250
MOV w0, #250
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 112
MOV w0, #112
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
// Pushing character 22: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 118
MOV w0, #118
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 115
MOV w0, #115
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
// Processing 3 expressions to print
// Processing expression 1 of 3
// String constant: Números:
STR x10, [SP, #-8]!
// Pushing character 0: 78
MOV w0, #78
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 250
MOV w0, #250
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
// Processing expression 2 of 3
// Constant 42
MOV x0, #42
STR x0, [SP, #-8]!
// Popping value 2 for printing
LDR x0, [SP], #8
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
BL print_integer_no_newline
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
// Processing expression 3 of 3
// Float constant: 3.14
// Loading float value: 3.14 (hex: 0x40091EB851EB851F)
MOVZ x0, #0x851F, LSL #0
MOVK x0, #0x51EB, LSL #16
MOVK x0, #0x1EB8, LSL #32
MOVK x0, #0x4009, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Popping value 3 for printing
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
// Processing 4 expressions to print
// Processing expression 1 of 4
// String constant: Booleano:
STR x10, [SP, #-8]!
// Pushing character 0: 66
MOV w0, #66
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 58
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
// Processing expression 2 of 4
// Boolean constant: true
MOV x0, #1
STR x0, [SP, #-8]!
// Popping value 2 for printing
LDR x0, [SP], #8
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
BL print_bool
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
// Processing expression 3 of 4
// String constant: Texto:
STR x10, [SP, #-8]!
// Pushing character 0: 84
MOV w0, #84
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 120
MOV w0, #120
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Popping value 3 for printing
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
// Processing expression 4 of 4
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
// Popping value 4 for printing
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
// Assignment to variable: puntosPrintln
// AddSub operation
// Visiting left operand
// Loading variable 'puntosPrintln'
// Calculating offset for variable 'puntosPrintln'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosPrintln'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'puntosPrintln' at offset 0
MOV x1, #0
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: OK Impresión de múltiples valores: correcto
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
// Pushing character 3: 73
MOV w0, #73
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 112
MOV w0, #112
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
// Pushing character 8: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 243
MOV w0, #243
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
// Pushing character 13: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 250
MOV w0, #250
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 112
MOV w0, #112
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
// Pushing character 25: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 118
MOV w0, #118
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 111
MOV w0, #111
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
// Pushing character 32: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 33: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 34: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 35: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 36: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 37: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 38: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 39: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 40: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 41: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 42: 111
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: Impresión de expresiones
STR x10, [SP, #-8]!
// Pushing character 0: 73
MOV w0, #73
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 114
MOV w0, #114
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
// Pushing character 6: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 243
MOV w0, #243
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 120
MOV w0, #120
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
// Pushing character 17: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 115
MOV w0, #115
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
// String constant: Suma:
STR x10, [SP, #-8]!
// Pushing character 0: 83
MOV w0, #83
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
// Pushing character 3: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 58
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
// AddSub operation
// Visiting left operand
// Constant 10
MOV x0, #10
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 5
MOV x0, #5
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
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
// String constant: Comparación:
STR x10, [SP, #-8]!
// Pushing character 0: 67
MOV w0, #67
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
// Pushing character 3: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 114
MOV w0, #114
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
// Pushing character 11: 58
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
// Comparison operation
// Visiting left operand
// Constant 10
MOV x0, #10
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 5
MOV x0, #5
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Comparison with operator: >
CMP x0, x1
B.gt cmp_true_56a6a25c
MOV x0, #0
B cmp_end_0b6e8226
cmp_true_56a6a25c:
MOV x0, #1
cmp_end_0b6e8226:
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: Lógica:
STR x10, [SP, #-8]!
// Pushing character 0: 76
MOV w0, #76
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 243
MOV w0, #243
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 103
MOV w0, #103
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
// Pushing character 5: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 58
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
// Logical AND operation
// Evaluating first operand
// Boolean constant: true
MOV x0, #1
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_539ee34f
// First operand is true, evaluating second operand
// Boolean constant: false
MOV x0, #0
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_979c7e50
and_false_539ee34f:
MOV x0, #0
and_end_979c7e50:
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// Assignment statement
// Assignment to variable: puntosPrintln
// AddSub operation
// Visiting left operand
// Loading variable 'puntosPrintln'
// Calculating offset for variable 'puntosPrintln'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosPrintln'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'puntosPrintln' at offset 0
MOV x1, #0
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: OK Impresión de expresiones: correcto
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
// Pushing character 3: 73
MOV w0, #73
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 112
MOV w0, #112
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
// Pushing character 8: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 243
MOV w0, #243
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
// Pushing character 13: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 120
MOV w0, #120
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 114
MOV w0, #114
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
// Pushing character 22: 105
MOV w0, #105
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
// Pushing character 25: 101
MOV w0, #101
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
// Pushing character 29: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 31: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 32: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 33: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 34: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 35: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 36: 111
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: \n==== Manejo de valor nulo ====
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
// Pushing character 7: 77
MOV w0, #77
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 106
MOV w0, #106
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
// Pushing character 17: 118
MOV w0, #118
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
// Pushing character 20: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 111
MOV w0, #111
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
// Implicit declaration: puntosValorNulo
// Constant 0
MOV x0, #0
STR x0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: Valores por defecto
STR x10, [SP, #-8]!
// Pushing character 0: 86
MOV w0, #86
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 111
MOV w0, #111
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
// Pushing character 8: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 114
MOV w0, #114
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
// Pushing character 14: 102
MOV w0, #102
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 111
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
// Variable declaration: enteroNulo
// Using default value for type: int
MOV x0, #0
STR x0, [SP, #-8]!
// Variable declaration: decimalNulo
// Using default value for type: float64
MOV x0, #0
STR x0, [SP, #-8]!
// Variable declaration: textoNulo
// Using default value for type: string
STR x10, [SP, #-8]!
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Variable declaration: booleanoNulo
// Using default value for type: bool
MOV x0, #0
STR x0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: \n\n###Validacion Manual
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
// Pushing character 4: 35
MOV w0, #35
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 35
MOV w0, #35
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 35
MOV w0, #35
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 86
MOV w0, #86
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 77
MOV w0, #77
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 108
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
// String constant: enteroNulo:
STR x10, [SP, #-8]!
// Pushing character 0: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 116
MOV w0, #116
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
// Pushing character 6: 78
MOV w0, #78
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 58
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
// Loading variable 'enteroNulo'
// Calculating offset for variable 'enteroNulo'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'enteroNulo'
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
// String constant: decimalNulo:
STR x10, [SP, #-8]!
// Pushing character 0: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 78
MOV w0, #78
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 58
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
// Loading variable 'decimalNulo'
// Calculating offset for variable 'decimalNulo'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'decimalNulo'
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
// String constant: textoNulo:
STR x10, [SP, #-8]!
// Pushing character 0: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 120
MOV w0, #120
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 78
MOV w0, #78
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 58
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
// Loading variable 'textoNulo'
// Calculating offset for variable 'textoNulo'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'textoNulo'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// String constant: booleanoNulo:
STR x10, [SP, #-8]!
// Pushing character 0: 98
MOV w0, #98
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 78
MOV w0, #78
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 111
MOV w0, #111
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
// Loading variable 'booleanoNulo'
// Calculating offset for variable 'booleanoNulo'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'booleanoNulo'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: 
STR x10, [SP, #-8]!
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
// If statement
// Evaluating condition
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Logical AND operation
// Evaluating first operand
// Equality operation
// Visiting left operand
// Loading variable 'enteroNulo'
// Calculating offset for variable 'enteroNulo'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'enteroNulo'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 0
MOV x0, #0
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_5396812c
MOV x0, #0
B eq_end_d04cb70b
eq_true_5396812c:
MOV x0, #1
eq_end_d04cb70b:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_ab5e4ab6
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'decimalNulo'
// Calculating offset for variable 'decimalNulo'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'decimalNulo'
STR x0, [SP, #-8]!
// Visiting right operand
// Float constant: 0.0
// Loading float value: 0 (hex: 0x0)
MOVZ x0, #0x0, LSL #0
MOVK x0, #0x0, LSL #16
MOVK x0, #0x0, LSL #32
MOVK x0, #0x0, LSL #48
FMOV d0, x0
STR d0, [SP, #-8]!
// Popping operands
LDR d1, [SP], #8
LDR x0, [SP], #8
// Float equality comparison
// Converting left operand from int to float
SCVTF d0, x0
// Comparing float values
FCMP d0, d1
B.eq eq_true_a9f8bc24
MOV x0, #0
B eq_end_2d97974e
eq_true_a9f8bc24:
MOV x0, #1
eq_end_2d97974e:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_df3ac13a
and_false_ab5e4ab6:
MOV x0, #0
and_end_df3ac13a:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_847a2e8f
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'textoNulo'
// Calculating offset for variable 'textoNulo'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'textoNulo'
STR x0, [SP, #-8]!
// Visiting right operand
// String constant: 
STR x10, [SP, #-8]!
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// String equality comparison
.balign 16     // Garantizar alineamiento a 16 bytes
// X0 contains first string address
// X1 contains second string address
BL string_equals
.balign 16     // Garantizar alineamiento después de llamada a función
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_83497567
and_false_847a2e8f:
MOV x0, #0
and_end_83497567:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_6d4df38c
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'booleanoNulo'
// Calculating offset for variable 'booleanoNulo'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'booleanoNulo'
STR x0, [SP, #-8]!
// Visiting right operand
// Boolean constant: false
MOV x0, #0
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_92c00932
MOV x0, #0
B eq_end_402d2893
eq_true_92c00932:
MOV x0, #1
eq_end_402d2893:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_52d7fd62
and_false_6d4df38c:
MOV x0, #0
and_end_52d7fd62:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Checking condition
CBZ x0, else_671e2a0b
// Then block
// Block statement
// Assignment statement
// Assignment to variable: puntosValorNulo
// AddSub operation
// Visiting left operand
// Loading variable 'puntosValorNulo'
// Calculating offset for variable 'puntosValorNulo'
MOV x0, #32
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosValorNulo'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'puntosValorNulo' at offset 32
MOV x1, #32
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: OK Valores por defecto: correcto
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
// Pushing character 6: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 114
MOV w0, #114
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
// Pushing character 17: 102
MOV w0, #102
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 31: 111
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
B endif_ca5c8f33
else_671e2a0b:
// Else block
// Else branch with block
// Block statement
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: X Valores por defecto: incorrecto
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
// Pushing character 2: 86
MOV w0, #86
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 111
MOV w0, #111
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
// Pushing character 8: 115
MOV w0, #115
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
// Pushing character 16: 102
MOV w0, #102
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 31: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 32: 111
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
endif_ca5c8f33:
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: Operaciones con nil
STR x10, [SP, #-8]!
// Pushing character 0: 79
MOV w0, #79
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 112
MOV w0, #112
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
// Pushing character 4: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 110
MOV w0, #110
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
// Pushing character 16: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 108
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
// Assignment statement
// Assignment to variable: puntosValorNulo
// AddSub operation
// Visiting left operand
// Loading variable 'puntosValorNulo'
// Calculating offset for variable 'puntosValorNulo'
MOV x0, #32
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosValorNulo'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'puntosValorNulo' at offset 32
MOV x1, #32
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: OK Operaciones con nil: correcto
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
// Pushing character 3: 79
MOV w0, #79
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 105
MOV w0, #105
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
// Pushing character 12: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 31: 111
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
// Assignment to variable: puntos
// AddSub operation
// Visiting left operand
// AddSub operation
// Visiting left operand
// AddSub operation
// Visiting left operand
// AddSub operation
// Visiting left operand
// AddSub operation
// Visiting left operand
// AddSub operation
// Visiting left operand
// Loading variable 'puntosDeclaracion'
// Calculating offset for variable 'puntosDeclaracion'
MOV x0, #488
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosDeclaracion'
STR x0, [SP, #-8]!
// Visiting right operand
// Loading variable 'puntosAsignacion'
// Calculating offset for variable 'puntosAsignacion'
MOV x0, #384
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosAsignacion'
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
// Visiting right operand
// Loading variable 'puntosOperacionesAritmeticas'
// Calculating offset for variable 'puntosOperacionesAritmeticas'
MOV x0, #376
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosOperacionesAritmeticas'
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
// Visiting right operand
// Loading variable 'puntosOperacionesRelacionales'
// Calculating offset for variable 'puntosOperacionesRelacionales'
MOV x0, #272
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosOperacionesRelacionales'
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
// Visiting right operand
// Loading variable 'puntosOperacionesLogicas'
// Calculating offset for variable 'puntosOperacionesLogicas'
MOV x0, #152
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosOperacionesLogicas'
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
// Visiting right operand
// Loading variable 'puntosPrintln'
// Calculating offset for variable 'puntosPrintln'
MOV x0, #48
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosPrintln'
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
// Visiting right operand
// Loading variable 'puntosValorNulo'
// Calculating offset for variable 'puntosValorNulo'
MOV x0, #40
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosValorNulo'
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'puntos' at offset 496
MOV x1, #496
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: \n=== Tabla de Resultados ===
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
// Pushing character 5: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 84
MOV w0, #84
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 98
MOV w0, #98
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 97
MOV w0, #97
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
// Pushing character 15: 82
MOV w0, #82
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 32
MOV w0, #32
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
// Pushing character 28: 61
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
// String constant: +--------------------------+--------+-------+
STR x10, [SP, #-8]!
// Pushing character 0: 43
MOV w0, #43
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 43
MOV w0, #43
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 31: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 32: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 33: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 34: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 35: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 36: 43
MOV w0, #43
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 37: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 38: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 39: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 40: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 41: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 42: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 43: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 44: 43
MOV w0, #43
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
// String constant: | Característica           | Puntos | Total |
STR x10, [SP, #-8]!
// Pushing character 0: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 67
MOV w0, #67
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 237
MOV w0, #237
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 80
MOV w0, #80
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 31: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 32: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 33: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 34: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 35: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 36: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 37: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 38: 84
MOV w0, #84
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 39: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 40: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 41: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 42: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 43: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 44: 124
MOV w0, #124
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
// String constant: +--------------------------+--------+-------+
STR x10, [SP, #-8]!
// Pushing character 0: 43
MOV w0, #43
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 43
MOV w0, #43
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 31: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 32: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 33: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 34: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 35: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 36: 43
MOV w0, #43
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 37: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 38: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 39: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 40: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 41: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 42: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 43: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 44: 43
MOV w0, #43
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
// Processing 3 expressions to print
// Processing expression 1 of 3
// String constant: | Declaración de variables | 
STR x10, [SP, #-8]!
// Pushing character 0: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 68
MOV w0, #68
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 114
MOV w0, #114
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
// Pushing character 17: 118
MOV w0, #118
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 98
MOV w0, #98
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 101
MOV w0, #101
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
// Pushing character 27: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 32
MOV w0, #32
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
// Processing expression 2 of 3
// Loading variable 'puntosDeclaracion'
// Calculating offset for variable 'puntosDeclaracion'
MOV x0, #488
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosDeclaracion'
STR x0, [SP, #-8]!
// Popping value 2 for printing
LDR x0, [SP], #8
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
BL print_integer_no_newline
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
// Processing expression 3 of 3
// String constant:     | 3     |
STR x10, [SP, #-8]!
// Pushing character 0: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 51
MOV w0, #51
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Popping value 3 for printing
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
// Processing 3 expressions to print
// Processing expression 1 of 3
// String constant: | Asignación de variables  | 
STR x10, [SP, #-8]!
// Pushing character 0: 124
MOV w0, #124
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
// Pushing character 3: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 103
MOV w0, #103
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 243
MOV w0, #243
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
// Pushing character 13: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 118
MOV w0, #118
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 98
MOV w0, #98
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
// Pushing character 25: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 32
MOV w0, #32
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
// Processing expression 2 of 3
// Loading variable 'puntosAsignacion'
// Calculating offset for variable 'puntosAsignacion'
MOV x0, #376
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosAsignacion'
STR x0, [SP, #-8]!
// Popping value 2 for printing
LDR x0, [SP], #8
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
BL print_integer_no_newline
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
// Processing expression 3 of 3
// String constant:     | 3     |
STR x10, [SP, #-8]!
// Pushing character 0: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 51
MOV w0, #51
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Popping value 3 for printing
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
// Processing 3 expressions to print
// Processing expression 1 of 3
// String constant: | Operaciones Aritméticas  | 
STR x10, [SP, #-8]!
// Pushing character 0: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 79
MOV w0, #79
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 112
MOV w0, #112
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
// Pushing character 9: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 65
MOV w0, #65
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 233
MOV w0, #233
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 32
MOV w0, #32
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
// Processing expression 2 of 3
// Loading variable 'puntosOperacionesAritmeticas'
// Calculating offset for variable 'puntosOperacionesAritmeticas'
MOV x0, #368
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosOperacionesAritmeticas'
STR x0, [SP, #-8]!
// Popping value 2 for printing
LDR x0, [SP], #8
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
BL print_integer_no_newline
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
// Processing expression 3 of 3
// String constant:     | 3     |
STR x10, [SP, #-8]!
// Pushing character 0: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 51
MOV w0, #51
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Popping value 3 for printing
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
// Processing 3 expressions to print
// Processing expression 1 of 3
// String constant: | Operaciones Relacionales | 
STR x10, [SP, #-8]!
// Pushing character 0: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 79
MOV w0, #79
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 112
MOV w0, #112
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
// Pushing character 9: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 82
MOV w0, #82
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 101
MOV w0, #101
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
// Pushing character 27: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 32
MOV w0, #32
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
// Processing expression 2 of 3
// Loading variable 'puntosOperacionesRelacionales'
// Calculating offset for variable 'puntosOperacionesRelacionales'
MOV x0, #264
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosOperacionesRelacionales'
STR x0, [SP, #-8]!
// Popping value 2 for printing
LDR x0, [SP], #8
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
BL print_integer_no_newline
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
// Processing expression 3 of 3
// String constant:     | 3     |
STR x10, [SP, #-8]!
// Pushing character 0: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 51
MOV w0, #51
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Popping value 3 for printing
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
// Processing 3 expressions to print
// Processing expression 1 of 3
// String constant: | Operaciones Lógicas      | 
STR x10, [SP, #-8]!
// Pushing character 0: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 79
MOV w0, #79
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 112
MOV w0, #112
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
// Pushing character 9: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 76
MOV w0, #76
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 243
MOV w0, #243
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 103
MOV w0, #103
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
// Pushing character 19: 97
MOV w0, #97
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
// Pushing character 22: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 32
MOV w0, #32
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
// Processing expression 2 of 3
// Loading variable 'puntosOperacionesLogicas'
// Calculating offset for variable 'puntosOperacionesLogicas'
MOV x0, #144
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosOperacionesLogicas'
STR x0, [SP, #-8]!
// Popping value 2 for printing
LDR x0, [SP], #8
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
BL print_integer_no_newline
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
// Processing expression 3 of 3
// String constant:     | 3     |
STR x10, [SP, #-8]!
// Pushing character 0: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 51
MOV w0, #51
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Popping value 3 for printing
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
// Processing 3 expressions to print
// Processing expression 1 of 3
// String constant: | fmt.Println              | 
STR x10, [SP, #-8]!
// Pushing character 0: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 102
MOV w0, #102
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 46
MOV w0, #46
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 80
MOV w0, #80
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 108
MOV w0, #108
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
// Pushing character 14: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 32
MOV w0, #32
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
// Processing expression 2 of 3
// Loading variable 'puntosPrintln'
// Calculating offset for variable 'puntosPrintln'
MOV x0, #40
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosPrintln'
STR x0, [SP, #-8]!
// Popping value 2 for printing
LDR x0, [SP], #8
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
BL print_integer_no_newline
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
// Processing expression 3 of 3
// String constant:     | 3     |
STR x10, [SP, #-8]!
// Pushing character 0: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 51
MOV w0, #51
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Popping value 3 for printing
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
// Processing 3 expressions to print
// Processing expression 1 of 3
// String constant: | Manejo de valor nulo     | 
STR x10, [SP, #-8]!
// Pushing character 0: 124
MOV w0, #124
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
// Pushing character 3: 97
MOV w0, #97
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
// Pushing character 6: 106
MOV w0, #106
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
// Pushing character 12: 118
MOV w0, #118
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 32
MOV w0, #32
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
// Processing expression 2 of 3
// Loading variable 'puntosValorNulo'
// Calculating offset for variable 'puntosValorNulo'
MOV x0, #32
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosValorNulo'
STR x0, [SP, #-8]!
// Popping value 2 for printing
LDR x0, [SP], #8
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
BL print_integer_no_newline
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
// Processing expression 3 of 3
// String constant:     | 2     |
STR x10, [SP, #-8]!
// Pushing character 0: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 50
MOV w0, #50
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Popping value 3 for printing
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
// String constant: +--------------------------+--------+-------+
STR x10, [SP, #-8]!
// Pushing character 0: 43
MOV w0, #43
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 43
MOV w0, #43
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 31: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 32: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 33: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 34: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 35: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 36: 43
MOV w0, #43
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 37: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 38: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 39: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 40: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 41: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 42: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 43: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 44: 43
MOV w0, #43
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
// Processing 3 expressions to print
// Processing expression 1 of 3
// String constant: | TOTAL                    | 
STR x10, [SP, #-8]!
// Pushing character 0: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 84
MOV w0, #84
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 79
MOV w0, #79
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 84
MOV w0, #84
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 65
MOV w0, #65
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 76
MOV w0, #76
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 32
MOV w0, #32
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
// Processing expression 2 of 3
// Loading variable 'puntos'
// Calculating offset for variable 'puntos'
MOV x0, #496
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntos'
STR x0, [SP, #-8]!
// Popping value 2 for printing
LDR x0, [SP], #8
.balign 16     // Garantizar alineamiento a 16 bytes
MOV X0, x0
BL print_integer_no_newline
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
// Processing expression 3 of 3
// String constant:    | 20    |
STR x10, [SP, #-8]!
// Pushing character 0: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 124
MOV w0, #124
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
// Pushing character 6: 48
MOV w0, #48
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 124
MOV w0, #124
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Popping value 3 for printing
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
// String constant: +--------------------------+--------+-------+
STR x10, [SP, #-8]!
// Pushing character 0: 43
MOV w0, #43
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 9: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 10: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 43
MOV w0, #43
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 31: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 32: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 33: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 34: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 35: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 36: 43
MOV w0, #43
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 37: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 38: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 39: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 40: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 41: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 42: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 43: 45
MOV w0, #45
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 44: 43
MOV w0, #43
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


//--------------------------------------------------------------
// print_rune - Prints a rune (Unicode character) to stdout
//
// Input:
//   x0 - The rune value to print
//--------------------------------------------------------------
.balign 4       // Alinear a 4 bytes (una palabra)
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
    
.balign 4       // Alinear a 4 bytes (una palabra)
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
    
.balign 4       // Alinear a 4 bytes (una palabra)
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
    
.balign 4       // Alinear a 4 bytes (una palabra)
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
    
.balign 4       // Alinear a 4 bytes (una palabra)
print_rune_bytes:
    // Print the UTF-8 bytes
    mov x0, #1                 // fd = 1 (stdout)
    mov x1, x20                // Buffer address
    mov x2, x21                // Buffer length (number of bytes)
    mov w8, #64                // Syscall write
    svc #0
    
    // Eliminar la adición del newline
    // El salto de línea lo agregará VisitPrintStatement al final de toda la instrucción fmt.Println
    
    // Clean up and restore registers
    add sp, sp, #16            // Free buffer space
    ldp x21, x22, [sp], #16    // Restore callee-saved registers
    ldp x19, x20, [sp], #16    // Restore callee-saved registers
    ldp x29, x30, [sp], #16    // Restore frame pointer and link register
    ret                        // Return to caller

.balign 4       // Alinear a 4 bytes (una palabra)
rune_newline:
    .ascii "\n"              // Newline character


//--------------------------------------------------------------
// string_equals - Compares two strings for equality
//
// Input:
//   x0 - Address of the first string
//   x1 - Address of the second string
//
// Output:
//   x0 - 1 if strings are equal, 0 if not equal
//--------------------------------------------------------------
.balign 4       // Alinear a 4 bytes (una palabra)
string_equals:
    // Save registers
    stp x29, x30, [sp, #-16]!  // Save frame pointer and link register
    stp x19, x20, [sp, #-16]!  // Save callee-saved registers
    stp x21, x22, [sp, #-16]!  // Save more callee-saved registers
    
    // x19 will hold the first string address
    mov x19, x0
    // x20 will hold the second string address
    mov x20, x1
    
.balign 4       // Alinear a 4 bytes (una palabra)
compare_loop:
    // Load bytes from both strings
    ldrb w21, [x19], #1        // Load byte from first string and advance pointer
    ldrb w22, [x20], #1        // Load byte from second string and advance pointer
    
    // Check if bytes are different
    cmp w21, w22
    bne strings_not_equal
    
    // Check if we've reached the end of both strings
    cbz w21, strings_equal     // If current byte is zero and both are equal so far
    
    // Continue comparing
    b compare_loop
    
.balign 4       // Alinear a 4 bytes (una palabra)
strings_equal:
    // Strings are equal
    mov x0, #1                 // Return true (1)
    b string_equals_done
    
.balign 4       // Alinear a 4 bytes (una palabra)
strings_not_equal:
    // Strings are not equal
    mov x0, #0                 // Return false (0)
    
.balign 4       // Alinear a 4 bytes (una palabra)
string_equals_done:
    // Restore registers and return
    ldp x21, x22, [sp], #16    // Restore callee-saved registers
    ldp x19, x20, [sp], #16    // Restore callee-saved registers
    ldp x29, x30, [sp], #16    // Restore frame pointer and link register
    ret                        // Return to caller



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
    b copy_second_loop          // Continue loop
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




