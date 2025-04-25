.data
heap: .space 4096
.text
.balign 16       // Alineamiento para sección de código
.global _start
_start:
    adr x10, heap
// Implicit declaration: i
// MulDiv operation
// Visiting left operand
// Constant 10
MOV x0, #10
STR x0, [SP, #-8]!
// Visiting right operand
// Constant 3
MOV x0, #3
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
LDR d0, [SP], #8
.balign 16     // Garantizar alineamiento a 16 bytes
BL print_double
.balign 16     // Garantizar alineamiento después de llamada a función
.balign 16       // Alineamiento para código de salida
// Program Exit
    MOV X0, #0
    MOV X8, #93
    SVC #0


// Standard Library Functions

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
    beq add_newline            // If fractional part is zero, skip to adding newline

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
    cbz x19, add_newline       // If zero, skip to adding newline

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
    b add_newline              // If we hit all zeros, skip to adding newline

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
add_newline:
    // Add newline at the end
    mov x0, #1                 // fd = 1 (stdout)
    adr x1, nl_char            // Address of newline character
    mov x2, #1                 // Length = 1
    mov w8, #64                // Syscall write
    svc #0                     // Print newline

.balign 4       // Alinear a 4 bytes (una palabra)
exit_function:
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
    adr x1, minus_sign         // Address of minus sign
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




