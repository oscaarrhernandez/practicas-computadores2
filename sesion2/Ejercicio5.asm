.area PROG (ABS)


fin 			.equ 0xFF01
pantalla 	.equ 0xFF00
teclado		.equ 0xFF02

.org 0x100

sumador1:	.word 0x2158
sumador2:	.byte 0x03
sumador3:	.byte -6

suma1:  .word 0
suma2:  .word 0

.globl programa

programa:
					ldb sumador2
      		ldx sumador1
     			ABX 
      		stx suma1

      		ldb sumador3
      		SEX
      		addd sumador1
      		std suma2 


acabar:	
					clra
					sta fin
					
					.org 0xFFFE
					.word programa
