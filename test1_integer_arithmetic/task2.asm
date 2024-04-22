%include "rw32-2022-mingw.inc"

section .bss
	q resb 1
	r resb 1

section .data
	a db -128
	b dd -2147483648
	c dw -32768
	d dw -32768
	e dw -32768
    
section .text
CMAIN:
	push ebp
	mov ebp,esp

;
;--- Task 2 ---
;
; Create a function `task12` to evaluate the following expression using SIGNED integer arithmetic:
;
; q = (a*b + c - 26)/(12*d + e - 1153) ... division quotient
; r = (a*b + c - 26)%(12*d + e - 1153) ... division remainder
;
; The arguments a, b, c, d and e are stored in the memory and are defined as follows:
;
;    [a] ...  8bit signed integer
;    [b] ... 32bit signed integer
;    [c] ... 16bit signed integer
;    [d] ... 16bit signed integer
;    [e] ... 16bit signed integer
;
; Store the result to the memory at the addresses q and r this way:
;
;    [q] ... low 32 bits of the division quotient (32bit signed integer)
;    [r] ... division remainder (32bit signed integer)
;
; Important notes:
;  - do NOT take into account division by zero
;  - the function does not have to preserve the original content of the registers
;

 	mov eax, dword 12
	movsx ebx, word [d]
	imul ebx

	movsx ebx, word [e]
	add eax, ebx

	sub eax, 1153

	mov ecx, eax 

	movsx eax, byte [a]
	imul dword [b]

	movsx ebx, word [c]
	add eax, ebx
	adc edx, 0
    
	sar ebx, 31
	add edx, ebx

    sub eax, 26 
	sbb edx, 0

	idiv ecx

	mov dword [q], eax
	mov dword [r], edx 
	
 	pop ebp
	ret
