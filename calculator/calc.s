    .section .note.GNU-stack,"",@progbits

    .text
    .section    .rodata
.T0:
    .string "enter two numbers: "
.T1:
    .string "operation (+, -, *, /, q): "
.T2:
    .string "%d"
.T3:
    .string " %c"
.T4:
    .string "result: %d\n"

    .text
    .globl  main
    .type   main, @function

print:
    movq    %rax, %rsi
    movq    %rbx, %rdi
    movl    $0, %eax
    call    printf
    ret

main:
    pushq   %rbp
    movq    %rsp, %rbp

    subq    $32, %rsp

.Lstart:
    // print: T0
    leaq    .T0(%rip), %rax
    movq    %rax, %rdi
    movl    $0, %eax
    call    printf

    // inputs: a
    movl    $0, -28(%rbp)
    leaq    -28(%rbp), %rax
    movq    %rax, %rsi
    leaq    .T2(%rip), %rax
    movq    %rax, %rdi
    movl    $0, %eax
    call    scanf

    // inputs: b
    movl    $0, -24(%rbp)
    leaq    -24(%rbp), %rax
    movq    %rax, %rsi
    leaq    .T2(%rip), %rax
    movq    %rax, %rdi
    movl    $0, %eax
    call    scanf

    // print: T1
    leaq    .T1(%rip), %rax
    movq    %rax, %rdi
    movl    $0, %eax
    call    printf

    // inputs: op
    movq    $0, -20(%rbp)
    leaq    -20(%rbp), %rax
    movq    %rax, %rsi
    leaq    .T3(%rip), %rax
    movq    %rax, %rdi
    movl    $0, %eax
    call    scanf

    movl    -20(%rbp), %r8d
    cmpl    $113, %r8d
    je      .Lend

    movl    $0, -16(%rbp)

    // add

    movl    -20(%rbp), %r8d
    cmpl    $43, %r8d
    jne     .L0

    movl    -28(%rbp), %r8d
    movl    -24(%rbp), %r9d
    addl    %r9d, %r8d
    movl    %r8d, -16(%rbp)

.L0:
    movl    -20(%rbp), %r8d
    cmpl    $45, %r8d
    jne     .L1

    // sub

    movl    -28(%rbp), %r8d
    movl    -24(%rbp), %r9d
    subl    %r9d, %r8d
    movl    %r8d, -16(%rbp)

.L1:
    movl    -20(%rbp), %r8d
    cmpl    $42, %r8d
    jne     .L2

    // mul

    movl    -28(%rbp), %r8d
    movl    -24(%rbp), %r9d
    imull   %r9d, %r8d
    movl    %r8d, -16(%rbp)
.L2:

    movl    -20(%rbp), %r8d
    cmpl    $47, %r8d
    jne     .L3

    // div

    movl    -28(%rbp), %r8d
    movl    -24(%rbp), %r9d

    movslq  %r8d, %rax
    cqo
    idivl   %r9d
    movq    %rax, %r8
    movq    %r8, -16(%rbp)

.L3:
    movq    -16(%rbp), %rax
    leaq    .T4(%rip), %rbx
    call    print

    jmp     .Lstart

.Lend:
    addq    $32, %rsp

    movl    $0, %eax
    popq    %rbp
    ret
