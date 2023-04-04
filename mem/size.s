    .section    .note-GNU-stack,"",@progbits

    .text
    .section    .rodata
.Tsize:
    .string "size: "
.Tvalues:
    .string "value: "
.TscanINT:
    .string "%d"
.Tresult:
    .string "result: %d\n"

    .text
    .globl  main
    .type   main, @function

print:
    movq    %rax, %rsi
    movq    %rbx, %rdi
    movl    $0, %eax
    call    printf
    ret

scan:
    movq    %rax, %rdi

    pushq   %rbp
    movq    %rsp, %rbp

    subq    $16, %rsp

    movl    $0, -12(%rbp)
    leaq    -12(%rbp), %rax
    movq    %rax, %rsi
    movl    $0, %eax
    call    scanf

    movq    -12(%rbp), %rax

    addq    $16, %rsp

    popq   %rbp
    ret

main:
    pushq   %rbp
    movq    %rsp, %rbp

    subq    $16, %rsp

    movl    $0, -12(%rbp)
.L0:
    leaq    .TscanINT(%rip), %rax
    call    scan

    movq    %rax, %r8

	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
    movq    %r8, (%rax)

    addl    $1, -12(%rbp)
    cmpl    $4, -12(%rbp)
    jle     .L0

    movl    $0, -12(%rbp)
.L1:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.Tresult(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT

    addl    $1, -12(%rbp)
    cmpl    $4, -12(%rbp)
    jle     .L1

    addq    $16, %rsp

    movl    $0, %eax
    popq    %rbp
    ret
