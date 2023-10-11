.data
strLista: .asciz "Lista: "
format: .asciz "%c "
list: .byte 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
listInvertida: .byte 0
length: .byte 10

.text
.global main

main:
    pushq %rbp
    movq %rsp, %rbp
    xorq %rcx, %rcx
    movb length, %cl
    xorq %rbx, %rbx # contador "i"


pushear:
    lea list, %rdx
    xorq %rsi, %rsi
    movb (%rdx, %rbx, 1), %sil
    pushq %rsi
    incq %rbx
    loop pushear

intermedio:
    xorq %rbx, %rbx
    xorq %rcx, %rcx
    movb length, %cl

popear:
    lea listInvertida, %rdx
    xorq %rsi, %rsi
    popq %rsi
    movb %sil, (%rdx, %rbx, 1)
    incq %rbx
    loop popear

intermedioDos:

    xorq %rbx, %rbx
    xorq %rcx, %rcx
    movb length, %cl

mostrarLista:

    lea format, %rdi
    lea list, %rdx
    movq (%rdx, %rbx, 1), %rsi
    xorq %rax, %rax
    call printf
    incq %rbx
    loop mostrarLista

fin:
    movq %rbp, %rsp
    popq %rbp
    xorq %rax, %rax
    ret


