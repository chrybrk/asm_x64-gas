/*
    Problem: Collatz Conjecture
    ===========================

    Start with a number n > 1. Find the number of steps it takes to reach one, using following process.
    if n is even divide by 2.
    if n is odd multiply by 3 and add 1.
*/

    .section    .note.GNU-stack,"",@progbits

    .section    .rodata
    .text
.p_result:  .string "\n%d\n"
.p_inner:   .string "%d "
.s_value:   .string "%d"

    .text
    .globl  main
    .type   main, @function

main:
    pushq   %rbp
    movq    %rsp, %rbp

    subq    $16, %rsp

    movl    $0, -4(%rbp)
    leaq    -4(%rbp), %rax
    movq    %rax, %rsi
    leaq    .s_value(%rip), %rax
    movq    %rax, %rdi
    movl    $0, %eax
    call    scanf

    movl    $0, -8(%rbp)

.L0:
    movl	-4(%rbp), %eax
    andl    $1, %eax
    testl   %eax, %eax
    jne     .L2

	movl	-4(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -4(%rbp)

    jmp     .L1
.L2:
	movl	-4(%rbp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)

.L1:
    movq    -4(%rbp), %rax
    movq    %rax, %rsi
    leaq    .p_inner(%rip), %rax
    movq    %rax, %rdi
    movl    $0, %eax
    call    printf

    addl    $1, -8(%rbp)
    cmpl    $1, -4(%rbp)
    jne     .L0

    movq    -8(%rbp), %rax
    movq    %rax, %rsi
    leaq    .p_result(%rip), %rax
    movq    %rax, %rdi
    movl    $0, %eax
    call    printf

    leave
    movl    $0, %eax
    ret
