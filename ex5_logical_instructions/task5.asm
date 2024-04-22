%include "rw32-2022-mingw.inc"

section .bss


section .data
	text1 db "overflow", 0
	text2 db "NaN", 0

    
section .text
CMAIN:
	push ebp
	mov ebp,esp

	; Read two 8b digit numbers (X and Y) from the input.
	; Write a program that calculates the following equation and prints its result.
	; Modify the program so that it displays "overflow" if the sum overflows.
	; Modify the program so that it displays "NaN" if division by zero occurs during the division.	
	;
	; f = 1000 / (X + Y)
	; 10, 20 => 1000 / 30 = 33
	; 100, 100 => 1000 / −56 = overflow 
	; 10, −10 => 1000/ 0 = NaN

	call ReadInt8
	mov bl, al
	call ReadInt8
	mov cl, al

	mov ax, 1000
	add bl, cl
	cmp bl, 0
	jl overflow
	je NaN

	div bl
	cbw

	call WriteInt16

	jmp end

overflow:
	mov esi, text1
	call WriteString
	jmp end

NaN:
	mov esi, text2
	call WriteString
	jmp end

end
	pop ebp
	ret
