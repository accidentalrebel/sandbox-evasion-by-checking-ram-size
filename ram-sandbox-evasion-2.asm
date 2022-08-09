	bits 64
	default rel

segment .data
	msg_memory_size db	"Memory size: %lld", 0xd, 0xa, 0
	
segment	.bss

	
segment .text
	global main
	extern ExitProcess
	extern GlobalMemoryStatusEx
	extern printf

main:
	push    rbp
	mov     rbp, rsp
	sub	rsp, 32

	

	xor     rax, rax
	call    ExitProcess
