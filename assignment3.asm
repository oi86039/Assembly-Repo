;Assignment 3 - Omar Ilyas
;Frigg

section .bss
	x resb 1		;0 or 1

section .text
	global _start
_start:

	mov x, 1		;Give the value of 1 to X
	mov rsi, x
	mov rdx, 1
	call _lock		; This should make x 0 to lock it

	call _unlock		; THis should make x 1 to unlock it
	

_lock:				;If 0, infinite loop till it's one
	;if x = 0
	mov rsi, x
	mov rdx, 1
	
	cmp  rsi, 0
	jeq _lock

	;else
	mov x, 0
	;do stuff

_unlock:
	;if x = 1
	mov rsi, x
	mov rdx, 1
	
	cmp  rsi, 1
	jeq _unlock

	;else
	mov x, 1
	;do stuff


	
