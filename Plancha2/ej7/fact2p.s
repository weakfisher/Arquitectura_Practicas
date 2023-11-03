.text
.global fact2p

fact2p:
movq %rdi, %rdx
movq $1, %rax
loop:
    cmpq $1, %rdx
    jbe fin
    imulq %rdx, %rax
    decq %rdx 
    jmp loop 
fin:
    
    ret 
