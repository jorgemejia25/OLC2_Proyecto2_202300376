.data
heap: .space 4096
.text
.balign 16       // Alineamiento para sección de código
.global _start
_start:
    adr x10, heap
// Implicit declaration: contador
// Constant 0
MOV x0, #0
STR x0, [SP, #-8]!
// Implicit declaration: impares
// Constant 0
MOV x0, #0
STR x0, [SP, #-8]!
// For statement
// For with condition (similar to while)
for_start_bf1a2b9f:
// Evaluating for condition
// Comparison operation
// Visiting left operand
// Loading variable 'contador'
// Calculating offset for variable 'contador'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'contador'
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
B.lt cmp_true_01d6dead
MOV x0, #0
B cmp_end_4f9c7162
cmp_true_01d6dead:
MOV x0, #1
cmp_end_4f9c7162:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Checking condition
CBZ x0, for_end_6e5bc558
// For body
// Block statement
// Assignment statement
// Assignment to variable: contador
// AddSub operation
// Visiting left operand
// Loading variable 'contador'
// Calculating offset for variable 'contador'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'contador'
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
// Storing value to variable 'contador' at offset 8
MOV x1, #8
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// If statement
// Evaluating condition
// Equality operation
// Visiting left operand
// MulDiv operation
// Visiting left operand
// Loading variable 'contador'
// Calculating offset for variable 'contador'
MOV x0, #8
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'contador'
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 2
MOV x0, #2
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
SDIV x14, x0, x1
MSUB x0, x14, x1, x0
// Pushing integer result
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 0
MOV x0, #0
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
// Equality check with operator: ==
CMP x0, x1
B.eq eq_true_95275ae9
MOV x0, #0
B eq_end_9539565d
eq_true_95275ae9:
MOV x0, #1
eq_end_9539565d:
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Checking condition
CBZ x0, else_709248fc
// Then block
// Block statement
// Continue statement
B for_post_5d3da401
B endif_225f74c0
else_709248fc:
endif_225f74c0:
// Assignment statement
// Assignment to variable: impares
// AddSub operation
// Visiting left operand
// Loading variable 'impares'
// Calculating offset for variable 'impares'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'impares'
STR x0, [SP, #-8]!
// Visiting right operand
// Loading variable 'contador'
// Calculating offset for variable 'contador'
MOV x0, #16
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'contador'
STR x0, [SP, #-8]!
// Popping operands
LDR x1, [SP], #8
LDR x0, [SP], #8
ADD x0, x0, x1
// Pushing integer result
STR x0, [SP, #-8]!
LDR x0, [SP], #8
// Storing value to variable 'impares' at offset 0
MOV x1, #0
ADD x1, sp, x1
STR x0, [x1, #0]
// Assignment complete
// Jump back to loop start
B for_start_bf1a2b9f
for_end_6e5bc558:
.balign 16       // Alineamiento para código de salida
// Program Exit
    MOV X0, #0
    MOV X8, #93
    SVC #0


// Standard Library Functions




