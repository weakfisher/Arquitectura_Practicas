.data
list: .long 10, 20, 30, 40, 50, 60, 70, 80, 90, 100
length: .long 10
.text
.global main

main:
leal list, %esi

movl $0,%eax
movl $0, %edi #sumatotal
movl $0, %ecx #contador
suma:
cmpl %ecx , length
je seguir

lodsl
addl %eax, %edi 
addl $1, %ecx
jmp suma
seguir:
movl %edi , %eax
ret

