%include "rw32-2022-mingw.inc"

section .bss

section .data
    
section .text
CMAIN:
	push ebp
	mov ebp,esp

	; Read two 16b digit numbers (X and Y) from the input.
	; List all values in the range from the first to the second of them (inclusive).
	;
	; 5, 10 => 5, 6, 7, 8, 9, 10
	; 5, 5 => 5
	; 10, 5 =>

    call ReadInt16
    mov bx, ax
    call ReadInt16
    mov cx, ax

while:
    cmp bx, cx
    jg end
    mov ax, bx
    call WriteInt16
    call WriteNewLine
    inc bx
    cmp bx, cx
    jng while    

end:
 	pop ebp
	ret
