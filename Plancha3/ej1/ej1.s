.global convert

convert:
    pushq %rbp
    movq %rsp, %rbp
    movq $0x3FF8000000000000, %rax #1.5
    movq %rax, -0x8(%rbp)
    movsd -0x8(%rbp), %xmm3
    mulsd %xmm3, %xmm0
    cvtsi2sd %edi , %xmm2 
    addsd %xmm2 , %xmm0
    movq %rbp, %rsp
    popq %rbp
    ret
