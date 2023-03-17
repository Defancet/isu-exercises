%include "rw32-2022-mingw.inc"

section .bss
section .data
    
section .text
CMAIN:
	push ebp
	mov ebp,esp

;
; --- Task 1 ---
;
; Create a function "task11" to swap bytes Xl, X2, X3, X4 within the register EAX this way: 
;
; original value: EAX = X4 X3 X2 X1
; result        : EAX = X3 X4 X1 X2
;
; The argument to the function is passed in the register EAX and it returns the result 
; in the register EAX. The least significant byte is Xl, the most significant byte is X4 . 
;
; Arguments: 
;	- EAX = 32bit value
;
; Result:
;	- EAX = result 
;	- the function does not have to preserve content of any register 
;



	mov eax, 0x44332211
	
	ror eax, 16
	rol ax, 8
	rol eax, 8

	call WriteHex32

	pop ebp
	ret
