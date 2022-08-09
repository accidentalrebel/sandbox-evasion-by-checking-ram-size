	bits 64
	default rel

segment .data
	msg_memory_size db	"Memory size: %lld", 0xd, 0xa, 0
	
segment	.bss
	memory_size resb	64	; Reserve 64 bytes which is equal to "unsigned long long"
	
segment .text
	global main
	extern ExitProcess
	extern GetPhysicallyInstalledSystemMemory
	extern printf

main:
	push    rbp
	mov     rbp, rsp
	sub	rsp, 32

	lea	rcx, [memory_size]	; Load the memory location of memory_size
	sub	rsp, 32			; Reserve shadow space
	call	GetPhysicallyInstalledSystemMemory
	add	rsp, 32			; Release shadow space

	mov	rdx, [memory_size]	; Argument 2; Result of GetPhysicallyInstalledSystemMemory
	lea	rcx, [msg_memory_size]  ; Argument 1; Format string
	sub	rsp, 32			; Reserve shadow space
	call	printf
	add	rsp, 32			; Release shadow space

	xor     rax, rax
	call    ExitProcess
