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

    movq    $2, %rax
    movq    %rax, -28(%rbp)

    // esi / rsi: second param
    // edi / rdi: first param

    // calloc(n size, of size);
    movq    $4, %rsi
    movq    %rax, %rdi
    call    calloc
    movq    %rax, -8(%rbp)

    movq    -8(%rbp), %rax
    movq    $10, (%rax)

    movq    -8(%rbp), %rax
    addq    $4, %rax
    movq    $20, (%rax)

    movq    -8(%rbp), %rax
    movq    0(%rax), %r8
    movq    %r8, %rax
    leaq    .p_res(%rip), %rbx
    call    print

    movq    -8(%rbp), %rax
    movq    4(%rax), %r8
    movq    %r8, %rax
    leaq    .p_res(%rip), %rbx
    call    print

    movq    -8(%rbp), %rax
    movq    0(%rax), %r8

    movq    -8(%rbp), %rax
    movq    4(%rax), %rbx
    movq    %rbx, 0(%rax)

    movq    -8(%rbp), %rax
    movq    %r8, 4(%rax)

    movq    -8(%rbp), %rax
    movq    0(%rax), %r8
    movq    %r8, %rax
    leaq    .p_res(%rip), %rbx
    call    print

    movq    -8(%rbp), %rax
    movq    4(%rax), %r8
    movq    %r8, %rax
    leaq    .p_res(%rip), %rbx
    call    print

    movl    $0, %eax
    leave
    ret
