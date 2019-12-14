.data
msg1: .asciiz "Please enter an integer number :"
msg2: .asciiz "\t First result :"
msg3: .asciiz "\t Second result :"
.text
.globl main
main :
addu $s0 , $ra , $0 # s a v e $31 i n $16
li $v0 , 4 # system call for print string
la $a0 , msg1 # address of string to print
syscall
# now get an integer from the user
li $v0 , 5 # system call for read int
syscall # the integer placed in $v0
#doing logical computation(left shift and right shift)
addu $t0 , $v0 , $0 # move t h e number i n $v0 t o $t 0
sll $t1 , $t0 , 2 # computation 1 , result is in $t 1 rotate left
srl $t2 , $t0 , 2 # computation 2 , result is in $t 2 rotate right
# print the first result
li $v0 , 4 # system call for print str
la $a0 , msg2 # address of string to print
syscall
li $v0 , 1 # system call for print into
addu $a0 , $t1 , $0 # move number to print in $a0
syscall
# print the second result
li $v0 , 4 # system call for print str
la $a0 , msg3 # address of string to print
syscall
li $v0 , 1 # system call for print int
addu $a0 , $t2 , $0 # move number to print in $a0
syscall
addu $ra , $0 , $s0 # return address back in $31
#jr $ra # r e t u r n from main Since No jump was taken, return is not required.