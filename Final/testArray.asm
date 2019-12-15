;Problem 2 - Omar Ilyas

section .data					;Constant variables go here
	prompt1 db "Enter number: "		;db = declare bytes 18
	len equ $- prompt1

section .bss					;Reserve bytes for dynamic variables here
	num1 resb 16				;Reserve 16 bytes for label firstName
	len1 equ $- num1
;------------------------------------------------Text Section----------------------------------------------

section .text					;Main code goes here
	global _start				;Indicate linker starting point
_start:						;Starting routine

	mov rbx,3				;loop to the loop label 3 times
	loop:					

	mov rsi, prompt1			;Print prompt
	mov rdx, len
	call _printPrompt			;call jumps tolabel before returning to current point
	
	mov rsi, num1				;Get num
	mov rdx, 16
	call _getNum

	sub ebx, 1				;increment loop	
	
	cmp rbx, 0
	jg loop					;jump/loop if greater than 0

	mov rsi, num1
	mov rdx, len1
	call _printPrompt			;call jumps tolabel before returning to current point

	mov rax, 60				;sys_exit code (60)
	mov rdi, 0				;error code report (0 = no error)
	syscall					;exit the program.

;----------------------------------------------Input Section------------------------------------------------

_printPrompt:					;Print "Enter Number One: "
	mov rax, 1				;sys_write
	mov rdi, 1				;stdout (Standard output)
	syscall					;execute instructions
	ret					;return to point called

_getNum:					;Get Num1 Input
	mov rax, 0				;sys_read
	mov rdi, 0				;stdin (Standard input)
	syscall
	ret
