%include "rw32-2022-mingw.inc"

section .bss
    arr resb 5

section .data

section .text
CMAIN:
	push ebp
	mov ebp,esp

    ; Create an array long enough and load a string of four characters into it.
	; Replace the first and last characters in the string, and print the modified string.
	; ABCD => DBCA

    mov edi, dst
    mov ebx, 4
    call ReadString
    
	mov al, [dst]
	mov bl, [dst+3]

	mov [dst+3], al
	mov [dst], bl

	mov esi, dst
    call WriteString

	pop ebp
	ret
