%include "rw32-2022-mingw.inc"

section .bss
	arr resb 4

section .data


section .text
CMAIN:
	push ebp
	mov ebp,esp

	; Create an array long enough and load a string of three characters into it.
	; Assume that the loaded characters will be lowercase or uppercase letters and adjust their binary values (see ASCII table) so that the first letter is lowercase, the second uppercase, and the third changes its size.
	; Write the edited string.
	; abc => aBC
	; ABC => aBc

	mov edi, arr
    mov ebx, 3
    call ReadString

	or byte [arr], 32
	xor byte [arr+1], 32
	xor byte [arr+2], 32

	mov esi, arr
    call WriteString

	pop ebp
	ret
