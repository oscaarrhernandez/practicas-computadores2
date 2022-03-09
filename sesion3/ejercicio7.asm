
	.area PROG (ABS)
	
; Constantes
fin	 .equ 0xFF01
pantalla .equ 0xFF00
teclado  .equ 0xFF02

	.org 0x100

; Variables
num1: .byte 0
num2: .byte 0
num3: .byte 0
num4: .byte 0
suma1: .byte 0
suma2: .byte 0
temp: .word 0

	.globl programa

num1:	.byte 0
num2:	.byte 0
num3:	.byte 0
num4:	.byte 0
temp:	.byte 0

programa:
				lda teclado
				sta num1
				lda teclado
				sta num2
				lda #' 
				sta pantalla
				
				lda teclado
				sta num3
				lda teclado
				sta num4
				sta pantalla
				
				lda #'\n
				sta pantalla
				
				lda num1
				sta pantalla
				
				lda num2
				sta pantalla
				
				lda #'+
				sta pantalla

				lda num3
				sta pantalla
				
				lda num4
				sta pantalla
				
				lda #'=
				sta pantalla
				
				lda num2
				suba #'0
				ldb num4
				subb #'0
				stb  num4
				adda num4
				daa
				sta temp
				
				lda num1
				suba #'0
				ldb num3
				subb #'0
				stb num3
				adda num3
				
				lsla
				lsla
				lsla
				lsla
				adda temp
				sta temp
				
				tfr a,b
				lsrb
				lsrb
				lsrb
				lsrb ; en B esta la primera cifra
				addb #'0
				stb pantalla
				
				lda temp
				tfr a,b
				lsrb
				lsrb
				lsrb
				lsrb
				lsrb
				lsrb
				lsrb
				lsrb
				
				addb #'0
				stb pantalla
				

	; Salto de linea
	ldb #'\n
	stb pantalla
	
	; Fin del programa
	clra
	sta fin
	
	.org 0xFFFE
	.word programa
