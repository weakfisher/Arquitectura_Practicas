.global fact1p

fact1p:
    cmpq $0x01 , %rdi 
    jg calq
    
    movq %rdi, %rax 
    ret 
calq:
    decq %rdi 
    call fact1p
    incq %rdi 
    mulq %rdi 

    ret
