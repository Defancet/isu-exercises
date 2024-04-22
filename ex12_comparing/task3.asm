%include "rw32-2022-mingw.inc"

section .bss

section .data
    X dq 4.0
section .text

; Implement and call the odmocnina function defined by the header.
;
; double odmocnina(double X)
;
; Funke computes the square root without using the FSQRT instruction, by performing ten iterations of the Babylon method defined by the iteration equation:
;
; Yi+1 = 1/2 (X / Yi + Yi)
;
; For simplicity, assume that X will always be a positive number.
; Use the input value of X as the initial value of the square root of Y0.
; At the end of the function, remove the values of all FPU registers except the output ST0.
;
; 4.0 => 2.000000
; 10.0 => 3.162278
; 100.0 => 10.000000

CMAIN:  
    push dword [X + 4]
    push dword [X + 0]

    call odmocnina
    add esp, 8
    call WriteDouble

    ret

odmocnina:
    push ebp
    mov ebp,esp

    push __float32__(0.5)
    fld dword [esp]
    add esp, 4

    fld qword [ebp + 8]


    mov ecx, 10

    for:     
        fld qword [ebp + 8]
        fdiv st0, st1
        fadd st0, st1
        fmul st0, st2
        fstp st1
        loop for

    pop ebp
    ret