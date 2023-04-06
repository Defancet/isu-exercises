%include "rw32-2022-mingw.inc"

section .bss

section .data
    arr dw 10, 20, 30, 40, 50
    
section .text

    ; Create an initialized array of several 16b unsigned numbers.
    ; Write a function pocetMensich that counts the number of elements with value less than n.
    ; Define and call the function according to the STDCALL convention and the following header:
    ;
    ; int pocetMensich (short* array , int lenght , int n);
    ;
    ; Call the function pocetMensich from the main function and print its result.
    ;
    ; *(10, 20, 30, 40, 50), 5, 25 => 2
    ; *(10000, 50000), 2, 20000 => 1

CMAIN:  
    push dword 25 
    push dword 5 
    push dword arr 

    call pocetMensich
    call WriteInt32
    ret
    
pocetMensich:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]
    mov ecx, [ebp + 12]
    mov edx, [ebp + 16]
    xor ebx, ebx

    for:
        cmp ecx, 0
        je end
        
        movzx edx, word [eax]

        cmp edx, [ebp + 16]
        jge for_next  
        inc ebx
 
    for_next:
        add eax, 2
        dec ecx
        jmp for

    end:
        mov eax, ebx

        pop ebx
        ret 12