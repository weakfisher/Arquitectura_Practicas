.global solve
#Regla de cramer para resolver sistemas de ecuaciones
solve:

    # Epilogo

    pushq %rbp
    movq %rsp, %rbp

    # Guardamos los argumentos en pila

    movss %xmm0, -0x4(%rbp) # a
    movss %xmm1, -0x8(%rbp) # b
    movss %xmm2, -0xc(%rbp) # c
    movss %xmm3, -0x10(%rbp) # d
    movss %xmm4, -0x14(%rbp) # e
    movss %xmm5, -0x18(%rbp) # f


    # Calculamos el determinante
    
    mulss %xmm0, %xmm4 #a * e

    mulss %xmm1, %xmm3 #b * d

    subss %xmm3, %xmm4 # (a * e) - (b * d) <- xmm4

    movss %xmm4, %xmm14 # xmm14 <- det(A)

    #det == 0? no -> no solucion, si-> continuar
    xorps %xmm15, %xmm15
    ucomiss %xmm15, %xmm14
    jz noSolution

    # Recuperamos datos
    movss -0x10(%rbp), %xmm3
    movss -0x14(%rbp), %xmm4
    
    # x = det(A|fila y) / det(A)
    # det(A|fila y) = (a * f) - (c * b)
    mulss %xmm0, %xmm5 # a * f
    mulss %xmm2, %xmm3 # c * d
    subss %xmm3, %xmm5 # (a * f) - (b * c) <- xmm5
    divss %xmm14, %xmm5 # det(A|fila y) / det(A) <- X
    
    # Guardamos y
    movss %xmm5, %xmm13
    movss %xmm13, -0x20(%rbp)

    # Recuperamos datos
    movss -0x18(%rbp), %xmm5
    movss -0x10(%rbp), %xmm3

    # x =  det(A|fila x) / det(A)
    # det(A|fila x) = (b * f) - (c * e)
    mulss %xmm1, %xmm5 # b * f
    mulss %xmm2, %xmm4 # c * e
    subss %xmm5, %xmm4
    divss %xmm14, %xmm4


    # Guardamos x
    movss %xmm4, %xmm12
    movss %xmm12, -0x1c(%rbp)

    # Guardamos en los punteros

    movl -0x1c(%rbp), %r14d
    movl %r14d, (%edi)

    movl -0x20(%rbp), %r14d
    movl %r14d, (%esi)
    
    xorq %rax, %rax
    jmp fin
    
noSolution:
    movl $-1 , %eax

fin:
    movq %rbp, %rsp
    popq %rbp
    ret
