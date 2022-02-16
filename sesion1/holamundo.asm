
	.area PROG(ABS)
	.org 0x100

cadena: .ascii"Hola, mundo."
				.byte 10
				.byte 0

	.globl programa
	
programa:
				ldx #cadena
bucle:	lda ,x+
				beq acabar
				sta 0xFF00
				bra bucle
acabar:	clra
				sta 0xFF01
				
				.org 0xFFFE
				.word programa
