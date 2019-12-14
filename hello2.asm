section .data
	hello db "Hello, Alie Walie!",10	;declare bytes
	len1 equ $- hello

section .text
	global _start				;tells the linker unix

_start:
	;Print hello world!
	mov rax, 1				;sys_write
	mov rdi, 1				;stdout (Standard output)
	mov rsi, hello				;bytes to write to stdout
	mov rdx, len1				;length of bytes to write
	syscall					;runs kernal with register values

	;syscall (sys_write, stdout, "Hello, Allie Wallie!\n",21)

	mov rax, 60				;exit code
	mov rdi, 0				;error_code
	syscall
	
	;syscall (sys_exit, no_error)
