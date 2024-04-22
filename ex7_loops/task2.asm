%include "rw32-2022-mingw.inc"

section .bss

section .data
    
section .text
CMAIN:
	push ebp
	mov ebp,esp

	; Read one 32b number from the input and output the number of ones in its binary notation.
    ;
    ; 0 => 0
    ; 1 => 1
    ; 255 => 8
    ; -1 => 32

    call ReadInt32
    call WriteBin32
    call WriteNewLine

    popcnt ebx, eax

    mov eax, ebx

    call WriteInt32

 	pop ebp
	ret
