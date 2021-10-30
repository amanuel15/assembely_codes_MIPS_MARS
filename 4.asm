.data
	msg: .asciiz "Enter the person's age: "
	msg2: .asciiz "\nThe person with age "
	msg3: .asciiz " is the oldest."
	msg4: .asciiz " is the youngest."
.text
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0
	
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 5
	syscall
	
	move $t2, $v0
	
	
	
	bgt $t0, $t1, first
	bgt $t1, $t2, second
	
	j thirdGreat
	
	
	j Exit
		
		Young: 
	blt $t0, $t1, firstY
	blt $t1, $t2, secondY
	
	j thirdYoung
	
	j Exit
		firstY: 
	blt $t0, $t2, firstYoung
	j thirdYoung
		
		j Exit
		
		secondY: 
	blt $t1, $t2, secondYoung
	j thirdYoung
		
		j Exit			
	first: 
	bgt $t0, $t2, firstGreat
	j thirdGreat
		
		j Exit
	
	second: 
	bgt $t1, $t2 secondGreat
	j thirdGreat	
		j Exit
		
	firstGreat:
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 4
	la $a0, msg3
	syscall
	
		j Young
		
	secondGreat:
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 4
	la $a0, msg3
	syscall
	
		j Young
		
	thirdGreat:
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, msg3
	syscall
	
		j Young
		
	firstYoung:
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 4
	la $a0, msg4
	syscall
	
		j Exit
		
	secondYoung:
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 4
	la $a0, msg4
	syscall
	
		j Exit
		
	thirdYoung:
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, msg4
	syscall
	
		
	Exit:
	li $v0, 10
	syscall 