.text #pesudo instruction.
.globl main # call main
Main:
addi $t1 , $0 , 8 # load immediate value ( 8 ) into $t1 (temporary registers)
addi $t2 , $0 , 9 # load immediate value( 9 ) into $t2
add $t3 , $t1 , $t2 # add two numbers into $t 3
jr $ra # return from main ; return address in$ra