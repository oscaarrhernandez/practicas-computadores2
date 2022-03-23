	.area PROG (ABS)

; Constantes       
pantalla .equ 0xFF00
fin      .equ 0xFF01
teclado	 .equ 0xFF02

	.org 0x100

; Variables
num:	.word  0

	.globl programa
programa:
	; Leemos un numero entre '0' y '50000'
	ldb teclado
	subb #'0
	
	lda #50
	mul
	
	lda #200
	mul
	
	std num
	
	ldb teclado
	subb #'0
	
	lda #50
	mul
	
	lda #20
	mul
	
	addd num
	std num
	
	ldb teclado
	subb #'0
	
	lda #100
	mul
	
	addd num
	std num
	
	ldb teclado
	subb #'0
	
	lda #10
	mul
	
	addd num
	std num
	
	ldb teclado
	subb #'0
	
	addd num
	std num

	; Limpiamos el contenido de 'a' y 'b'
	clra
	clrb
