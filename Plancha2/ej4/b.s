.global main

main:
    movl $1, %eax
    movl $1, %ebx
    sall $31, %eax
    sall $15, %ebx
    orl %ebx, %eax # Resultado en %eax
    ret
