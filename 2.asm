.data
	msg: .asciiz "Enter the quantity: "
	msg2: .asciiz "Discount unavailable. Price = "
	msg3: .asciiz "20% discount available. Price = "
.text
	addi $t1, $zero, 1000
	addi $t2, $zero, 100
	addi $t3, $zero, 20

	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	mul $t4, $t0, $t2
	
	bgt $t4, $t1, discount
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	move $a0, $t4
	syscall
	
	j Exit
	
	discount:
	mul $t5, $t4, $t3
	div $t5, $t5, $t2
	sub $t4, $t4, $t5
	
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 1
	move $a0, $t4
	syscall
	
	Exit: 
	li $v0, 10
	syscall 
	 

	
	