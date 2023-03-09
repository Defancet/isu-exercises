%include "rw32-2022-mingw.inc"

section .bss


section .data


section .text
CMAIN:
	push ebp
	mov ebp,esp

	; Read two 8b numbers (X and Y) from the input and print their sum.
	; Modify the program so that the statement skips if the sum overflows.
	; 10, 20 => 30
	; 100, 50 => empty line
	; 10, -20 => 10

	call ReadInt8 ; X
	mov bl, al
	call ReadInt8  ; Y

	add al, bl ; X + Y
	jo .skip

	call WriteInt8
	call WriteNewLine

.skip:

	pop ebp
	ret
