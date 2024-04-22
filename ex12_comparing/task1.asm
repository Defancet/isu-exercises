%include "rw32-2022-mingw.inc"

section .bss

section .data
    pole dd 1.0, 4.0, 2.0, 5.0, 3.0
    ninf dd 0b11111111100000000000000000000000
    nan dd 0b01111111110000000000000000000001
    
section .text

; Create an initialized array of several 32b decimal numbers.
; Create two 32b variables with values minus infinity and Not-a-Number.
; Call the maximum function and print its result, returned in register ST0.
;
; float maximum(float* array, int delka)
;
; Use the value minus infinity as the initial value of maximum.
; If the length of the array is not positive, use Not-a-Number as the return value.

CMAIN:  
    call ReadFloat_Silent 
    push eax
    call ReadFloat_Silent
    push eax
    call dostrel
    add esp, 8
    call WriteDouble

    ret

dostrel:
    push ebp
    mov ebp,esp

    fld dword [ebp + 8]
    fld dword [ebp + 12]

    fmul st0 ; st0 = v^2
    
    push __float32__(9.80665)
    fld dword [esp]
    add esp, 4

    fxch st1
    fdiv st1
    fstp st1
    
    fxch st1
    fadd st0, st0

    pop ebp
    ret