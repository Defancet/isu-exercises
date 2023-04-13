%include "rw32-2022-mingw.inc"

section .bss

section .data
    pA dw -3, -3, -3, -4, 5

section .text

CMAIN:  
    push ebp
    mov ebp, esp
    
    push word -3
    push dword 5
    push pA

    call task22
    call WriteInt32

    pop ebp
    ret
    
task22:
    push ebp
    mov ebp, esp

    push ebx
    push ecx
    push edx

    mov eax, [ebp + 8] ;pA
    mov ecx, [ebp + 12] ;N
    mov bx, [ebp + 16] ;x

    cmp eax, 0
    je error

    cmp ecx, 0
    jle error

    xor edx, edx

    for:
        cmp bx, [eax]
        jne next
        add eax, 2
        inc edx

    next:
        loop for

    mov eax, edx
    jmp end

    error:
        mov eax, -1
    
    end:
        pop edx
        pop ecx
        pop ebx

        pop ebp
        ret 12
