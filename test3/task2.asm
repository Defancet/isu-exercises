%include "rw32-2022-mingw.inc"

    CEXTERN _qsort

section .bss

section .data
    task31_array dq 1.5,-100.5, 300.0, -434.434, 0.0, 1.0, -1.0, 0.001, 1.5, 200.75
    task31_array_len dd 10

section .text

;
;--- Task 2 ---
;
; Create a function: float task32(float x, float y) to evaluate a function f(x,y) for the given input (x, y)
; using FPU. The function returns the result of the evaluation in the ST0 FPU register. The function receives its
; parameters x and y on the stack in order from the last to the first, the stack is cleared by the caller and the
; result is returned in the ST0 FPU register (C calling convention - CDECL).
;
; The function f(x,y) is defined as follows:
;
;
;            sqrt(y + 11.050) + cos(y + pi*x)
; f(x,y) = ---------------------------------------------
;                    abs(y - x*2)
;
;
; Function parameters:
;   x: IEEE754 single precision 32bit floating point number (float),
;   y: IEEE754 single precision 32bit floating point number (float),
;
; Return values:
;   ST0 = f(x,y), ignore exceptions caused by the division by zero or square root of a negative number
;
; Important:
;   - you are not allowed to use the following FPU instructions: FINIT, FNINIT, FCLEX, FNCLEX, FFREE, FINCSTP, FDECSTP,
;     FLDCW, FLDENV, FRSTOR, FXRSTOR,
;   - assume that the FPU has already been initialized by the FINIT instruction,
;   - the function MUST preserve content of all the registers except for the EAX, ECX, EDX and flags registers,
;   - the function MUST empty the FPU stack except for the ST0 register, in which the function returns its result.
;

CMAIN:  
    push __float32__(26.050)
    push __float32__(31.050)
    call task32
    add esp,8

    call WriteDouble

    ret
    
task32:
    push ebp 
    mov ebp, esp 

    fldpi 
    fld dword [ebp + 8] ;x 
    fmulp 
    fld dword [ebp + 12] ;y 
    faddp 
    fcos 
     
    push __float32__(11.050) 
    fld dword [esp] 
    add esp, 4 
    fld dword [ebp + 12] 
    faddp 
    fsqrt 
 
    faddp 
  
    fld dword [ebp + 8] 
    push 2 
    fild dword [esp] 
    add esp, 4 
    fmulp 
    fld dword [ebp + 12] 
    fsubrp 
    fabs 
 
    fdivp 
 
    pop ebp 
    ret 
