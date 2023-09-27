.data
i: .quad 10

.text
.global main
main:
    movq $0, %rax
    jmp while_1

while_1:
    cmpq $0, i
    je fin_1

cuerpo_while:

    incq %rax

    decq i
    jmp while_1

fin_1:

    ret
