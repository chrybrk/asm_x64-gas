/*
    Problem: Stack Base Math Calculator
    ===========================
    value size:     4 -28
    operation size: 2 -24

    value:
    [   1   ] 0
    [   3   ] 4
    [   6   ] 8
    [   8   ] 12

    operation:
    [   +   ] 16
    [   -   ] 20

    total size: (4 + 2) * 4 = 24 nbits -4
*/


    .section    .note.GNU-stack,"",@progbits

    .section    .rodata
    .text
.p_size_value:      .string "value size: "
.p_size_operation:  .string "operation size: "
.p_value:           .string "value: "
.p_operation:       .string "operation: "
.p_newline:         .string "\n"
.p_space:           .string " "
.value:             .string "%d"
.value_c:           .string "%c"

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

get:
    pushq   %rbp
    movq    %rsp, %rbp

    subq    $32, %rsp

    movq    %rdi, -8(%rbp)
    movq    %rsi, -16(%rbp)

    xorq    %rdi, %rdi
    xorq    %rsi, %rsi

    movq    -8(%rbp), %rbx
    call    print

    movq    -16(%rbp), %rax
    call    scan

    leave
    ret

main:
    pushq   %rbp
    movq    %rsp, %rbp

    subq    $32, %rsp

    leaq    .p_size_value(%rip), %rdi
    leaq    .value(%rip), %rsi
    call    get

    movq    %rax, -28(%rbp) # v_size

    leaq    .p_size_operation(%rip), %rdi
    leaq    .value(%rip), %rsi
    call    get

    movq    %rax, -24(%rbp) # o_size

    movl    -28(%rbp), %eax
    addl    -24(%rbp), %eax
    cltq

    movq    $4, %rsi
    movq    %rax, %rdi
    call    calloc
    movq    %rax, -4(%rbp)

    leaq    .p_value(%rip), %rbx
    call    print

    movl    $0, -20(%rbp) # i
.L0:
    leaq    .value(%rip), %rax
    call    scan

    movq    %rax, %r8

    movl    -20(%rbp), %eax
    cltq
    leaq    0(,%rax,4), %rdx
    movq    -4(%rbp), %rax
    addq    %rdx, %rax
    movq    %r8, (%rax)

    addl    $1, -20(%rbp)
    movl    -28(%rbp), %eax
    cmpl    %eax, -20(%rbp)
    jl      .L0

    leaq    .p_operation(%rip), %rbx
    call    print

    leaq    .p_space(%rip), %rax
    call    scan

    movl    $0, -20(%rbp) # i
.L1:
    leaq    .p_space(%rip), %rax
    call    scan

    leaq    .value_c(%rip), %rax
    call    scan

    movq    %rax, %r8

    movl    -20(%rbp), %eax
    cltq
    leaq    0(,%rax,4), %rdx
    movl    -28(%rbp), %eax
    imull   $4, %eax
    cltq
    addq    %rax, %rdx
    movq    -4(%rbp), %rax
    addq    %rdx, %rax
    movq    %r8, (%rax)

    addl    $1, -20(%rbp)
    movl    -24(%rbp), %eax
    cmpl    %eax, -20(%rbp)
    jl      .L1

    movl    $0, -20(%rbp) # i
.L2:
    movl    $1, -16(%rbp) # j
    movl    $0, -12(%rbp) # result

    movq    -4(%rbp), %rax
    movl    (%rax), %eax
    movl    %eax, -12(%rbp)

    .L3:
        movl    -16(%rbp), %eax
        cltq
        leaq    0(,%rax,4), %rdx
        movq    -4(%rbp), %rax
        addq    %rdx, %rax
        movq    (%rax), %rax
        movl    %eax, %r8d # value

        movl    -20(%rbp), %eax
        cltq
        leaq    0(,%rax,4), %rdx
        movl    -28(%rbp), %eax
        imull   $4, %eax
        cltq
        addq    %rax, %rdx
        movq    -4(%rbp), %rax
        addq    %rdx, %rax
        movq    (%rax), %rax

        cmpl    $43, %eax
        jne     .sub

        .add:
            addl    %r8d, -12(%rbp)

        .sub:
            cmpl    $45, %eax
            jne     .mul

            subl    %r8d, -12(%rbp)

        .mul:
            cmpl    $42, %eax
            jne     .div

            movl    -12(%rbp), %r9d
            imull   %r9d, %r8d
            movl    %r8d, -12(%rbp)

        .div:
            cmpl    $47, %eax
            jne     .end

            movl    %eax,  %r15d

            movl    -12(%rbp), %r9d
            movslq  %r9d, %rax
            cqo
            idivl   %r8d
            movl    %eax, -12(%rbp)

            movl    %r15d, %eax

    .end:
        addl    $1, -16(%rbp)
        movl    -28(%rbp), %eax
        cmpl    %eax, -16(%rbp)
        jl      .L3

    movq    -12(%rbp), %rax
    leaq    .value(%rip), %rbx
    call    print

    leaq    .p_newline(%rip), %rbx
    call    print

    addl    $1, -20(%rbp)
    movl    -24(%rbp), %eax
    cmpl    %eax, -20(%rbp)
    jl      .L2

    leave
    movl    $0, %eax
    ret
