.global main



 main:
    movl $-1,%eax 
    movl $2, %ecx
    imull %ecx
    cltq 
    xorq %rax,%rax 
    movw $-1,%ax
    movw $2, %cx
    mulw %cx
    
    movzwl %ax, %eax
    ret

 

