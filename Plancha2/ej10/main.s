
.text
.global main

main:
    movq $0xffffffff00000000 , %rax
    movq $32, %rcx# contador
    
loosp:
    rolq  $1,%rax 
    loop loosp

fin:
ret
