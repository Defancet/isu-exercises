%include "rw32-2022-mingw.inc"

section .bss
    x resd 1 
    
section .data
    y db 10
    z db 20

section .text
CMAIN:
	push ebp
	mov ebp,esp

	; Create one uninitialized 32b variable (X).
	; Read one 32b number from the input, store it in a variable, and display its value in the debugger.
	; Create two initialized 8b variables (Y = 10 and Z = 20).
    ; Write the sum of both variables to the output.
	
	call ReadInt32
    mov [x], al
    
    mov al, [y]
    add al, [z]
    call WriteInt32

	pop ebp
	ret
