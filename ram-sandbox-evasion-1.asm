	bits 64
	default rel

segment .data
	msg_memory_size db	"Memory size: %lld", 0xd, 0xa, 0
	
segment .text
	global main
	extern ExitProcess
	extern GetPhysicallyInstalledSystemMemory
	extern printf

main:
	push    rbp
	mov     rbp, rsp

	sub	rsp, 0x8	; Reserve space for memory_size local variable
	xor	rax, rax	; Clear rax
	mov	[rsp], rax	; Place rax to the stack
	lea	rcx, [rsp]	; Argument 1; Load the memory location of memory_size to rcx

	sub	rsp, 32		; Reserve shadow space
	call	GetPhysicallyInstalledSystemMemory
	add	rsp, 32		; Release shadow space

	mov	rdx, [rsp]	; Argument 2; Result of GetPhysicallyInstalledSystemMemory
	lea	rcx, [msg_memory_size]  ; Argument 1; Format string
	sub	rsp, 32		; Reserve shadow space
	call	printf
	add	rsp, 32		; Release shadow space

	add	rsp, 0x8	; Release the space of memory_size local variable
	xor     rax, rax
	call    ExitProcess
