.global main

main:
    movl $-1, %eax
    movl $0xff, %ebx
    notl %ebx
    andl %ebx, %eax
    ret
