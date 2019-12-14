.data
hextable : .ascii "0123456789abcdef"
msg1: .asciiz "Your number in Hex is:"
.text
.globl main
main:
addu $s0 , $0 , $ra # save the r e t u r n address
li $v0 , 5 # syscall for read int
syscall
add $s1 , $v0 , $0
li $v0 , 4 # syscall for print str
la $a0 , msg1
syscall
la $a1 , hextable
srl $t0 , $s1 , 4 # get upper 4 bits
add $a2 , $a1 , $t0 # get address in hextable
lb $a0 , 0($a2) # get character
li $v0 , 11 # syscall for print char
syscall
andi $t0 , $s1 , 0xf # get lower 4 b i t s
add $a2 , $a1 , $t0 # get address in hextable
lb $a0 , 0($a2)# get character
li $v0 , 11 # syscall for p r i n t s t r
syscall
#addu $ra , $s0 , $0
#jr $ra # return from main since no JAL is call, returning Ra is not required.