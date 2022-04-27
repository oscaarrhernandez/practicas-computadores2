.area PROG(ABS)

; Constantes
pantalla .equ 0xFF00
fin	 .equ 0xFF01
teclado	 .equ 0xFF02
pilaU	 .equ 0xF000

	.org 0x100
	.globl programa
programa:
	ldu pilaU

leer:
	; Leemos de teclado hasta llegar a un salto de carro 
	lda teclado	; Leemos de teclado	
	pshu a		; Recorremos la pila
				
	cmpa #'\n	
	; Comparamos con el caracter '\n'
	bne leer	; Repetir bucle

escribir:
	; Mostramos por pantalla
	pulu a			; Recorremos la pila de forma inversa
	sta pantalla	; Imprimimos por pantalla	
	cmpa pilaU		; Comparamos pilaU
	bne escribir	; Repetir bucle

acabar:
	; Salto de linea 
	ldb #'\n
	stb pantalla

	clra
	sta fin		; Vector de RESET 

	.org 0xFFFE
	.word programa
