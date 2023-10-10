.global fact2
fact2:
    pushq %rbp
    movq %rsp, %rbp

    xorq %rax, %rax
    incq %rax
    movq %rdi, %rcx
    decq %rcx
for:
    mulq %rdi
    decq %rdi
    loop for

fin:
    movq %rbp, %rsp
    popq %rbp
    ret

