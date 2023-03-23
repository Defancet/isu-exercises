%include "rw32-2022-mingw.inc"

section .bss

section .data
    hi db "Hello, World!", 0
    
section .text
CMAIN:
	push ebp
	mov ebp,esp

    ; Vytvořte si inicializované pole obsahující řetězec ”Hello, World!”.
    ; Napište program který ze vstupu načte jeden znak (funkce ReadChar), a první výskyt tohoto znaku v řetězci nahradí pomlčkou ’–’.
    ; Upravený řetězec vypište na výstup.
    ;
    ; ’H’ => –ello, World!
    ; ’e’ => H–llo, World!
    ; ’l’ => He–lo, World!
    ; ’o’ => Hell–, World!
    ; ’X’ => Hello, World!

    call ReadChar
    mov dl, al
    mov ecx, 0
    
loop:
    mov bl, [hi + ecx]
    cmp bl,  dl
    je replace
    inc ecx
    cmp ecx, 13
    jne loop
replace:    
    mov byte [hi + ecx], "-"

end:
    mov esi, hi
    call WriteString

 	pop ebp
	ret
