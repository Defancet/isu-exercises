%include "rw32-2022-mingw.inc"

section .bss

section .data
    
section .text

    ; Write a obratVypis function that retrieves several from the input 32b values and outputs them in reverse order.
    ; The function must not use global variables.
    ; The function must not back up the values of the registers used.
    ;
    ; 10, 20, 30, 40, 50 => 50, 40, 30, 20, 10
CMAIN:
    push ebp
    mov ebp, esp
    
    push dword 5
    call obratVypis
    add esp, 4

    pop ebp
    ret

obratVypis:
    push ebp
    mov ebp, esp
    sub esp, 20

    mov ecx, [ebp+8]
    
    read_loop:
        call ReadInt32
        mov ebx, eax
        
        mov eax, 4
        mul ecx
        neg eax
        mov edx, eax
        
        mov dword [ebp + edx], ebx
        loop read_loop
        
    mov ecx, [ebp+8]
    mov ebx, -20
    
    write_loop:
        call WriteNewLine
        
        mov eax, dword [ebp + ebx]
        call WriteInt32
        add ebx, 4
        loop write_loop
    
    mov esp, ebp
    pop ebp
    ret
    