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
// Constant 1332
MOV x0, #1332
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
// Index access operation (slice[index])
// Visiting slice expression
// Loading variable 'numeros'
// Calculating offset for variable 'numeros'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'numeros'
STR x0, [SP, #-8]!
// Visiting index expression
// Constant 1
MOV x0, #1
STR x0, [SP, #-8]!
// Popping index value
LDR x1, [SP], #8
// Popping slice address
LDR x0, [SP], #8
// Checking index bounds
LDR x2, [x0, #0]
CMP x1, x2
B.lt index_ok_b8456840
index_error_a527f151:
// Index out of bounds error: Using default value 0
MOV x0, #0
B index_end_b1a5d962
index_ok_b8456840:
// Calculating element address: base + 8 + index*8
ADD x0, x0, 8
MOV x2, #8
MUL x1, x1, x2
ADD x0, x0, x1
LDR x0, [x0, #0]
index_end_b1a5d962:
// Pushing element value to stack
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
// Assignment statement
// Slice/array index assignment: expr[index] = value
// Evaluating slice/array expression
// Loading variable 'numeros'
// Calculating offset for variable 'numeros'
MOV x0, #0
ADD x0, sp, x0
LDR x0, [x0, #0]
// Pushing copy of variable value for 'numeros'
STR x0, [SP, #-8]!
// Evaluating index expression
// Constant 0
MOV x0, #0
STR x0, [SP, #-8]!
// Evaluating value expression
// Constant 31
MOV x0, #31
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
B.lt assign_index_ok_dd6df553
assign_index_error_e80b01bb:
// Index out of bounds error in assignment
B assign_index_end_c48b21f2
assign_index_ok_dd6df553:
// Calculating element address: base + 8 + index*8
ADD x2, x2, 8
MOV x3, #8
MUL x1, x1, x3
ADD x2, x2, x1
// Storing value at the calculated address
STR x0, [x2, #0]
assign_index_end_c48b21f2:
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




