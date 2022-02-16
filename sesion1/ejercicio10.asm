.area PROG(ABS)
.org 0x100

fin      .equ 0xFF01
pantalla .equ 0xFF00
teclado  .equ 0xFF02

.globl programa

programa:
				lda teclado
				ldb teclado
				
				stb pantalla
				sta pantalla

				ldb #'\n
				stb pantalla
				sta pantalla
	
acabar:	
				sta fin

.org 0xFFFE
.word programa
