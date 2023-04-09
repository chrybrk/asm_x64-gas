/*
    Problem: Bubble Sort
    ===========================
*/
    .section    .note.GNU-stack,"",@progbits

    .section    .rodata
    .text
.p_size:    .string "size: "
.p_value:   .string "values: "
.p_newline: .string "\n"
.p_space:   .string " "
.value:     .string "%d"

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
    
    leaq    .value(%rip), %rax
    call    scan

    movq    %rax, -28(%rbp) # size

    movq    $4, %rsi
    movq    %rax, %rdi
    call    calloc
    movq    %rax, -4(%rbp)

    leaq    .p_value(%rip), %rbx
    call    print

    movl    $0, -24(%rbp) # i
.L0:
    leaq    .value(%rip), %rax
    call    scan

    movq    %rax, %r8

    movl    -24(%rbp), %eax
    cltq
    leaq    0(,%rax,4), %rdx
    movq    -4(%rbp), %rax
    addq    %rdx, %rax
    movq    %r8, (%rax)

    addl    $1, -24(%rbp)
    movl    -28(%rbp), %eax
    cmpl    %eax, -24(%rbp)
    jl      .L0

    movl    $0, -24(%rbp) # i
.Lprint0:
    movl    -24(%rbp), %eax
    cltq
    leaq    0(,%rax,4), %rdx
    movq    -4(%rbp), %rax
    addq    %rdx, %rax
    movq    (%rax), %rax
    leaq    .value(%rip), %rbx
    call    print

    leaq    .p_space(%rip), %rbx
    call    print

    addl    $1, -24(%rbp)
    movl    -28(%rbp), %eax
    cmpl    %eax, -24(%rbp)
    jl      .Lprint0

    leaq    .p_newline(%rip), %rbx
    call    print

    movl    $0, -24(%rbp) # i
.L1:
    movl    $0, -20(%rbp) # j
    .L2:
        movl    -24(%rbp), %eax
        cltq
        leaq    0(,%rax,4), %rdx
        movq    -4(%rbp), %rax
        addq    %rdx, %rax
        movl    (%rax), %eax

        movslq    %eax, %r8 # i_value

        movl    -20(%rbp), %eax
        cltq
        leaq    0(,%rax,4), %rdx
        movq    -4(%rbp), %rax
        addq    %rdx, %rax
        movl    (%rax), %eax

        movslq    %eax, %r9 # j_value

        movq    %r8, %rax
        movq    %r9, %rbx

        cmpq    %rax, %rbx
        jl      .L3

        // swap
        movl    -24(%rbp), %eax
        cltq
        leaq    0(,%rax,4), %rdx
        movq    -4(%rbp), %rax
        addq    %rdx, %rax
        movl    (%rax), %eax
        movl    %eax, -16(%rbp) # temp

        movl    -20(%rbp), %eax
        cltq
        leaq    0(,%rax,4), %rdx
        movq    -4(%rbp), %rax
        addq    %rdx, %rax
        movl    (%rax), %eax
        movl    %eax, -12(%rbp) # rhs

        movl    -24(%rbp), %eax
        cltq
        leaq    0(,%rax,4), %rdx
        movq    -4(%rbp), %rax
        addq    %rdx, %rax
        movl    -12(%rbp), %ebx # rhs
        movl    %ebx, (%rax)    # lhs

        movl    -20(%rbp), %eax
        cltq
        leaq    0(,%rax,4), %rdx
        movq    -4(%rbp), %rax
        addq    %rdx, %rax
        movl    -16(%rbp), %ebx # rhs
        movl    %ebx, (%rax)    # lhs

        .L3:
        addl    $1, -20(%rbp)
        movl    -28(%rbp), %eax
        cmpl    %eax, -20(%rbp)
        jl      .L2

    addl    $1, -24(%rbp)
    movl    -28(%rbp), %eax
    cmpl    %eax, -24(%rbp)
    jl      .L1

    movl    $0, -24(%rbp) # i
.Lprint1:
    movl    -24(%rbp), %eax
    cltq
    leaq    0(,%rax,4), %rdx
    movq    -4(%rbp), %rax
    addq    %rdx, %rax
    movq    (%rax), %rax
    leaq    .value(%rip), %rbx
    call    print

    leaq    .p_space(%rip), %rbx
    call    print

    addl    $1, -24(%rbp)
    movl    -28(%rbp), %eax
    cmpl    %eax, -24(%rbp)
    jl      .Lprint1

    leaq    .p_newline(%rip), %rbx
    call    print

    movl    $0, %eax
    leave
    ret
