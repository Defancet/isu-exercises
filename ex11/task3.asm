%include "rw32-2022-mingw.inc"

section .bss

section .data
    pole dt 1.0, 2.0, 3.0, 4.0, 5.0

section .text

; Create an initialized array of several 80b decimal numbers.
; Write a suma function, defined by the header, that computes the sum of the elements of the array.
;
; long double suma(long double* array , int delka );
;
; Call the sum function and print its result, returned in register ST0.

CMAIN:  
    push ebp
    mov ebp,esp

    push dword 5
    push pole
    call suma
    add esp, 8
    call WriteDouble
    
    pop ebp
    ret

suma:
    push ebp
    mov ebp,esp

    mov edx, [ebp + 8]
    mov ecx, [ebp + 12]

    fld tword [edx]

    mov eax, 10

    for:
        fld tword [edx + eax]
        fadd st0, st1
        fstp st1
        add eax, 10
        loop for

    pop ebp
    ret
    