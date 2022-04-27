
	.area PROG (ABS)
	
; Constantes
fin	 .equ 0xFF01
pantalla .equ 0xFF00
teclado  .equ 0xFF02

	.org 0x100

programa:
	ldb #9			

bucle:
	tfr b,a 		
	adda #'0		
	sta pantalla			
	decb 			
	bpl bucle		

	; Salto de linea
	ldb #'\n
	stb pantalla
	
	; Fin del programa
	clra
	sta fin

	.org 0xFFFE
	.word programa
