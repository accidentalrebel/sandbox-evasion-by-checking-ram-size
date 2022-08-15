	bits 64
	default rel

segment .data
	msg_memory_size db	"Memory size: %lld", 0xd, 0xa, 0
	
segment .text
	global main
	extern ExitProcess
	extern GlobalMemoryStatusEx
	extern printf

main:
	push    rbp
	mov     rbp, rsp

	sub	rsp, 0x40	; Reserve space for struct on stack
	                        ; MEMORYSTATUSEX's is 64 bytes (0x40) in size 
	
	mov	rax, 0x40	
	mov	[rsp], rax	; Assign 0x40 to dwLength
	lea	rcx, [rsp]	; Load the memory location of struct

	sub	rsp, 32		; Reserve shadow space
	call	GlobalMemoryStatusEx
	add	rsp, 32		; Release shadow space

	mov	rax, [rsp+0x8]  ; Retrive value of ullTotalPhys from stack
	mov	rcx, 1024
	xor 	rdx, rdx        ; Clear rdx; This is required before calling div
	div	rcx		; Divide by 1024 to convert to KB

	mov	rdx, rax        ; Argument 2; Result of ullTotalPhys / 1024
	lea	rcx, [msg_memory_size]  ; Argument 1; Format string
	sub	rsp, 32		; Reserve shadow space
	call	printf
	add	rsp, 32		; Release shadow space

	add	rsp, 0x40	; Release space of struct from stack
	
	xor     rax, rax
	call    ExitProcess
