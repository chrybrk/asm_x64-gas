    .section    .note.GNU-stack,"",@progbits

    .text
    .section    .rodata
.T0:
    .string "%d"
.T1:
    .string "add: %d\n"
.T2:
    .string "sub: %d\n"

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

    subq    $16, %rsp

    // inputs: a
    movl    $0, -12(%rbp)
    leaq    -12(%rbp), %rax
    movq    %rax, %rsi
    leaq    .T0(%rip), %rax
    movq    %rax, %rdi
    movl    $0, %eax
    call    scanf

    // inputs: b
    movl    $0, -8(%rbp)
    leaq    -8(%rbp), %rax
    movq    %rax, %rsi
    leaq    .T0(%rip), %rax
    movq    %rax, %rdi
    movl    $0, %eax
    call    scanf

    // add
    movl    -12(%rbp), %r8d
    movl    -8(%rbp), %r9d
    addl    %r9d, %r8d
    movl    %r8d, -4(%rbp)

    movq    -4(%rbp), %rax
    leaq    .T1(%rip), %rbx
    call    print

    // sub
    movl    -12(%rbp), %r8d
    movl    -8(%rbp), %r9d
    subl    %r9d, %r8d
    movl    %r8d, -4(%rbp)

    movq    -4(%rbp), %rax
    leaq    .T2(%rip), %rbx
    call    print

    addq    $16, %rsp

    movl	$0, %eax
    popq	%rbp
    ret
