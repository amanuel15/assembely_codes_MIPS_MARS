.data
	msg: .asciiz "Enter a number: "
	msg2: .asciiz "The number of one's in binary representation "
	msg3: .asciiz " is "
.text
	addi $t1, $zero, 2
	addi $t2, $zero, 1
	addi $t3, $zero, 0
	
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	add $t4, $zero, $t0
	
	j divide

	j Exit
	
	divide:
	div $t0, $t1
	mflo $s0
	mfhi $s1
	
	add $t0, $zero, $s0
	bgt $s1, $zero, Rone
	
	j Qzero
	
	Rone:
	add $t3, $t3, $t2
	j divide
	
	Qzero:
	beq $t0, $zero, Exit
	j divide
	
	Exit:
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	move $a0, $t4
	syscall
	
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 1
	move $a0, $t3
	syscall
	
	li $v0, 10
	syscall