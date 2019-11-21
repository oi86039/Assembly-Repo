;Problem 1 - Omar Ilyas
;Enter First Name, Enter Last Name, and display both first and last name as output.

section .data					;Constant variables go here
	prompt1 db "Enter First Name: "		;db = declare bytes
	prompt2 db "What is your name? "	;Reserve bytes for chars unde label "prompt2"
	printout db "Hello, "

section .bss					;Reserve bytes for dynamic variables here
	firstName resb 16				;Reserve 16 bytes for label firstName
	lastName resb 16

section .text
	global _start
_start:

	call _printPrompt1
	call _getName
	call _printPrompt2
	call _printName

	mov rax, 60
	mov rdi, 0
	syscall

_getName:
	mov rax, 0
	mov rdi, 0
	mov rsi, name
	mov rdx, 16
	syscall
	ret

_printText1:
	mov rax, 1
	mov rdi, 1
	mov rsi, prompt1
	mov rdx, 19
	syscall
	ret

_printText2:
	mov rax, 1
	mov rdi, 1
	mov rsi, text2
	mov rdx, 7
	syscall
	ret

_printName:
	mov rax, 1
	mov rdi, 1
	mov rsi, name
	mov rdx, 16
	syscall
	ret

