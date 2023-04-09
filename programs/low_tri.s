    .section    .note.GNU-stack,"",@progbits

    .text
    .section    .rodata
.T0:
    .string "*"
.T1:
    .string "\n"

    .text
    .globl  main
    .type   main, @function

main:
    pushq   %rbp
    movq    %rsp, %rbp

    subq    $16, %rsp

    movl    $10, -4(%rbp) # range

    // lower triangle

    movl    $0, -12(%rbp)
.L0:

    movl    $0, -8(%rbp)
    .L1:
        leaq    .T0(%rip), %rax
        movq    %rax, %rdi
        movl    $0, %eax
        call    printf

        addl    $1, -8(%rbp)
        movl    -12(%rbp), %eax
        cmpl    %eax, -8(%rbp)
        jle     .L1

    leaq    .T1(%rip), %rax
    movq    %rax, %rdi
    movl    $0, %eax
    call printf

    addl    $1, -12(%rbp)
    movl    -4(%rbp), %eax
    cmpl    %eax, -12(%rbp)
    jne     .L0

    addq    $16, %rsp

    movl	$0, %eax
    popq	%rbp
    ret
