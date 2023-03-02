%include "rw32-2022-mingw.inc"

section .bss

section .data

section .text
CMAIN:
	push ebp
	mov ebp,esp

	; Write a program that reads two 32b numbers (X and Y) from input, and outputs the quotient Z, unsigned defined by the following equation.
    ; Z = (X * Y) / (X + Y)

    call ReadInt32
    mov ebx,eax
    call ReadInt32
    mov ecx,eax

    mov eax,ebx
    mul ecx ; eax = X * Y
    add ebx,ecx ; ebx = X + Y
    div ebx

    call WriteInt32

	pop ebp
	ret
