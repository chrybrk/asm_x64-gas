    .section	.note.GNU-stack,"",@progbits
    .text
    .section    .rodata
.T0:
    .string "%d\n"
.T1:
    .string "Hello, World!\n"
    .text
    .globl  main
    .type   main, @function
main:
    pushq   %rbp
    movq    %rsp, %rbp

    subq    $16, %rsp

    movl    $10, -4(%rbp)

    movl    -4(%rbp), %eax
    movl    %eax, %esi

    leaq    .T0(%rip), %rax
    movq    %rax, %rdi
    movl    $0, %eax
    call    printf

    leaq    .T1(%rip), %rax
    movq    %rax, %rdi
    movl    $0, %eax
    call    printf

    addq    $16, %rsp

	movl	$0, %eax
	popq	%rbp
	ret
