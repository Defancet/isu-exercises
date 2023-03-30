%include "rw32-2022-mingw.inc"

section .bss

section .data
    arr dd 10, 20, 30, 40, 50
    arr2 dd 100, 200, 300
    
section .text

    ; Create an array of 32b signed numbers with some initial values.
    ; Write a sumaPole function that takes as input the address of the array (ESI) and the number of its elements (EAX), and returns their sum (EAX) as output.
    ; Call the sumaPole function from the main function, and print its result.

CMAIN:
    mov esi, arr
    mov eax, 5
    call sumaPole
    call WriteInt32
    call WriteNewLine

    mov esi, arr2
    mov eax, 3
    call sumaPole
    call WriteInt32
    call WriteNewLine

    ret

sumaPole:
    mov ecx, eax
    xor eax, eax

    for:
        mov ebx, [esi]
        add eax, ebx
        add esi, 4
        loop for
    
    ret
