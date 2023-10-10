.global main

# 5 << 8
main:
    movl $5 , %eax
    sall $8, %eax
    ret
