%include "rw32-2022-mingw.inc"

section .bss

section .data


section .text
CMAIN:
	push ebp
	mov ebp,esp

    ; Perform a calculation that simultaneously sets the OF, CF and ZF flags.
	; Check the contents of the EFLAGS register in the debugger.

	mov eax,0x80000000
	add eax,0x80000000
	
	pop ebp
	ret
