%include "rw32-2022-mingw.inc"

section .bss

section .data
    arr dd -1, -5, -2, -4, -3
    
section .text
CMAIN:
	push ebp
	mov ebp,esp

    ; Create an initialized array of five 32b digit numbers.
    ; Write a program that goes through all elements of an array and prints their maximum.
    ;
    ; 1, 5, 2, 4, 3 => 5
    ; -1, -5, -2, -4, -3 => -1

    mov ecx, 0
    mov ebx, [arr]

my_loop:
    cmp ecx, 5
    jge end

    mov eax, [arr + ecx * 4]
    cmp eax, ebx
    jl next

    mov ebx, eax
next:
    inc ecx
    jmp my_loop

end:
    mov eax, ebx
    call WriteInt32

 	pop ebp
	ret
