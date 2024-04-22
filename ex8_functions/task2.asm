%include "rw32-2022-mingw.inc"

section .bss

section .data
    
section .text

    ; Write a program that reads an 8b number (X) from the input and calls the vypisRadek function X times.
    ; The vypis function prints X asterisks and one line break.
    ; The input to the function will be the value X, passed in the EAX register.
    ; The function must preserve the value of all registers used.
    ;
    ; 1 => *
    ;
    ; 2 => **
    ;      **
    ;
    ; 3 => ***
    ;      ***
    ;      ***

CMAIN:
    call ReadInt8
    cbw
    cwde
    mov ecx, eax
    call WriteNewLine
    
for:
    call vypisRadek
    loop for

end:    
    ret

vypisRadek:
    cmp eax, 0
    jle end

    push eax
    push ecx

    mov ecx, eax
                     
    print_loop:
        mov eax, '*'
        call WriteChar
        loop print_loop
    
    call WriteNewLine

    pop ecx
    pop eax

    ret
