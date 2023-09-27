.global main

   # 0xaa | (0xaa << 24)
main:
   movl $0xaa, %eax 
   sall $24 ,%eax
   orl $0xaa, %eax 
   ret
   
