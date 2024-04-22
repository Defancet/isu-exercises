%include "rw32-2022-mingw.inc"

section .bss

section .data


section .text
CMAIN:
	push ebp
	mov ebp,esp

    ; Write a program that reads three numbers (X, Y, Z) from the input, and then prints the values Y+Z, -X and X-Y-Z, each on its own line.

    call ReadInt32
    mov ebx, eax
    call ReadInt32
    mov ecx, eax
    call ReadInt32
    mov edx, eax

    mov eax, ecx
    add eax, edx
    call WriteInt32
    call WriteNewLine

    mov eax, ebx
    neg eax
    call WriteInt32
    call WriteNewLine

    mov eax, ebx
    sub eax, ecx
    sub eax, edx
    call WriteInt32
    call WriteNewLine

	pop ebp
	ret
