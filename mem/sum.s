/*
==================
1) take n input and store in the array.
2) print total sum of the element in array.

using calloc
==================
*/

    .section    .note.GNU-stack,"",@progbits

    .text
    .section    .rodata
.p_size:    .string "size: "
.p_inp:     .string "v: "
.p_res:     .string "result: %d\n"
.s_val:     .string "%d"

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

    subq    $32, %rsp

    leaq    .p_size(%rip), %rbx
    call    print

    leaq    .s_val(%rip), %rax
    call    scan

    movq    %rax, -28(%rbp)

    // esi / rsi: second param
    // edi / rdi: first param

    // calloc(n size, of size);
    movq    $4, %rsi
    movq    %rax, %rdi
    call    calloc
    movq    %rax, -8(%rbp)

    movl    $0, -24(%rbp)
.L0:
    leaq    .p_inp(%rip), %rbx
    call    print

    leaq    .s_val(%rip), %rax
    call    scan

    movq    %rax, %r8

    movl    -24(%rbp), %eax
    cltq
    leaq    0(,%rax,4), %rdx
    movq    -8(%rbp), %rax
    addq    %rdx, %rax
    movq    %r8, (%rax)

    addl    $1, -24(%rbp)
    movl    -28(%rbp), %eax
    cmpl    %eax, -24(%rbp)
    jl      .L0

    movl    $0, -20(%rbp)
    movl    $0, -24(%rbp)
.L1:
    movl    -24(%rbp), %eax
    cltq
    leaq    0(,%rax,4), %rdx
    movq    -8(%rbp), %rax
    addq    %rdx, %rax
    movl    (%rax), %eax
    addl    %eax, -20(%rbp)

    addl    $1, -24(%rbp)
    movl    -28(%rbp), %eax
    cmpl    %eax, -24(%rbp)
    jl      .L1

    movq    -20(%rbp), %rax
    leaq    .p_res(%rip), %rbx
    call    print

    movl    $0, %eax
    leave
    ret
