.data
list: .long 10, 20, 30, 40, 50, 60, 70, 80, 110, 100
length: .byte 10
sumaStr: .asciz "Suma total: %d\nMax: %d\nMin: %d\nPromedio: %d\n"

.text
.global main

main:

    pushq %rbp
    movq %rsp, %rbp
    xorq %rcx, %rcx
    movb length, %cl
    xorq %rbx, %rbx # Iterador
    movl $0x0, -0x4(%rbp) # Suma
    movl list, %eax # Guardamos el primer valor del array en eax
    movl %eax, -0x8(%rbp) # Max (seteado como "list[0]")
    movl %eax, -0xc(%rbp) # Min (seteado como "list[0]")
    movl $0x0, -0x10(%rbp) # Promedio

inicioComparar:

    lea list, %esi
    movl (%esi, %ebx, 4), %edx # edx -> "list[i]"

compararMayor:
    # Si es mayor, cambia el max
    # Si no, salta a compararMenor
    cmpl -0x8(%rbp), %edx
    jle compararMenor
    movl %edx, -0x8(%rbp)

compararMenor:
    # Si es menor, cambia el min
    # Si no, salta a sumar
    cmpl -0xc(%rbp), %edx
    ja sumar
    movl %edx, -0xc(%rbp)

sumar:
    addl %edx, -0x4(%rbp)
    incl %ebx
    loop inicioComparar

promedio:

    # Realizamos la division suma / length
    movl $0x0, %edx
    movl -0x4(%rbp), %eax
    idivb length
    movl %eax, -0x10(%rbp)

fin:

    leaq sumaStr, %rdi
    movq -0x4(%rbp), %rsi
    movq -0x8(%rbp), %rdx
    movq -0xc(%rbp), %rcx
    movq -0x10(%rbp), %r8
    call printf
    popq %rbp
    xorq %rax, %rax
    ret



