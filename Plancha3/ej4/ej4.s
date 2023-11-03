
.global sum_simd

sum_simd:

    pushq %rbp
    movq %rsp, %rbp

    movq %rdx, %rcx
    xorq %rbx, %rbx

sumar:
    cmpq $4 , %rcx 
    jl escalares
    
    movaps (%rdi), %xmm0
    movaps (%rsi), %xmm1
    
    addps %xmm0, %xmm1

    movaps %xmm1, (%rdi)
    addq $16, %rdi
    addq $16, %rsi

    subq $4, %rcx
    jmp sumar    
escalares:

    cmpq $0 , %rcx
    je fin
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

fin:

    movq %rbp, %rsp
    popq %rbp
    ret

