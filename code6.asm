.data
msg1: .asciiz "Enter the first number\n"
msg2 : .asciiz "Enter the second number\n"
msg : .asciiz "The product is"
.text
.globl main
.globl my_mul
main :
addi $sp , $sp , -8 #make room f o r $ r a and $ f p on t h e s t a c k
sw $ra , 4($sp)# push $ra
sw $fp , 0 ($sp)# push $fp
la $a0 ,msg1 #load address o f msg1 into $a0
li $v0 ,4
syscall # print msg1
li $v0 ,5
syscall #read int
add $t0, $v0 , $0 # put in $t0
la $a0 , msg2 # load address o f msg2 into $a0
li $v0 , 4
syscall# print msg2
li $v0 , 5
syscall#read int
add $a1 , $v0 , $0 # put in $a1
add $a0 , $t0 , $0 # put first number i n $a0
add $fp , $sp , $0 # set fp to top of stack prior to function call
jal my_mul # do mul , result is in $v0
add $t0 , $v0 , $0 # save the result in $t0
la $a0 , msg
li $v0 , 4
syscall # print msg
add $a0 , $t0 , $0 # put computation result in $a0
li $v0 , 1
syscall # print result number
lw $fp ,0($sp) # restore ( pop ) $ f p
lw $ra ,4($sp) # restore ( pop ) $ r a
addi $sp , $sp , 8 # adjust $sp
j exit
#jr $ra #return
my_mul: addi $sp , $sp , -4 #make room f o r $ s 0 on t h e s t a c k
sw $s0 , 0 ($sp) # push $s0
#add $s0 , $a1 , $0 # set $s0 equal to $a1
add $v0 , $0 , $0 # set $v0 to 0 used as a register to store Result
li $s1 , 31 #counter for shifting
li $s2, 1 #to extract bit
mult_loop :
beq $s1, 0, mulexit
and $t0, $a1, $s2
sll $s2, $s2,1
exit: