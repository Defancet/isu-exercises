%include "rw32-2022-mingw.inc"

section .bss
    dst resw 5

section .data
    src dw 10, 20, 30, 40

section .text
CMAIN:
	push ebp
	mov ebp,esp

	; Create an uninitialized array of four 16b numbers (dst).
	; Create an initialized array of four 16b numbers (src = {10, 20, 30, 40}).
	; Write a program that writes the partial sums of the src field into the items of the dst field.
	; Display the contents of both fields in the debugger.
	; src = {10, 20, 30, 40} => dst = {10, 30, 60, 100}

    mov ax, [src + 0]
    mov [dst + 0], ax

    add ax, [src + 2]
    mov [dst + 2], ax

    add ax, [src + 4]
    mov [dst + 4], ax

    add ax, [src + 6]
    mov [dst + 6], ax

	pop ebp
	ret
