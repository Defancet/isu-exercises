%include "rw32-2022-mingw.inc"

section .bss

section .data
    
section .text

    ; Read one 32b number from the input, and use recursion to calculate the value of the corresponding pyramid number:
    ; pc(0) = 0
    ; pc(n) = n^2 + pc(n-1)
    ; The input to the function is the value of n passed through the stack.
    ; You can ignore the upper 32b of the multiplication result.
    ;
    ; 0 => 0
    ; 1 => 1
    ; 2 => 5
    ; 3 => 14
    ; 4 => 30
    ; 5 => 55

CMAIN:  
    call ReadInt32
    push eax
    call pc
    add esp, 4
    call WriteInt32
    ret

pc:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]
    cmp eax, 0
    je end
    
    dec eax ; eax = (n-1)
    push eax
    call pc
    add esp, 4

    mov ebx, [ebp + 8]
    imul ebx, ebx   ; ebx = n^2
    add eax, ebx    ; eax = (n-1) + n^2

    end:
        pop ebp
        ret
