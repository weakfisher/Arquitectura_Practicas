.text 
.global main

main:
    movq $0xffffffff00000000 , %rax
    xor %rbx, %rbx 
    movq $64, %rcx
    xor %rdx, %rdx
loosp:
    rolq $1, %rax 
    adc %rbx, %rdx
    loop loosp
fin:
ret
