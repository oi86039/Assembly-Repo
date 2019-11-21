;Problem 1 - Omar Ilyas
;Enter First Name, Enter Last Name, and display both first and last name as output.

section .data					;Constant variables go here
	prompt1 db "Enter First Name: "		;db = declare bytes
	prompt2 db "Enter Last Name: "	;Reserve bytes for chars unde label "prompt2"
	printout db "Hello, "

section .bss					;Reserve bytes for dynamic variables here
	firstName resb 16				;Reserve 16 bytes for label firstName
	lastName resb 16

;-------------------------------------------------------------------------------------------------------

section .text					;Main code goes here
	global _start				;Indicate linker starting point
_start:						;Starting routine

	mov rsi, prompt1
	mov rdx, 18
	call _printPrompt			;call jumps tolabel before returning to current point
	
	mov rsi, firstName
	mov rdx, 16
	call _getName			;jump to _getName, do that work, then jump back at ret

	mov rsi, prompt2
	mov rdx, 17
	call _printPrompt			;call jumps tolabel before returning to current point
	
	mov rsi, lastName
	mov rdx, 16
	call _getName			;jump to _getName, do that work, then jump back at ret
	
	
	call _printName

	mov rax, 60				;sys_exit code (60)
	mov rdi, 0				;error code report (0 = no error)
	syscall					;exit the program.

;-------------------------------------------------------------------------------------------------------

_printPrompt:					;Print "Enter First Name: "
	mov rax, 1				;sys_write
	mov rdi, 1				;stdout (Standard output)
	
	syscall					;execute instructions
	ret					;return to point called

_getName:					;Get First Name Input
	mov rax, 0				;sys_read
	mov rdi, 0				;stdin (Standard input)
	
	syscall
	ret

_printName:					;Print "Hello, " + firstName + lastName
	
	;Print "Hello, "
	mov rax, 1
	mov rdi, 1
	mov rsi, printout
	mov rdx, 7
	syscall

	;Print firstName
	mov rax, 1
	mov rdi, 1
	mov rsi, firstName
	mov rdx, 16
	syscall

	;Print lastName
	mov rax, 1
	mov rdi, 1
	mov rsi, lastName
	mov rdx, 16
	syscall

	ret

