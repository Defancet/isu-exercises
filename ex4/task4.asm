%include "rw32-2022-mingw.inc"

section .bss

section .data
	x db 100
	y db 200
	z dw 300

section .text
CMAIN:
	push ebp
	mov ebp,esp

    ; Create two 8B variables (x = 100, y = 200) and one 16b variable (Z = 300).
    ; Calculate the following equation and write its result: f = x ∗ y ∗ z

	mov al, [x]
	mul byte [y]

	call WriteInt16
	call WriteNewLine

	mul word [z]

	shl edx, 16
	mov dx, ax
	mov eax, edx

	call WriteInt32
	call WriteNewLine

	pop ebp
	ret
