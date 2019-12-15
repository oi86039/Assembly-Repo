;Problem 2 - Omar Ilyas

section .data					;Constant variables go here
	prompt1 db "Enter number one: "		;db = declare bytes 18
	prompt2 db "Enter number two: "		;Reserve bytes for chars unde label "prompt2" 18
	prompt3 db "Enter number three: "	;20
	prompt4 db "Enter number four: "	;19
	prompt5 db "Enter number five: "	;19
	prompt6 db "Enter number six: "		;18
	printout1 db "Smallest: "		;10
	printout2 db "Largest: "		;9
	printout3 db "Large to Small: "		;16
	printout4 db "Small to Large: "		;16

section .bss					;Reserve bytes for dynamic variables here
	num1 resb 2				;Reserve 16 bytes for label firstName
	num2 resb 2
	num3 resb 2
	num4 resb 2
	num5 resb 2
	num6 resb 2
	min
;------------------------------------------------Text Section----------------------------------------------

section .text					;Main code goes here
	global _start				;Indicate linker starting point
_start:						;Starting routine

	;prompt for the 6 input numbers:
	mov rsi, prompt1			;Load prompt1 into param for rsi
	mov rdx, 18				;Load size of prompt
	call _printPrompt			;call jumps tolabel before returning to current point
	mov rsi, num1
	mov rdx, 2
	call _getNum

	mov rsi, prompt2			;jump to _getNum1, do that work, then jump back at ret
	mov rdx, 18
	call _printPrompt			;print message "Enter Number two: "
	mov rsi, num2
	mov rdx, 2
	call _getNum				;get the second number that the user typed
	
	mov rsi, prompt3
	mov rdx, 20
	call _printPrompt
	mov rsi, num3
	mov rdx, 2
	call _getNum

	mov rsi, prompt4
	mov rdx, 19
	call _printPrompt
	mov rsi, num4
	mov rdx, 2
	call _getNum

	mov rsi, prompt5
	mov rdx, 19
	call _printPrompt	
	mov rsi, num5
	mov rdx, 2
	call _getNum

	mov rsi, prompt6
	mov rdx, 19
	call _printPrompt
	mov rsi, num6
	mov rdx, 2
	call _getNum


	call _addNums

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

;------------------------------------------------Math section----------------------------------------------

_addNums:
	;Store numbers in memory (convert from ascii to normal nums)
	mov rax, [num1]
	sub rax, '0'				;subtracting Ascii 0 converts the number to a decimal number
	mov rdi, [num2]	
	sub rdi, '0'
	mov rsi, [num3]
	sub rsi, '0'
	mov rdx, [num4]
	sub rdx, '0'
	mov r10, [num5]
	sub r10, '0'
	


	;Add numbers
	add rax, rdi
	add rax, rsi
	add rax, rdx
	add rax, r10
	add rax, '0'				;converts number back into ascii for printing
	mov [sum], rax				;move address of total sum in rax to address of sum var

	;Print result
	mov rax, 1
	mov rdi, 1
	mov rsi, sum
	mov rdx, 1
	syscall	

	ret

