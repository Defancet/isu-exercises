%include "rw32-2022-mingw.inc"

    extern _malloc
    extern _free
    extern _printf

section .bss

section .data
    mallocsuccess db "Memory allocated at: %i", 0
    mallocfail db "Allocation failed", 0
    
section .text

    ; Read a single 32b number from the input and try to dynamically allocate the corresponding amount of memory on the heap (malloc).
    ; If the memory allocation was successful, write its address (printf) in the string "Memory allocated at: %i" and release it (free).
    ; If the memory allocation failed, write the string "Allocation failed".
    ;
    ; extern _malloc ; external function "void* malloc (size_t size );"
    ; extern _free   ; external function "void free (void* ptr );"
    ; extern _printf ; external function "int printf (const char* format, ...);"
    ;
    ; 20 => Memory allocated at: 11300896
    ; -1 => Allocation failed

CMAIN:  
    push ebp
    mov ebp, esp

    call ReadInt32
    push eax
    call _malloc
    add esp, 4

    cmp eax, 0
    je malloc_fail

    push eax
    call _free
    push mallocsuccess
    call _printf
    add esp, 8

    jmp end

malloc_fail:
    push mallocfail
    call _printf
    add esp, 4

end:
    pop ebp
    ret
