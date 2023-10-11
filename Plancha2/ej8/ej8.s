.data
format: .asciz "%ld\n"
formatEx: .asciz "%x\n"
i: .quad 0xDEADBEEF

.text
.global main

main:
    movq $format, %rdi
    movq $1234, %rsi
    xorq %rax, %rax
    call printf

    #a
    leaq format, %rdi
    movq %rsp, %rsi
    xorq %rax, %rax
    call printf

    #b
    leaq format, %rdi
    leaq format, %rsi
    xorq %rax, %rax
    call printf

    #c
    leaq formatEx, %rdi
    leaq format, %rsi
    xorq %rax, %rax
    call printf

    #d
    leaq format, %rdi
    movq %rsp, %rsi
    xorq %rax, %rax
    call printf

    #e
    leaq format, %rdi
    movq 8(%rsp), %rsi
    xorq %rax, %rax
    call printf

    #f
    leaq formatEx, %rdi
    movq i, %rsi
    xorq %rax, %rax
    call printf

    #g
    leaq formatEx, %rdi
    leaq i, %rsi
    xorq %rax, %rax
    call printf

    ret
