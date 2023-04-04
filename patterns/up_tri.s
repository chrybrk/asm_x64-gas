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

    // upper triangle

    movl    -4(%rbp), %eax
    movl    %eax, -12(%rbp)
.L2:

    movl    $0, -8(%rbp)
    .L3:
        leaq    .T0(%rip), %rax
        movq    %rax, %rdi
        movl    $0, %eax
        call    printf

        addl    $1, -8(%rbp)
        movl    -12(%rbp), %eax
        cmpl    %eax, -8(%rbp)
        jle     .L3

    leaq    .T1(%rip), %rax
    movq    %rax, %rdi
    movl    $0, %eax
    call printf

    subl    $1, -12(%rbp)
    cmpl    $0, -12(%rbp)
    jge     .L2

    addq    $16, %rsp

    movl	$0, %eax
    popq	%rbp
    ret
