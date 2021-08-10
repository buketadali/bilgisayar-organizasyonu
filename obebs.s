#Buket ADALI 170401014 
#int gcd(long x, long y) 
#{
#	if (x == 0) {
#  		return y;
#  	}
# 	while (y != 0) {
#    	   if (x > y) {
#      		x = x - y;
#          }
#    	   else {
#      		y = y - x;
#    	   }
#  	}
#  	return x;
#}


.data
mesaj0:	.asciiz "**** Iki Pozitif Sayinin En Buyuk Ortak Bolenini Bulma ****\n"
mesaj1: .asciiz "Birinci Pozitif Sayiyi Giriniz (x)  : "
mesaj2: .asciiz "Ikinci Pozitif Sayiyi Giriniz  (y)  : "
mesaj3:	.asciiz "gcd(x,y)			      : "
mesaj4:	.asciiz "Devam Etmek Istermisiniz Evet(e)/Hayir(h): "
mesaj5:	.asciiz "Program Sonlanmistir ...\n"
newline: .asciiz "\n" 

x:	.word	0
y:	.word	0
sonuc:	.word	0

.text
.globl main
main:
	li $2, 4
	la $4, mesaj0                 
	syscall
	
	la $4, mesaj1
	syscall				

	li $2, 5
	syscall
	sw $2, x			
	lw $4, x
	move $8, $4		
	

	li $2, 4
	la $4, mesaj2			
	syscall
	
	li $2, 5
	syscall
	sw $2, y			
	lw $4, y
	move $9, $4
	

	li $2, 4
	la $4, mesaj3			
	syscall

	
	jal gcd 			
	sw $2, sonuc
	lw $4, sonuc			
	move $21, $4			
	
	li $2, 1
	syscall				

        li $2, 4
	la $4, newline			# bir satır atlat
	syscall
	

	li $2, 4
	la $4, mesaj4			
	syscall
	
	li $2, 12
	syscall				#klavyeden e ya da h
	move $10, $2

        li $2, 4
	la $4, newline			# bir satır atlat
	syscall


	addi $16, $zero, 101  		#e harfinin decimal değeri(101)
	addi $17, $zero, 104		#h harfinin decimal değeri(104)

mainloop: 
	beq $10, $17, finish		#h girildiyse çık e ise devam 
	li $2, 4
	la $4, mesaj1
	syscall

	li $2, 5
	syscall
	sw $2, x
	lw $4, x
	move $8, $4

	li $2, 4
	la $4, mesaj2
	syscall
	
	li $2, 5
	syscall
	sw $2, y			
	lw $4, y
	move $9, $4


	li $2, 4
	la $4, mesaj3
	syscall

	
	jal gcd 			
	sw $2, sonuc
	lw $4, sonuc			
	move $21, $4
	
	li $2, 1
	syscall

        li $2, 4
	la $4, newline
	syscall

	li $2, 4
	la $4, mesaj4
	syscall
	
	li $2, 12
	syscall
	move $10, $2

	li $2, 4
	la $4, newline
	syscall

	j mainloop			
	


finish: li $2, 4
	la $4, mesaj5 			
	syscall
	
	
	li $2, 10
	syscall				

gcd:    add $sp, $sp, -4
	sw $8, 0($sp)			# x, y ve sonuç değerlerini sp ekledim. 
	sw $9, 4($sp)
	sw $ra, 8($sp)

	bnez $8, while		
	move $2, $t1                 # y i döndür
	jr $ra
	
while:	beqz $9, return
	bgt $8, $9, else		
	sub $9, $9, $8
	j while

else:   sub $8, $8, $9			
	beqz $9, return			
	j while
		
	

return:	move $2, $8			#x i döndür
	jr $ra
