%include "rw32-2022-mingw.inc"

section .bss


section .data


section .text
CMAIN:
	push ebp
	mov ebp,esp

	; Read two unsigned 8b numbers (X and Y) from the input.
	; Write a program that prints the larger of the entered numbers.
	; We read and write unsigned numbers with the ReadUInt8 and WriteUInt8 functions.
	; 10, 20 => 20
	; 200, 100 => 200

    call ReadUInt8
    mov bl, al
    call ReadUInt8

    cmp bl, al
    jb .else
    mov al, bl
    jmp .end
.else:
    mov al, bl
.end:
    call WriteUInt8

	pop ebp
	ret
