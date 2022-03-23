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
	lda #20
	mul
	lda #50
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

	; Comprobamos el bit del numero introducido
	bitb #0x02		; #0b00000010

	bne false

	; Limpiamos el contenido de 'a' y 'b'
	clra
	clrb

bucle:
	; Movemos el contenido de 'd' a 'x'
	tfr d,x
	mul
	; Comparamos el numero introducido
	cmpd num

	beq true
	bhi false

	tfr x,d
	inca
	incb
	bra bucle

true:
	ldb #'\n
        stb pantalla
	lda #'S
	sta pantalla
	lda #'I
	sta pantalla
	ldb #'\n
        stb pantalla
	bra acabar

false:
	ldb #'\n
        stb pantalla
	lda #'N
	sta pantalla
	lda #'O
	sta pantalla
	ldb #'\n
        stb pantalla


acabar:
	clra
	sta fin

	.org 0xFFEE		; Vector de RESET
	.word programa
