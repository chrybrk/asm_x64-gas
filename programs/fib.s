    .section    .note.GNU-stack,"",@progbits

    .section    .rodata
    .text
.p_result:  .string "%d "
.s_value:   .string "%d"

    .text
    .globl  main
    .type   main, @function
main:
    pushq   %rbp
    movq    %rsp, %rbp

    subq    $16, %rsp

    movl    $0, -12(%rbp) # f
    movl    $1, -8(%rbp) # s
    movl    $0, -4(%rbp) # n
    leaq    -4(%rbp), %rax
    movq    %rax, %rsi
    leaq    .s_value(%rip), %rax
    movq    %rax, %rdi
    movl    $0, %eax
    call    scanf

.L0:
    movq    -12(%rbp), %rax
    movq    %rax, %rsi
    leaq    .p_result(%rip), %rax
    movq    %rax, %rdi
    movl    $0, %eax
    call    printf

    movl    -12(%rbp), %eax
    addl    -8(%rbp), %eax
    movl    -8(%rbp), %ebx
    movl    %ebx, -12(%rbp)
    movl    %eax, -8(%rbp)

    subl    $1, -4(%rbp)
    cmpl    $0, -4(%rbp)
    jg      .L0

    leave
    movl    $0, %eax
    ret
