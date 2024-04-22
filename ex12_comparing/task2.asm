%include "rw32-2022-mingw.inc"

section .bss

section .data

section .text

; Write and call the dostrel function which calculates the range (d) defined by the equation:
;
; d = v^2 / 9.80665 * sin(2α)
;
; You do not need to check the validity of the input values.
; At the end, remove the values of all FPU registers except the output register ST0.
;
; V = 10.0, α = 0.2 => d = 3.970962
; V = 5.0, α = 0.8 => d = 2.548203

CMAIN:  
    call ReadFloat_Silent 
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

    fmul st0
    
    push __float32__(9.80665)
    fld dword [esp]
    add esp, 4

    fxch st1
    fdiv st1
    fstp st1
    
    fxch st1
    fadd st0, st0
    
    fsin
    
    fmul st1

    fstp st1

    pop ebp
    ret