%include "rw32-2022-mingw.inc"

    extern _time
    extern _srand
    extern _rand

section .bss

section .data
    
section .text

    ; Use an external function from the C language library to find the current time.
    ; Use the time to initialize the pseudo-random generator (srand).
    ; In a loop, generate and output five random numbers (rand).
    ;
    ; extern _time ; external function: time_t time (time_t* timer );
    ; extern _srand ; external function: void srand (unsigned int seed);
    ; extern _rand ; external function: int rand (void);
    ;
    ; => 4900, 19769, 23118, 4036, 27957.
    ; => 4903, 30517, 8214, 28099, 5504.

CMAIN:  
    push dword 0
    call _time
    add esp, 4

    push eax
    call _srand
    add esp, 4

    mov ecx, 5
for:
    push ecx
    call _rand
    pop ecx
    call WriteInt32
    call WriteNewLine
    loop for

    ret
