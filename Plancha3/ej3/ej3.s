
.global sum

sum:

    pushq %rbp
    movq %rsp, %rbp

    movq %rdx, %rcx
    xorq %rbx, %rbx

sumar:

    movl (%rdi), %eax
    movl %eax, -0x4(%rbp)
    movss -0x4(%rbp), %xmm0

    movl (%rsi, %rbx, 4), %eax
    movl %eax, -0x4(%rbp)
    movss -0x4(%rbp), %xmm1

    addss %xmm1, %xmm0

    movss %xmm0, -0x4(%rbp)
    movl -0x4(%rbp), %r15d
    movl %r15d, (%rdi)
    lea 4(%rdi), %rdi
    incq %rbx

    loop sumar

    movq %rbp, %rsp
    popq %rbp
    ret

