.global fact1
fact1:
    pushq %rbp
    movq %rsp, %rbp

    cmpq $0x1, %rdi
    jg calc
    movq %rbp, %rsp
    popq %rbp
    movq %rdi, %rax
    ret

calc:
    decq %rdi
    call fact1
    incq %rdi
    mulq %rdi

    movq %rbp, %rsp
    popq %rbp

    ret

