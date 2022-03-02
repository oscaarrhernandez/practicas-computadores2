
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
programa:
	ldb teclado
	stb num1
	ldb teclado
	stb num2
	
	ldb #0x20
	stb pantalla

	ldb teclado
	stb num3
	ldb teclado
	stb num4

	ldb #0x20
	stb pantalla

	; Suma
	lda num2
	adda num4
	sta suma2
	lda num1
	adca num3
	sta suma1

	; Salto de línea
	ldb #'\n
	stb pantalla

	; Resultado
	ldb num1
	stb pantalla
	ldb num2
	stb pantalla
	ldb #0x2B	; Simbolo '+'
	stb pantalla
	ldb num3
	stb pantalla
	ldb num4
	stb pantalla
	ldb #0x3D	; Simbolo '='
	stb pantalla

	; Aritmética BCD
	lda suma1
	tfr a,b
	lsrb
	lsrb
	lsrb
	lsrb
	std temp
	clra
	addb #246
	adca #0
	ldb #'A-'9-1
	mul
	addb temp+1
	addb #'0
	stb pantalla
	
	lda suma2
	tfr a,b
	lsrb
	lsrb
	lsrb
	lsrb
	lsrb
	std temp
	clra
	addb #246
	adca #0
	ldb #'A-'9-1
	mul
	addb temp+1
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
