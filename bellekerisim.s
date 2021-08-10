.data 
ar: 	.word -16, 23, 67, 89, 89,-90, 32, 76
	.word -16, 23, 67, 89, 89,-90, 32, 76
	.word -16, 23, 67, 89, 89,-90, 32, 76
	.word -16, 23, 67, 89, 89,-90, 32, 76
	.word -16, 23, 67, 89, 89,-90, 32, 76
	.word -16, 23, 67, 89, 89,-90, 32, 76
	.word -16, 23, 67, 89, 89,-90, 32, 76
	.word -16, 23, 67, 89, 89,-90, 32, 76
satirs:	.word  4
sutuns:	.word  16

sutun:	.word	12


# dizinin sutunu sýfýrlama

.text
.globl main


main:	la $s0, ar
	la $s1, satirs
	lw $s1, 0($s1)
	la $s2, sutuns
	lw $s2, 0($s2)
	la $s3, sutun
	lw $s3, 0($s3)	
	li $s4, 0		# indeks i=0
geri:	sll $t3, $s3, 2 	#  $s3 = 4x$s3
	add $s5, $s0, $t3       #  erisilecek dizi elemanýnýn adresi
	sw $0, 0($s5)		#  ar[i][sutun] = 0
	add $s3, $s3, $s2	# sonraki erisilecek dizi elemaný 
	addi $s4, $s4, 1	# i=i+1
	blt $s4, $s1, geri
	li $v0, 10
	syscall 
