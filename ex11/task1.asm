%include "rw32-2022-mingw.inc"

section .bss

section .data

section .text

; Write a program that reads two numbers (X and Y) from the input and calculates the length of the hypotenuse of a right triangle defined by the equation.
; Clear the value of all FPU registers except ST0, and write out the result.
;
; c = sqrt(a2^2 + b^2)
;
; 1.0, 1.0 => 1.414
; 3.0, 4.0 => 5.000

CMAIN:  
    push ebp
    mov ebp,esp
                              ; st0   st1
    call ReadDouble_Silent    ;  A     ?  
    call ReadDouble_Silent    ;  B     A    
    
    fmul st0
    fxch st1
    fmul st0
    fadd st0, st1
    
    fsqrt
    
    fstp st1

    call WriteDouble
    
    pop ebp
    ret
