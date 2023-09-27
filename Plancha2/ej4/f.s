.global main
#-1 & (~(1 << 8)))
main:
    movl $-1, %eax
    movl $1 , %ebx
    sall $8 , %ebx
    notl %ebx 
    andl %ebx, %eax
    ret

