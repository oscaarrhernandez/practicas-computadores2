	.area PROG(ABS)

; Constantes
pantalla .equ 0xFF00
fin 	 .equ 0xFF01
teclado  .equ 0xFF02

cadena	 .equ 0xE000

	.org 0x100

; Variables
menor: .byte 0

	.globl programa
	
programa:    
    ldx #cadena

leerCadena:    
	lda teclado
    sta ,x+
    cmpa #'\n
    bne leerCadena
	clr -1,x 	; Limpiamos el salto de linea

iniciarMenor:    
	lda #255
    sta menor
    ldx #cadena

buscarMenor:    
	lda ,x+
	
    beq mostrarMenor ; Si leemos '0' salimos del bucle
    
    bita #0x80
    bne buscarMenor
	
	; Comparamos con menor
    cmpa menor
    bhs buscarMenor ; Si a >= menor -> buscarMenor
    sta menor		; Si a < menor -> guardamos caracter
    bra buscarMenor

mostrarMenor:    
	lda menor
    cmpa #255
    beq acabar
    sta pantalla
	ldx #cadena

marcar:        
	lda ,x+
    beq iniciarMenor
    cmpa menor
	bne marcar
	ora #0x80
	sta -1,x
	bra marcar
	
acabar:
	; Salto de línea
	lda #'\n
	sta pantalla

	clra
	sta fin

	.org 0xFFFE		; Vector RESET 
	.word programa
