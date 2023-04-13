%include "rw32-2022-mingw.inc"

section .bss

section .data
    pA dd 1, -5, -33, 44, 5, -6

section .text

CMAIN:  
    push ebp
    mov ebp,esp

    mov eax, pA
    mov ebx, -6
    mov ecx, 6

    call task21
    call WriteInt32

    pop ebp
    ret

task21:
    push ebp
    mov ebp,esp

    for:
        cmp ebx, [eax]
        je found
        add eax, 4
        loop for

    mov eax, 0
    jmp end

    found:
        mov eax, 1

    end:
        pop ebp
        ret
    