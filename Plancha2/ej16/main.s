.data
a: .word -1
b: .byte 0xaa, 99
c: .float 1.5
str: .asciz "Hola mundo\n"
.text
.global main
main:
leaq a, %rdx
movw  a , %ax       # ax = 0xffff

movb (b+1), %al      # al = 0x63
movl str, %esi      # esi = "Hola"
movl c , %edi # edi = 0x3fc00000
movl %esi, (%rdx)
retq

