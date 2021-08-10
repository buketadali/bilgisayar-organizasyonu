.data
mesaj1: .asciiz "Bir Pozitif  Tamsayi Girin (n): "
mesaj2: .asciiz "Factorial n                   : "



.text
.globl main
main:
	# Print mesaj1
	li $v0, 4
	la $a0, mesaj1
	syscall

	# Read integer
	li $v0, 5
	syscall

	# Call factorial
	move $a0, $v0
	jal factorial
	move $a1, $v0 # save return value to $a1


	# Print mesaj2
	li $v0, 4
	la $a0, mesaj2
	syscall

	# Print result
	li $v0, 1
	move $a0, $a1
	syscall

	# Exit
	li $v0, 10
	syscall




factorial:
	addi $sp, $sp, -8
	sw $ra, 4($sp)
	sw $s0, 0($sp)
	move $s0, $a0
	
	li $v0, 1 
	ble $s0, 0x1, factexit
	addi $a0, $s0, -1
	jal factorial

	multu $v0,$s0
	mflo $v0

factexit:
	lw $ra, 4($sp)
	lw $s0, 0($sp)
	addi $sp, $sp, 8
	jr $ra


