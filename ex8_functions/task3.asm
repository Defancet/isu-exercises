%include "rw32-2022-mingw.inc"

section .bss

section .data
    
section .text

    ; Write a function obsah that calculates the content of a rectangle from the coordinates (X1, Y1) and (X2, Y2) passed through the stack.
    ; The function must preserve the value of all registers except the output EAX (you can ignore the upper 32b of the result)

CMAIN:
    mov ebp, esp
    push dword 20   ;Y2
    push dword 10   ;X2
    push dword 5    ;Y1
    push dword 0    ;X1

    call obsah
    add esp, 16

    call WriteInt32

    ret    
    
obsah:
    push ebp
    mov ebp, esp

    mov eax, [ebp+8]    ;X1
    sub eax, [ebp+16]   ;X1 - X2 = dx
    
    mov ebx, [ebp+12]   ;Y1
    sub ebx, [ebp+20]   ;Y1 - Y2 = dy
    imul ebx            ;dx * dy

    pop ebp
    ret
