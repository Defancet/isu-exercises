%include "rw32-2022-mingw.inc"

section .bss

section .data
    arr dd 100, -200, 300, -400, 500
    
section .text
CMAIN:
	push ebp
	mov ebp,esp

    ; Create an initialized array of five 32b digit numbers.
    ; Write a program that converts all elements of an array to their absolute value.
    ; Display the resulting content of the field in the debugger.
    ;
    ; 100, -200, 300, -400, 500 => 100, 200, 300, 400, 500

    mov ecx, 0
    mov ebx, [arr]

loop:
    cmp ecx, 5
    jge end

    mov eax, [arr + ecx * 4]
    cmp eax, 0
    jge next

    neg eax
    mov [arr + ecx * 4], eax

next:
    add ebx, 4
    inc ecx
    jmp loop
    
end:
    pop ebp
	ret
