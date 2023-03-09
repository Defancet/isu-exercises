%include "rw32-2022-mingw.inc"

section .bss


section .data
	text1 db "both numbers are even", 10, 0
	text2 db "at least one number is odd", 10, 0
	x dw 11
	y dw 21
    
section .text
CMAIN:
	push ebp
	mov ebp,esp

	; Create two initialized 16b variables (X and Y).
	; Write a program that, depending on the value of the variables, prints the string "both numbers are even" or "at least one number is odd".
	; You can recognize even and odd numbers by the value of their lowest bit.
	; 10, 20 => both numbers are even
	; 11, 20 => at least one number is odd
	; 10, 21 => at least one number is odd
	; 11, 21 => at least one number is odd

header:	
	mov ax, [x]
	and ax, 1
	cmp ax, 0
	jne else

	mov ax, [y]
	and ax, 1
	cmp ax, 0
	jne else

if:	
	mov esi, text1
	call WriteString
	jmp end

else:
	mov esi, text2
	call WriteString
	jmp end

end:
	pop ebp
	ret
