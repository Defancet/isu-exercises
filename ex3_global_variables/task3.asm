%include "rw32-2022-mingw.inc"

section .bss
    arr resd 3
    r resd 1
    s resd 1

section .data

section .text
CMAIN:
	push ebp
	mov ebp,esp

    ; Create an uninitialized array of three 32b numbers (arr).
    ; Write a program that reads two 32b numbers (R and S) from the input, and writes the values R, S, and R-S into the field.
    ; Display the content of the field in the debugger.

    call ReadInt32
    mov [r], eax
    
    call ReadInt32
    mov [s], eax
    
    mov ebx, dword [r]
    mov [arr + 0], ebx
    
    mov ecx, dword [s]
    mov [arr + 4], ecx
    
    sub ebx, ecx
    mov [arr + 8], ebx

	pop ebp
	ret
