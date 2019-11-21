;Problem 2 - Omar Ilyas
;Enter 3 numbers. Display the sum of all 3 numbers. Display the product of all 3 numbers.

section .data					;Constant variables go here
	prompt1 db "Enter number one: "		;db = declare bytes 18
	prompt2 db "Enter number two: "		;Reserve bytes for chars unde label "prompt2" 18
	prompt3 db "Enter number three: "	;20
	printout1 db "Sum: "
	printout2 db "Product: "

section .bss					;Reserve bytes for dynamic variables here
	num1 resb 16				;Reserve 16 bytes for label firstName
	num2 resb 16
	num3 resb 16

;------------------------------------------------Text Section----------------------------------------------

section .text					;Main code goes here
	global _start				;Indicate linker starting point
_start:						;Starting routine

	call _printPrompt1			;call jumps tolabel before returning to current point
	call _getNum1				;jump to _getNum1, do that work, then jump back at ret
	call _printPrompt2			;print message "Enter Number two: "
	call _getNum2				;get the second number that the user typed
	call _printPrompt3
	call _getNum3

	call _addNums
	;call _multiplyNums

	mov rax, 60				;sys_exit code (60)
	mov rdi, 0				;error code report (0 = no error)
	syscall					;exit the program.

;----------------------------------------------Input Section------------------------------------------------

_printPrompt1:					;Print "Enter Number One: "
	mov rax, 1				;sys_write
	mov rdi, 1				;stdout (Standard output)
	mov rsi, prompt1			;message to print
	mov rdx, 18				;bytes reserved for message
	syscall					;execute instructions
	ret					;return to point called

_getNum1:					;Get Num1 Input
	mov rax, 0				;sys_read
	mov rdi, 0				;stdin (Standard input)
	mov rsi, num1				;where to store input
	mov rdx, 16				;bytes to reserve for storage
	syscall
	ret

_printPrompt2:					;Print "Enter Number Two: "
	mov rax, 1				;sys_write
	mov rdi, 1				;stdout (Standard output)
	mov rsi, prompt2			;message to print
	mov rdx, 18				;bytes reserved for message
	syscall					;execute instructions
	ret					;return to point called

_getNum2:					;Get Num2 Input
	mov rax, 0				;sys_read
	mov rdi, 0				;stdin (Standard input)
	mov rsi, num2				;where to store input
	mov rdx, 16				;bytes to reserve for storage
	syscall
	ret

_printPrompt3:					;Print "Enter Number Three: "
	mov rax, 1				;sys_write
	mov rdi, 1				;stdout (Standard output)
	mov rsi, prompt3			;message to print
	mov rdx, 20				;bytes reserved for message
	syscall					;execute instructions
	ret					;return to point called

_getNum3:					;Get Num3 Input
	mov rax, 0				;sys_read
	mov rdi, 0				;stdin (Standard input)
	mov rsi, num3				;where to store input
	mov rdx, 16				;bytes to reserve for storage
	syscall
	ret
;------------------------------------------------Math section----------------------------------------------

_addNums:
	mov rax, num1
	add rax, num2
	add rax, num3
	mov [rbp], rax
	mov rdx, 32	
	syscall

	mov rax, 1
	mov rdi, 1
	mov rsi, rbp
	mov rdx, 32
	syscall	

	ret

_multipleNums:
	ret
