.data
heap: .space 4096
.text
.balign 16       // Alineamiento para sección de código
.global _start
_start:
    adr x10, heap
// Program start - compiling statements
// Function declaration: saludar
B skip_saludar
func_saludar:
// Function prologue: saving frame pointer and return address
STR x29, [SP, #-8]!
STR x30, [SP, #-8]!
// FP = SP
MOV x29, sp
// Function body
// Block statement
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: ¡Hola, mundo!
STR x10, [SP, #-8]!
// Pushing character 0: 161
MOV w0, #161
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 72
MOV w0, #72
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
// Pushing character 4: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 44
MOV w0, #44
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 109
MOV w0, #109
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
// Pushing character 12: 33
MOV w0, #33
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
ret_saludar:
// Function epilogue
// SP = FP
MOV sp, x29
LDR x30, [SP], #8
LDR x29, [SP], #8
// Return to caller
RET
skip_saludar:
// Function declaration: obtenerNumero
B skip_obtenerNumero
func_obtenerNumero:
// Function prologue: saving frame pointer and return address
STR x29, [SP, #-8]!
STR x30, [SP, #-8]!
// FP = SP
MOV x29, sp
// Function body
// Block statement
// Return statement
// Evaluating return expression
// Constant 42
MOV x0, #42
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Return value in X0
// SP = FP
MOV sp, x29
LDR x30, [SP], #8
LDR x29, [SP], #8
// Return to caller
RET
ret_obtenerNumero:
// Function epilogue
// SP = FP
MOV sp, x29
LDR x30, [SP], #8
LDR x29, [SP], #8
// Return to caller
RET
skip_obtenerNumero:
// Function declaration: saludarPersona
B skip_saludarPersona
func_saludarPersona:
// Function prologue: saving frame pointer and return address
STR x29, [SP, #-8]!
STR x30, [SP, #-8]!
// FP = SP
MOV x29, sp
// Setting up 1 parameters
// Parameter 1: nombre (type: string)
STR x0, [SP, #-8]!
// Function body
// Block statement
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: ¡Hola,
STR x10, [SP, #-8]!
// Pushing character 0: 161
MOV w0, #161
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 72
MOV w0, #72
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
// Pushing character 4: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 44
MOV w0, #44
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
// Loading variable 'nombre'
// Calculating offset for variable 'nombre'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'nombre'
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
ret_saludarPersona:
// Function epilogue
// SP = FP
MOV sp, x29
LDR x30, [SP], #8
LDR x29, [SP], #8
// Return to caller
RET
skip_saludarPersona:
// Function declaration: sumar
B skip_sumar
func_sumar:
// Function prologue: saving frame pointer and return address
STR x29, [SP, #-8]!
STR x30, [SP, #-8]!
// FP = SP
MOV x29, sp
// Setting up 2 parameters
// Parameter 1: a (type: int)
STR x0, [SP, #-8]!
// Parameter 2: b (type: int)
STR x1, [SP, #-8]!
// Function body
// Block statement
// Return statement
// Evaluating return expression
// AddSub operation
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
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Return value in X0
// SP = FP
MOV sp, x29
LDR x30, [SP], #8
LDR x29, [SP], #8
// Return to caller
RET
ret_sumar:
// Function epilogue
// SP = FP
MOV sp, x29
LDR x30, [SP], #8
LDR x29, [SP], #8
// Return to caller
RET
skip_sumar:
// Function declaration: factorial
B skip_factorial
func_factorial:
// Function prologue: saving frame pointer and return address
STR x29, [SP, #-8]!
STR x30, [SP, #-8]!
// FP = SP
MOV x29, sp
// Setting up 1 parameters
// Parameter 1: n (type: int)
STR x0, [SP, #-8]!
// Function body
// Block statement
// If statement
// Evaluating condition
// Comparison operation
// Visiting left operand
// Loading variable 'n'
// Calculating offset for variable 'n'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'n'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Comparison with operator: <=
CMP x0, x1
B.le cmp_true_7a449e3b
MOV x0, #0
B cmp_end_d9d667d6
cmp_true_7a449e3b:
MOV x0, #1
cmp_end_d9d667d6:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Checking condition
CBZ x0, else_267fd748
// Then block
// Block statement
// Return statement
// Evaluating return expression
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Return value in X0
// SP = FP
MOV sp, x29
LDR x30, [SP], #8
LDR x29, [SP], #8
// Return to caller
RET
B endif_b4c8cc0f
else_267fd748:
endif_b4c8cc0f:
// Return statement
// Evaluating return expression
// MulDiv operation
// Visiting left operand
// Loading variable 'n'
// Calculating offset for variable 'n'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'n'
STR x0, [SP, #-8]!
// Visiting right operand
// Function call: factorial
// Processing 1 arguments
// Evaluating argument 1
// AddSub operation
// Visiting left operand
// Loading variable 'n'
// Calculating offset for variable 'n'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'n'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
SUB x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
// Loading argument 1 into x0
LDR x0, [SP], #8
// Calling function factorial
BL func_factorial
.balign 16     // Garantizar alineamiento después de llamada a función
// Pushing function return value
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
MUL x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Return value in X0
// SP = FP
MOV sp, x29
LDR x30, [SP], #8
LDR x29, [SP], #8
// Return to caller
RET
ret_factorial:
// Function epilogue
// SP = FP
MOV sp, x29
LDR x30, [SP], #8
LDR x29, [SP], #8
// Return to caller
RET
skip_factorial:
// Function declaration: ackermann
B skip_ackermann
func_ackermann:
// Function prologue: saving frame pointer and return address
STR x29, [SP, #-8]!
STR x30, [SP, #-8]!
// FP = SP
MOV x29, sp
// Setting up 2 parameters
// Parameter 1: m (type: int)
STR x0, [SP, #-8]!
// Parameter 2: n (type: int)
STR x1, [SP, #-8]!
// Function body
// Block statement
// If statement
// Evaluating condition
// Equality operation
// Visiting left operand
// Loading variable 'm'
// Calculating offset for variable 'm'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'm'
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
B.eq eq_true_9c533cb6
MOV x0, #0
B eq_end_8c229ec9
eq_true_9c533cb6:
MOV x0, #1
eq_end_8c229ec9:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Checking condition
CBZ x0, else_d599c608
// Then block
// Block statement
// Return statement
// Evaluating return expression
// AddSub operation
// Visiting left operand
// Loading variable 'n'
// Calculating offset for variable 'n'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'n'
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
// Return value in X0
// SP = FP
MOV sp, x29
LDR x30, [SP], #8
LDR x29, [SP], #8
// Return to caller
RET
B endif_29b4d357
else_d599c608:
// Else block
// Else-if branch
// If statement
// Evaluating condition
// Logical AND operation
// Evaluating first operand
// Comparison operation
// Visiting left operand
// Loading variable 'm'
// Calculating offset for variable 'm'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'm'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 0
MOV x0, #0
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Comparison with operator: >
CMP x0, x1
B.gt cmp_true_98a45a8b
MOV x0, #0
B cmp_end_65f9fea9
cmp_true_98a45a8b:
MOV x0, #1
cmp_end_65f9fea9:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Short-circuit evaluation: if first operand is false, result is false
CBZ x0, and_false_1cdf859f
// First operand is true, evaluating second operand
// Equality operation
// Visiting left operand
// Loading variable 'n'
// Calculating offset for variable 'n'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'n'
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
B.eq eq_true_8500a9b1
MOV x0, #0
B eq_end_30ec6e2e
eq_true_8500a9b1:
MOV x0, #1
eq_end_30ec6e2e:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
B and_end_d86c378f
and_false_1cdf859f:
MOV x0, #0
and_end_d86c378f:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Checking condition
CBZ x0, else_0397bc6a
// Then block
// Block statement
// Return statement
// Evaluating return expression
// Function call: ackermann
// Processing 2 arguments
// Evaluating argument 1
// AddSub operation
// Visiting left operand
// Loading variable 'm'
// Calculating offset for variable 'm'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'm'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
SUB x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
// Evaluating argument 2
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Loading argument 2 into x1
LDR x1, [SP], #8
// Loading argument 1 into x0
LDR x0, [SP], #8
// Calling function ackermann
BL func_ackermann
.balign 16     // Garantizar alineamiento después de llamada a función
// Pushing function return value
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Return value in X0
// SP = FP
MOV sp, x29
LDR x30, [SP], #8
LDR x29, [SP], #8
// Return to caller
RET
B endif_6bc4f084
else_0397bc6a:
// Else block
// Else branch with block
// Block statement
// Return statement
// Evaluating return expression
// Function call: ackermann
// Processing 2 arguments
// Evaluating argument 1
// AddSub operation
// Visiting left operand
// Loading variable 'm'
// Calculating offset for variable 'm'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'm'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
SUB x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
// Evaluating argument 2
// Function call: ackermann
// Processing 2 arguments
// Evaluating argument 1
// Loading variable 'm'
// Calculating offset for variable 'm'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'm'
STR x0, [SP, #-8]!
// Evaluating argument 2
// AddSub operation
// Visiting left operand
// Loading variable 'n'
// Calculating offset for variable 'n'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'n'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
SUB x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
// Loading argument 2 into x1
LDR x1, [SP], #8
// Loading argument 1 into x0
LDR x0, [SP], #8
// Calling function ackermann
BL func_ackermann
.balign 16     // Garantizar alineamiento después de llamada a función
// Pushing function return value
STR x0, [SP, #-8]!
// Loading argument 2 into x1
LDR x1, [SP], #8
// Loading argument 1 into x0
LDR x0, [SP], #8
// Calling function ackermann
BL func_ackermann
.balign 16     // Garantizar alineamiento después de llamada a función
// Pushing function return value
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Return value in X0
// SP = FP
MOV sp, x29
LDR x30, [SP], #8
LDR x29, [SP], #8
// Return to caller
RET
endif_6bc4f084:
endif_29b4d357:
ret_ackermann:
// Function epilogue
// SP = FP
MOV sp, x29
LDR x30, [SP], #8
LDR x29, [SP], #8
// Return to caller
RET
skip_ackermann:
// Function declaration: hanoi
B skip_hanoi
func_hanoi:
// Function prologue: saving frame pointer and return address
STR x29, [SP, #-8]!
STR x30, [SP, #-8]!
// FP = SP
MOV x29, sp
// Setting up 4 parameters
// Parameter 1: n (type: int)
STR x0, [SP, #-8]!
// Parameter 2: origen (type: string)
STR x1, [SP, #-8]!
// Parameter 3: auxiliar (type: string)
STR x2, [SP, #-8]!
// Parameter 4: destino (type: string)
STR x3, [SP, #-8]!
// Function body
// Block statement
// If statement
// Evaluating condition
// Equality operation
// Visiting left operand
// Loading variable 'n'
// Calculating offset for variable 'n'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'n'
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
B.eq eq_true_c18b8833
MOV x0, #0
B eq_end_b4670e7d
eq_true_c18b8833:
MOV x0, #1
eq_end_b4670e7d:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Checking condition
CBZ x0, else_6786ba36
// Then block
// Block statement
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 4 expressions to print
// Processing expression 1 of 4
// String constant: Mover disco 1 de
STR x10, [SP, #-8]!
// Pushing character 0: 77
MOV w0, #77
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 118
MOV w0, #118
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
// Pushing character 5: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 115
MOV w0, #115
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
// Pushing character 11: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 49
MOV w0, #49
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
// Loading variable 'origen'
// Calculating offset for variable 'origen'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'origen'
STR x0, [SP, #-8]!
// Popping value 2 for printing
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
// Processing expression 3 of 4
// String constant: a
STR x10, [SP, #-8]!
// Pushing character 0: 97
MOV w0, #97
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
// Loading variable 'destino'
// Calculating offset for variable 'destino'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'destino'
STR x0, [SP, #-8]!
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
// Return statement
// SP = FP
MOV sp, x29
LDR x30, [SP], #8
LDR x29, [SP], #8
// Return to caller
RET
B endif_773b423b
else_6786ba36:
endif_773b423b:
// Expression statement
// Function call: hanoi
// Processing 4 arguments
// Evaluating argument 1
// AddSub operation
// Visiting left operand
// Loading variable 'n'
// Calculating offset for variable 'n'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'n'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
SUB x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
// Evaluating argument 2
// Loading variable 'origen'
// Calculating offset for variable 'origen'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'origen'
STR x0, [SP, #-8]!
// Evaluating argument 3
// Loading variable 'destino'
// Calculating offset for variable 'destino'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'destino'
STR x0, [SP, #-8]!
// Evaluating argument 4
// Loading variable 'auxiliar'
// Calculating offset for variable 'auxiliar'
MOV x0, #32
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'auxiliar'
STR x0, [SP, #-8]!
// Loading argument 4 into x3
LDR x3, [SP], #8
// Loading argument 3 into x2
LDR x2, [SP], #8
// Loading argument 2 into x1
LDR x1, [SP], #8
// Loading argument 1 into x0
LDR x0, [SP], #8
// Calling function hanoi
BL func_hanoi
.balign 16     // Garantizar alineamiento después de llamada a función
// Pushing function return value
STR x0, [SP, #-8]!
// Popping expression result
LDR x0, [SP], #8
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 6 expressions to print
// Processing expression 1 of 6
// String constant: Mover disco
STR x10, [SP, #-8]!
// Pushing character 0: 77
MOV w0, #77
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 118
MOV w0, #118
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
// Pushing character 5: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 115
MOV w0, #115
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
// Processing expression 2 of 6
// Loading variable 'n'
// Calculating offset for variable 'n'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'n'
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
// Processing expression 3 of 6
// String constant: de
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
// Processing expression 4 of 6
// Loading variable 'origen'
// Calculating offset for variable 'origen'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'origen'
STR x0, [SP, #-8]!
// Popping value 4 for printing
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
// Processing expression 5 of 6
// String constant: a
STR x10, [SP, #-8]!
// Pushing character 0: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Popping value 5 for printing
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
// Processing expression 6 of 6
// Loading variable 'destino'
// Calculating offset for variable 'destino'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'destino'
STR x0, [SP, #-8]!
// Popping value 6 for printing
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
// Expression statement
// Function call: hanoi
// Processing 4 arguments
// Evaluating argument 1
// AddSub operation
// Visiting left operand
// Loading variable 'n'
// Calculating offset for variable 'n'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'n'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
SUB x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
// Evaluating argument 2
// Loading variable 'auxiliar'
// Calculating offset for variable 'auxiliar'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'auxiliar'
STR x0, [SP, #-8]!
// Evaluating argument 3
// Loading variable 'origen'
// Calculating offset for variable 'origen'
MOV x0, #32
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'origen'
STR x0, [SP, #-8]!
// Evaluating argument 4
// Loading variable 'destino'
// Calculating offset for variable 'destino'
MOV x0, #24
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'destino'
STR x0, [SP, #-8]!
// Loading argument 4 into x3
LDR x3, [SP], #8
// Loading argument 3 into x2
LDR x2, [SP], #8
// Loading argument 2 into x1
LDR x1, [SP], #8
// Loading argument 1 into x0
LDR x0, [SP], #8
// Calling function hanoi
BL func_hanoi
.balign 16     // Garantizar alineamiento después de llamada a función
// Pushing function return value
STR x0, [SP, #-8]!
// Popping expression result
LDR x0, [SP], #8
ret_hanoi:
// Function epilogue
// SP = FP
MOV sp, x29
LDR x30, [SP], #8
LDR x29, [SP], #8
// Return to caller
RET
skip_hanoi:
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
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: === Archivo de prueba de funciones ===
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
// Pushing character 25: 102
MOV w0, #102
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 31: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 32: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 33: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 34: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 35: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 36: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 37: 61
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
// String constant: ==== Funciones no recursivas sin parámetros ====
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
// Pushing character 5: 70
MOV w0, #70
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 117
MOV w0, #117
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
// Pushing character 15: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 32
MOV w0, #32
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
// Pushing character 20: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 114
MOV w0, #114
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
// Pushing character 25: 118
MOV w0, #118
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 115
MOV w0, #115
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
// Pushing character 32: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 33: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 34: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 35: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 36: 225
MOV w0, #225
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 37: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 38: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 39: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 40: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 41: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 42: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 43: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 44: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 45: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 46: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 47: 61
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
// Implicit declaration: puntosFuncionesSimples
// Constant 0
MOV x0, #0
STR x0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: Función sin retorno:
STR x10, [SP, #-8]!
// Pushing character 0: 70
MOV w0, #70
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
// Pushing character 3: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 243
MOV w0, #243
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 32
MOV w0, #32
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
// Pushing character 16: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 58
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
// Expression statement
// Function call: saludar
// Calling function saludar
BL func_saludar
.balign 16     // Garantizar alineamiento después de llamada a función
// Pushing function return value
STR x0, [SP, #-8]!
// Popping expression result
LDR x0, [SP], #8
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: \nFunción con retorno:
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
// Pushing character 2: 70
MOV w0, #70
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 110
MOV w0, #110
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
// Pushing character 14: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 101
MOV w0, #101
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
// Pushing character 18: 114
MOV w0, #114
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
// Implicit declaration: numero
// Function call: obtenerNumero
// Calling function obtenerNumero
BL func_obtenerNumero
.balign 16     // Garantizar alineamiento después de llamada a función
// Pushing function return value
STR x0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: El número obtenido es:
STR x10, [SP, #-8]!
// Pushing character 0: 69
MOV w0, #69
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 108
MOV w0, #108
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 250
MOV w0, #250
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 109
MOV w0, #109
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
// Pushing character 10: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 98
MOV w0, #98
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 100
MOV w0, #100
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 111
MOV w0, #111
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
// Pushing character 20: 115
MOV w0, #115
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
// Loading variable 'numero'
// Calculating offset for variable 'numero'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'numero'
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
// Loading variable 'numero'
// Calculating offset for variable 'numero'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'numero'
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
B.eq eq_true_06201c1a
MOV x0, #0
B eq_end_e0f15f40
eq_true_06201c1a:
MOV x0, #1
eq_end_e0f15f40:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Checking condition
CBZ x0, else_0cca5445
// Then block
// Block statement
// Assignment statement
// Assignment to variable: puntosFuncionesSimples
// AddSub operation
// Visiting left operand
// Loading variable 'puntosFuncionesSimples'
// Calculating offset for variable 'puntosFuncionesSimples'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosFuncionesSimples'
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
LDR x0, [SP], #8
// Storing value to variable 'puntosFuncionesSimples' at offset 8
MOV x1, #8
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: OK Funciones no recursivas sin parámetros: correcto
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
// Pushing character 3: 70
MOV w0, #70
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 110
MOV w0, #110
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
// Pushing character 13: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 32
MOV w0, #32
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
// Pushing character 19: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 114
MOV w0, #114
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
// Pushing character 27: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 31: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 32: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 33: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 34: 225
MOV w0, #225
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 35: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 36: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 37: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 38: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 39: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 40: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 41: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 42: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 43: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 44: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 45: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 46: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 47: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 48: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 49: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 50: 111
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
B endif_afea5e22
else_0cca5445:
// Else block
// Else branch with block
// Block statement
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: X Funciones no recursivas sin parámetros: incorrecto
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
// Pushing character 2: 70
MOV w0, #70
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 110
MOV w0, #110
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
// Pushing character 12: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 114
MOV w0, #114
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
// Pushing character 22: 118
MOV w0, #118
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
// Pushing character 26: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 28: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 29: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 30: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 31: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 32: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 33: 225
MOV w0, #225
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 34: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 35: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 36: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 37: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 38: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 39: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 40: 58
MOV w0, #58
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 41: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 42: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 43: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 44: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 45: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 46: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 47: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 48: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 49: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 50: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 51: 111
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
endif_afea5e22:
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: \n==== Funciones no recursivas con parámetros ====
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
// Pushing character 14: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 110
MOV w0, #110
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
// Pushing character 23: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 27: 118
MOV w0, #118
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
// Pushing character 33: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 34: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 35: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 36: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 37: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 38: 225
MOV w0, #225
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 39: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 40: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 41: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 42: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 43: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 44: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 45: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 46: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 47: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 48: 61
MOV w0, #61
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 49: 61
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
// Implicit declaration: puntosFuncionesParametros
// Constant 0
MOV x0, #0
STR x0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: Función con parámetros sin retorno:
STR x10, [SP, #-8]!
// Pushing character 0: 70
MOV w0, #70
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
// Pushing character 3: 99
MOV w0, #99
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 243
MOV w0, #243
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 110
MOV w0, #110
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
// Pushing character 12: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 225
MOV w0, #225
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 111
MOV w0, #111
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
// Pushing character 25: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 32
MOV w0, #32
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
// Pushing character 31: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 32: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 33: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 34: 58
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
// Expression statement
// Function call: saludarPersona
// Processing 1 arguments
// Evaluating argument 1
// String constant: Juan
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
// Pushing character 2: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Loading argument 1 into x0
LDR x0, [SP], #8
// Calling function saludarPersona
BL func_saludarPersona
.balign 16     // Garantizar alineamiento después de llamada a función
// Pushing function return value
STR x0, [SP, #-8]!
// Popping expression result
LDR x0, [SP], #8
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: \nFunción con parámetros y retorno:
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
// Pushing character 2: 70
MOV w0, #70
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 110
MOV w0, #110
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
// Pushing character 14: 112
MOV w0, #112
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 225
MOV w0, #225
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 20: 116
MOV w0, #116
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 22: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 23: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 24: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 121
MOV w0, #121
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 32
MOV w0, #32
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
// Pushing character 31: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 32: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 33: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 34: 58
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
// Implicit declaration: resultadoSuma
// Function call: sumar
// Processing 2 arguments
// Evaluating argument 1
// Constant 10
MOV x0, #10
STR x0, [SP, #-8]!
// Evaluating argument 2
// Constant 20
MOV x0, #20
STR x0, [SP, #-8]!
// Loading argument 2 into x1
LDR x1, [SP], #8
// Loading argument 1 into x0
LDR x0, [SP], #8
// Calling function sumar
BL func_sumar
.balign 16     // Garantizar alineamiento después de llamada a función
// Pushing function return value
STR x0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: La suma de 10 y 20 es:
STR x10, [SP, #-8]!
// Pushing character 0: 76
MOV w0, #76
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 115
MOV w0, #115
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
// Pushing character 10: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 11: 49
MOV w0, #49
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 12: 48
MOV w0, #48
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 121
MOV w0, #121
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 50
MOV w0, #50
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 48
MOV w0, #48
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
// Pushing character 20: 115
MOV w0, #115
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
// Loading variable 'resultadoSuma'
// Calculating offset for variable 'resultadoSuma'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoSuma'
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
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: \n==== Funciones recursivas ====
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
// Pushing character 14: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 115
MOV w0, #115
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 32
MOV w0, #32
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
// Pushing character 20: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 21: 114
MOV w0, #114
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
// Pushing character 24: 118
MOV w0, #118
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 25: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 26: 115
MOV w0, #115
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
// Implicit declaration: puntosFuncionesRecursivas
// Constant 0
MOV x0, #0
STR x0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: Factorial:
STR x10, [SP, #-8]!
// Pushing character 0: 70
MOV w0, #70
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 99
MOV w0, #99
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
// Pushing character 5: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 108
MOV w0, #108
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
// Implicit declaration: resultadoFactorial
// Function call: factorial
// Processing 1 arguments
// Evaluating argument 1
// Constant 5
MOV x0, #5
STR x0, [SP, #-8]!
// Loading argument 1 into x0
LDR x0, [SP], #8
// Calling function factorial
BL func_factorial
.balign 16     // Garantizar alineamiento después de llamada a función
// Pushing function return value
STR x0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: Factorial de 5:
STR x10, [SP, #-8]!
// Pushing character 0: 70
MOV w0, #70
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 1: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 2: 99
MOV w0, #99
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
// Pushing character 5: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 6: 105
MOV w0, #105
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 7: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 8: 108
MOV w0, #108
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
// Pushing character 13: 53
MOV w0, #53
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
// Loading variable 'resultadoFactorial'
// Calculating offset for variable 'resultadoFactorial'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoFactorial'
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
// Loading variable 'resultadoFactorial'
// Calculating offset for variable 'resultadoFactorial'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoFactorial'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 120
MOV x0, #120
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_02df3aad
MOV x0, #0
B eq_end_2e8f86b9
eq_true_02df3aad:
MOV x0, #1
eq_end_2e8f86b9:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Checking condition
CBZ x0, else_9c32c697
// Then block
// Block statement
// Assignment statement
// Assignment to variable: puntosFuncionesRecursivas
// AddSub operation
// Visiting left operand
// Loading variable 'puntosFuncionesRecursivas'
// Calculating offset for variable 'puntosFuncionesRecursivas'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosFuncionesRecursivas'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 3
MOV x0, #3
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'puntosFuncionesRecursivas' at offset 8
MOV x1, #8
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: OK Función factorial: correcto
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
// Pushing character 3: 70
MOV w0, #70
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 110
MOV w0, #110
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
// Pushing character 11: 102
MOV w0, #102
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
// Pushing character 16: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 105
MOV w0, #105
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
B endif_53ee3bae
else_9c32c697:
// Else block
// Else branch with block
// Block statement
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: X Función factorial: incorrecto
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
// Pushing character 2: 70
MOV w0, #70
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 110
MOV w0, #110
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
// Pushing character 10: 102
MOV w0, #102
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
endif_53ee3bae:
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: \nTorres de Hanoi:
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
// Pushing character 2: 84
MOV w0, #84
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
// Pushing character 5: 114
MOV w0, #114
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
// Pushing character 12: 72
MOV w0, #72
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 111
MOV w0, #111
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 105
MOV w0, #105
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
// Expression statement
// Function call: hanoi
// Processing 4 arguments
// Evaluating argument 1
// Constant 3
MOV x0, #3
STR x0, [SP, #-8]!
// Evaluating argument 2
// String constant: A
STR x10, [SP, #-8]!
// Pushing character 0: 65
MOV w0, #65
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Evaluating argument 3
// String constant: B
STR x10, [SP, #-8]!
// Pushing character 0: 66
MOV w0, #66
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Evaluating argument 4
// String constant: C
STR x10, [SP, #-8]!
// Pushing character 0: 67
MOV w0, #67
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing NULL terminator
MOV w0, #0
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Loading argument 4 into x3
LDR x3, [SP], #8
// Loading argument 3 into x2
LDR x2, [SP], #8
// Loading argument 2 into x1
LDR x1, [SP], #8
// Loading argument 1 into x0
LDR x0, [SP], #8
// Calling function hanoi
BL func_hanoi
.balign 16     // Garantizar alineamiento después de llamada a función
// Pushing function return value
STR x0, [SP, #-8]!
// Popping expression result
LDR x0, [SP], #8
// Assignment statement
// Assignment to variable: puntosFuncionesRecursivas
// AddSub operation
// Visiting left operand
// Loading variable 'puntosFuncionesRecursivas'
// Calculating offset for variable 'puntosFuncionesRecursivas'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosFuncionesRecursivas'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 3
MOV x0, #3
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'puntosFuncionesRecursivas' at offset 8
MOV x1, #8
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: \nAckermann:
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
// Pushing character 4: 107
MOV w0, #107
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
// Pushing character 7: 109
MOV w0, #109
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
// Implicit declaration: resultadoAckermann
// Function call: ackermann
// Processing 2 arguments
// Evaluating argument 1
// Constant 3
MOV x0, #3
STR x0, [SP, #-8]!
// Evaluating argument 2
// Constant 2
MOV x0, #2
STR x0, [SP, #-8]!
// Loading argument 2 into x1
LDR x1, [SP], #8
// Loading argument 1 into x0
LDR x0, [SP], #8
// Calling function ackermann
BL func_ackermann
.balign 16     // Garantizar alineamiento después de llamada a función
// Pushing function return value
STR x0, [SP, #-8]!
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 2 expressions to print
// Processing expression 1 of 2
// String constant: Ackermann de (3, 2):
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
// Pushing character 2: 107
MOV w0, #107
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
// Pushing character 7: 110
MOV w0, #110
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
// Pushing character 13: 40
MOV w0, #40
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 51
MOV w0, #51
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 44
MOV w0, #44
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 32
MOV w0, #32
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 50
MOV w0, #50
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 41
MOV w0, #41
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 58
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
// Loading variable 'resultadoAckermann'
// Calculating offset for variable 'resultadoAckermann'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoAckermann'
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
// Loading variable 'resultadoAckermann'
// Calculating offset for variable 'resultadoAckermann'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'resultadoAckermann'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 29
MOV x0, #29
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Integer equality check with operator: ==
CMP x0, x1
B.eq eq_true_89521095
MOV x0, #0
B eq_end_86f872af
eq_true_89521095:
MOV x0, #1
eq_end_86f872af:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Checking condition
CBZ x0, else_a59e0f4d
// Then block
// Block statement
// Assignment statement
// Assignment to variable: puntosFuncionesRecursivas
// AddSub operation
// Visiting left operand
// Loading variable 'puntosFuncionesRecursivas'
// Calculating offset for variable 'puntosFuncionesRecursivas'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'puntosFuncionesRecursivas'
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
// Storing value to variable 'puntosFuncionesRecursivas' at offset 16
MOV x1, #16
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: OK Función ackermann: correcto
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
// Pushing character 3: 70
MOV w0, #70
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 5: 110
MOV w0, #110
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
// Pushing character 13: 107
MOV w0, #107
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 19: 110
MOV w0, #110
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
B endif_a695b0a0
else_a59e0f4d:
// Else block
// Else branch with block
// Block statement
// Print statement
.balign 16     // Garantizar alineamiento a 16 bytes
// Processing 1 expressions to print
// Processing expression 1 of 1
// String constant: X Función ackermann: incorrecto
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
// Pushing character 2: 70
MOV w0, #70
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 3: 117
MOV w0, #117
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 4: 110
MOV w0, #110
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
// Pushing character 12: 107
MOV w0, #107
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 13: 101
MOV w0, #101
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 14: 114
MOV w0, #114
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 15: 109
MOV w0, #109
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 16: 97
MOV w0, #97
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 17: 110
MOV w0, #110
STRB w0, [x10]
MOV x0, #1
ADD x10, x10, x0
// Pushing character 18: 110
MOV w0, #110
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
endif_a695b0a0:
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




