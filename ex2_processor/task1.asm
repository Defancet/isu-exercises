%include "rw32-2022-mingw.inc"

section .bss

section .data


section .text
CMAIN:
	push ebp
	mov ebp,esp

    ; Write a program that reads two numbers (X and Y) from the input, and then prints the values X-Y, -X+Y and -X-Y, each on its own line.

	call ReadInt32
	mov ebx, eax
	call ReadInt32
	mov ecx, eax

	mov eax, ebx
	sub eax, ecx
	call WriteInt32
	call WriteNewLine

	mov eax, ebx
	neg eax
	add eax, ecx
	call WriteInt32
	call WriteNewLine

	mov eax, ebx
	neg eax
	sub eax, ecx
	call WriteInt32
	call WriteNewLine

	pop ebp
	ret
