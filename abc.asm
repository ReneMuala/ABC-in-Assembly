;; abc.asm
;; abc
;;
;; Created on 03/03/21 by Rene Muala
;; 
;;


section .bss ;; consts
	SYS_Write	equ	0x4
	SYS_Exit	equ	0x1
	EXIT_SUCESS equ 0x0
	stdout		equ	0x1
	byte_size	equ	0x4
	Total_to_print	equ	0x1a


section .data
	global c_let
	c_let	dd	65

section .text
global	_start
_start:	
	mov	r8,c_let		;; sets the first letter
	mov	r9,Total_to_print	;; sets how much we need to print

top:
	mov	rdx, 1			;; message length
	mov	rcx, r8			;; the message
	mov	rbx, stdout		;; file to write
	mov	rax, SYS_Write		;; syscall number
	int	0x80			;; call kernel

	add	dword[r8], 1    ;; increment the ascii value of the character to be printed
	dec	r9              ;; decrement the value since Total_to_print
	jnz	top             ;; if we've decremented Total_to_print up to 0, finish loop; else continue
	
done: 	
	mov	rax, SYS_Exit   ;; syscall
	mov rdi, EXIT_SUCESS ;; 0
	int	0x80           ;; call kernel
