.data msg1: .asciiz "A 17 byte message"
msg2: .asciiz "Another message of 27 bytes"
num1: .byte 45
num2: .half 654
num3: .word 0xcafebabe
num4 : .word 0xfeedface
.text
.globl main
main :
addu $s0 , $ra , $0 # save the return address
li $v0 , 4 # system call f o r print s t r
la $a0 , msg1 # address of String to print
syscall
la $a0 , msg2 # address of string to print
syscall
lb $t0 , num1 # load num1 into $t 0
lh $t1 , num2 # l o a d num2 into $t 1
lw $t2 , num3 # l o a d num3 into $t 2
lw $t3 , num4 # l o a d num4 into $t 3
#addu $ra , $s0 , $0 # restore the return address
#jr $ra # r e t u r n f rom main Since we are not using JAL instruction we need not jump back to main function.