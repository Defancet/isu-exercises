%include "rw32-2022-mingw.inc"

section .bss

section .data
    
section .text

    ; Read one 32b number (n) from the input and call the function vypisRekurze.
    ; For n == 0 the function prints n.
    ; For n != 0, the function prints n, calls vypisRekurze for n-1, and prints n again.
    ; The input to the function is the value of n passed in the EAX register.
    ;
    ; 0 => 0
    ; 2 => 21012
    ; 5 => 54321012345

CMAIN:  
    call ReadInt32
    call vypisRekurze
    ret

vypisRekurze:
    push ebp
    mov ebp, esp

    cmp eax, 0
    je end

    push eax 
    call WriteInt32

    dec eax
    call vypisRekurze

    call WriteInt32
    pop eax

    end:
        pop ebp
        ret
