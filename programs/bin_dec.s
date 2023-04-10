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

// %rdi, first arg  = base
// %rsi, second arg = exponent

power:
    movq    %rdi, %r8
    movq    %rsi, %r9

    pushq   %rbp
    movq    %rsp, %rbp

    subq    $16, %rsp

    movl    $1, -8(%rbp) # value
    movl    $0, -12(%rbp) # i
.Lpower0:
    cmpl    %r9d, -12(%rbp)
    jge     .Lend

    movl    -8(%rbp), %eax
    imull   %r8d, %eax
    movl    %eax, -8(%rbp)

    addl    $1, -12(%rbp)
    jmp     .Lpower0

.Lend:
    movq    -8(%rbp), %rax
    leave
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

    movl    $0, -20(%rbp)
    movl    $0, -24(%rbp) # i
.L1:
    movq    $2, %rdi
    movq    -28(%rbp), %rax
    subq    -24(%rbp), %rax
    subq    $1, %rax
    movq    %rax, %rsi
    call    power
    movq    %rax, %r8    # power

    movl    -24(%rbp), %eax
    cltq
    leaq    0(,%rax,4), %rdx
    movq    -4(%rbp), %rax
    addq    %rdx, %rax
    movq    (%rax), %rax

    imulq   %r8, %rax
    addq    %rax, -20(%rbp)

    addl    $1, -24(%rbp)
    movl    -28(%rbp), %eax
    cmpl    %eax, -24(%rbp)
    jl      .L1

    movq    -20(%rbp), %rax
    leaq    .value(%rip), %rbx
    call    print

    leaq    .p_newline(%rip), %rbx
    call    print

    leave
    movl    $0, %eax
    ret
