%include "rw32-2022-mingw.inc"

section .bss
    res resd 1

section .data
    dva dd 2
    pet dd 5

section .text

; Create two initialized 32b integer variables two = 2 and five = 5, and one uninitialized 32b variable rust.
; Write a program that computes the golden section defined by Eq:
;
; rez = (1 + √5) / 2 = 1.618034...
;
; Store the result in the variable rez, and display its value in the debugger, and remove the values of all registers including ST0.
CMAIN:  
    push ebp
    mov ebp,esp
    
    fild dword [pet] 
    fsqrt
    fld1
    fadd st0, st1
    
    fstp st1
    
    fild dword [dva]
    fxch st1
    fdiv st0, st1
    
    fstp st1
    
    fst dword [res]
    
    pop ebp
    ret
