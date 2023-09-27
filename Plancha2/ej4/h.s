.global main 
#0x80000000 + -0x80000000
main:
    movl $0x80000000 , %eax
    movl $-0x80000000, %ebx 
    addl %ebx , %eax 
    ret

#¿Es necesario usar GDB en este caso?
# Si es necesario por que el comando echo solo muestra los ultimos ocho bits del retorno
# ¿Podr´ıa utilizarse el c´odigo de salida como en los
#ejercicios anteriores?
# no

