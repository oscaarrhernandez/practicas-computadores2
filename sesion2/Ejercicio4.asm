.area PROG (ABS)

fin 			.equ 0xFF01
pantalla 	.equ 0xFF00
teclado		.equ 0xFF02

.org 0x100

numero1:	.word 0x7790
numero2: 	.word 0x2285

resta1: .word 0
resta2: .word 0

.globl programa

programa:
				 ;Usando registro D
					ldd numero1
					subd numero2
					std resta1
				 ;Usando registro A
				  lda numero1+1
				  suba numero2+1
				  sta resta2+1
				  lda numero1
				  sbca numero2
				  sta resta2
				  

acabar:	
					clra
					sta fin
					
					.org 0xFFFE
					.word programa
