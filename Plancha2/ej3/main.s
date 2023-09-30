.global main
.data
n1 : .byte 100
n2 : .byte 120
n3 : .byte -63
n4 : .byte -54
n5 : .byte -91
s1 : .byte 0
s2 : .byte 0 
s3 : .byte 0
s4 : .byte 0
s5 : .byte 0
.text
main:
#n1 + n2
    movb n1 , %al
    movb n2, %bl
    addb %bl, %al 
    movb %al, s1
    #of
#n3 + n4
    movb n3, %cl 
    movb n4, %dl
    addb %cl,%dl
    movb %dl , s2    
#n5 + n3
    movb n5, %bl
    addb %cl , %bl   
    movb %bl, s3
#cf of

#n2 - n4
    movb n2 , %cl
    movb n4 , %al
    subb %cl , %al   
    movb %cl , s4
#of
#n5 - n2
    movb n2, %cl
    movb n5, %al
    subb %al , %cl
    movb %al , s5
    #cf of
    

    ret


