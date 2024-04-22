%include "rw32-2022-mingw.inc"

section .bss
    v resw 1
    z resw 1

section .data
	k db 10
	l db 20
	m db 2
    n db 3

section .text
CMAIN:
	push ebp
	mov ebp,esp

	; Create four 8b ariables (k = 10, l = 20, m = 2, n = 3).
    ; Create two non-initialized 16B variables (v and z).
    ; Calculate the result of the following equation, store the share in Variable V, the rest in the variable Z, and display the contents of both variables in the debugger.
    ; f=(k+l+100)+(m*n)

    mov al, [m]
    mul byte [n]
    mov bx, ax

    mov al, [k]
    add al, [l]
    cbw
    add ax, 100
	cwd

    div bx

	mov [v], ax
	mov [z], dx

	pop ebp
	ret
