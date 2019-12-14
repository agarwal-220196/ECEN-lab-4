.data
msg1: .asciiz "Enter the first number\n"
msg2 : .asciiz "Enter the second number\n"
msg : .asciiz "The product is"
.text
.globl main
.globl my_mul
main :
addi $sp , $sp , -8 #make room f o r $ r a and $ f p on t h e s t a c k
sw $ra , 4($sp) # push $ra
sw $fp , 0 ($sp) # push $fp
la $a0 ,msg1 # load address of msg1 into $a0
li $v0 ,4
syscall # print msg1
li $v0 ,5
syscall #read int
add $t0, $v0 , $0 # put in $t0
la $a0 , msg2 # load address of msg2 into $a0
li $v0 , 4
syscall # print msg2
li $v0 , 5
syscall #read int
add $a1 , $v0 , $0 #put in $a1
add $a0 , $t0 , $0 # put first number in $a0
add $fp , $sp , $0 # set fp to top of tack prior to function call
jal my_mul # do mul , result is in $v0
add $t0 , $v0 , $0 # save the result in $t0
la $a0 , msg
li $v0 , 4
syscall # print msg
add $a0 , $t0 , $0 # put computation result in $a0
li $v0 , 1
syscall #print result number
lw $fp ,0($sp) #restore ( pop ) $ f p
lw $ra ,4($sp) # restore ( pop ) $ r a
addi $sp , $sp , 8 # adjust $sp
j exit
#jr $ra #return #not required as no JAL after it was restored by lw $ra ,4($sp)
my_mul: addi $sp , $sp , -4#make room f o r $ s 0 on t h e s t a c k
sw $s0 , 0 ($sp)# push $s0
add $s0 , $a1 , $0# s e t $ s 0 e q u a l t o $a1
add $v0 , $0 , $0 # s e t $v0 t o 0
mult_loop :
beq $s0 , $0 , mult_eol
add $v0 , $v0 , $a0
addi $s0 , $s0 , -1
j mult_loop
mult_eol :
lw $s0 , 0($sp) # pop $ s 0
jr $ra
exit:
