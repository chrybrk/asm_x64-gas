    .section    .note.GNU-stack,"",@progbits
    .text
    .section    .rodata
.T0:
    .string "%d is even number.\n"
.T1:
    .string "%d is odd number.\n"
.T2:
    .string "%d\n"
    .text
    .globl  main
    .type   main, @function

main:
    pushq   %rbp
    movq    %rsp, %rbp

    subq    $16, %rsp

    movl    $1, -12(%rbp) # n: var
.L0:

	movl	-12(%rbp), %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$31, %eax
	addl	%eax, %edx
	andl	$1, %edx
	subl	%eax, %edx
	movl	%edx, -8(%rbp)

    cmpl    $0, -8(%rbp)
    jne     .L1

    movl    -12(%rbp), %eax
    movl    %eax, %esi

    leaq    .T0(%rip), %rax
    movq    %rax, %rdi
    movl    $0, %eax
    call    printf
    jmp     .L2

.L1:
    movl    -12(%rbp), %eax
    movl    %eax, %esi

    leaq    .T1(%rip), %rax
    movq    %rax, %rdi
    movl    $0, %eax
    call    printf

.L2:
    addl    $1, -12(%rbp)
    cmpl    $11, -12(%rbp)
    jne     .L0

    addq    $16, %rsp

	movl	$0, %eax
	popq	%rbp
	ret
