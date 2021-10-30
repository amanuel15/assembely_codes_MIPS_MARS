.data
	msg: .asciiz "Enter an integer: "
	ans: .asciiz "\nHexadecimal equivalent: "
	result: .space 8
.text
.globl main

main:
	la $a0, msg
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $t2, $v0
	
	la $a0, ans
	li $v0, 4
	syscall
	
	li $t0, 8
	la $t3, result
	
Loop: 
	beqz $t0, Exit
	rol $t2, $t2, 4
	and $t4, $t2, 0xf
	ble $t4, 9, Sum
	addi $t4, $t4, 55
	
	b End
	
	Sum: 
		addi $t4, $t4, 48
	End: 
		sb $t4, 0($t3)
		addi $t3, $t3, 1
		addi $t0, $t0, -1
	j Loop
	
	Exit: 
		la $a0, result
		li $v0, 4
		syscall
		
		la $v0, 10
		syscall