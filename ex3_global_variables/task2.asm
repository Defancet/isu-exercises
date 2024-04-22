%include "rw32-2022-mingw.inc"

section .bss

section .data
   k dw 10
   l dw 20
   m dw 30

section .text
CMAIN:
	push ebp
	mov ebp,esp

	; Create three initialized 16b variables (K = 10, L = 20, M = 30).
    ; Write a program that changes the values to K = K+L+M, L = M+100, M = -M and display the values of all variables in the debugger.
	
    mov ax, [k]
    add ax, [l]
    add ax, [m]
    
    call WriteInt16
    
    mov ax, 100
    add ax, [m]
    
    call WriteNewLine
    call WriteInt16
    
    mov ax, [m]
    neg ax
    
    call WriteNewLine
    call WriteInt16


	pop ebp
	ret
