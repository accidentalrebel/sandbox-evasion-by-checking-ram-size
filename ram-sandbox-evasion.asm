	bits 64
	default rel

segment	.bss
	memory_size resb	64
	
segment .text
	global main
	extern ExitProcess
	extern GetPhysicallyInstalledSystemMemory
	extern GetLastError

main:
	push    rbp
	mov     rbp, rsp
	sub	rsp, 32

	lea	rcx, [memory_size]
	sub	rsp, 32
	call	GetPhysicallyInstalledSystemMemory
	add	rsp, 32

	sub	rsp, 32
	call	GetLastError
	add	rsp, 32

	xor     rax, rax
	call    ExitProcess
