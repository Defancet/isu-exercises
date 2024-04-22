%include "rw32-2022-mingw.inc"

    extern _malloc
    extern _free

section .bss

section .data

section .text

CMAIN:  
	push ebp
	mov ebp,esp

    mov ecx, 10
    call task23
    
    mov esi, eax
    call WriteArrayInt16

    push esi
    call _free
    add esp, 4
    
	pop ebp
	ret

task23:
    push ebp
    mov ebp, esp

    push ecx
    push ebx
    push edx

    cmp ecx, 0
    jle error

    ; malloc(sizeof(int16_t) * (ecx))
    mov eax, ecx
    mov ebx, 2
    mul ebx
    push ecx
    push eax
    call _malloc
    cmp eax, 0
    jz error
    add esp, 4
    pop ecx

    mov [eax], word 1
    mov [eax + 2], word 1
    mov [eax + 4], word 1
    mov ebx, 3
	
    for:
        ; P(n-2) + P(n-3)
        mov edx, [eax + ebx * 2 - 4]
        add edx, [eax + ebx * 2 - 6]
        mov [eax + ebx * 2], edx
        inc ebx
    
    cmp ebx, ecx
    loop for

    jmp end

    error:
        mov eax, 0

    end:
        pop edx
        pop ebx
        pop ecx

        pop ebp
        ret
