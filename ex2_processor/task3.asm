%include "rw32-2022-mingw.inc"

section .bss

section .data
    x dd 0
    y dd 0
    z dd 0
    w dd 0

section .text
CMAIN:
	push ebp
	mov ebp,esp

	; Write a program that reads four numbers (X, Y, Z, W) from the input, and then prints the values X+W, X-Y and X-Y+Z-W, each on its own line.

    call ReadInt32
    mov [x] ,eax

    call ReadInt32
    mov [y], eax

    call ReadInt32
    mov [z], eax

    call ReadInt32
    mov [w], eax
    
        mov eax, [x]
    add eax, [w]
    call WriteInt32
    call WriteNewLine

    mov eax, [x]
    sub eax, [y]
    call WriteInt32
    call WriteNewLine

    mov eax, [x]
    sub eax, [y] 
    add eax, [z]
    sub eax, [w]
    call WriteInt32
    call WriteNewLine

	pop ebp
	ret
