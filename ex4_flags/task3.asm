%include "rw32-2022-mingw.inc"

section .bss

section .data


section .text
CMAIN:
	push ebp
	mov ebp,esp

    ; Load the value 0x12345678 into the EAX register.
	; Modify the contents of the register with shifts and rotations so that you can write the value 0x12347856 from it.
	; You can use the call WriteHex32 function for the listing.

	mov eax, 0x12345678
    call WriteHex32
    call WriteNewLine
    
    rol ax, 8 
    call WriteHex32
    call WriteNewLine
    
    ror eax, 8 
    call WriteHex32
    call WriteNewLine
    
    rol al, 4
    call WriteHex32
    call WriteNewLine
   
    ror eax, 12
    call WriteHex32
    call WriteNewLine
    
    ror eax, 8
    call WriteHex32
    call WriteNewLine
    
    shr ax, 8
    call WriteHex32
    call WriteNewLine

	pop ebp
	ret
