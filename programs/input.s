    .section    .note.GNU-stack,"",@progbits

    .text
    .section    .rodata
.T0:
    .string "%d"

.T1:
    .string "%d\n"

    .text
    .globl  main
    .type   main, @function

main:
    pushq   %rbp
    movq    %rsp, %rbp

    subq    $16, %rsp

    movl    $0, -12(%rbp)
    leaq    -12(%rbp), %rax
    movq    %rax, %rsi
    leaq    .T0(%rip), %rax
    movq    %rax, %rdi
    movl    $0, %eax
    call    scanf

    movq    -12(%rbp), %rax
    movq    %rax, %rsi
    leaq    .T1(%rip), %rax
    movq    %rax, %rdi
    movl    $0, %eax
    call    printf

    addq    $16, %rsp

    movl	$0, %eax
    popq	%rbp
    ret
