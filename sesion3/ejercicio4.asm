        .area PROG (ABS)

; Constantes
fin      .equ 0xFF01
pantalla .equ 0xFF00

        .org 0x100

; Variables
sumando1: .word 0x2190
sumando2: .word 0x4777

suma1:  .word 0
temp:   .word 0

        .globl programa
programa:
        ; Suma con el registro 'D'
        ldd sumando1
        addd sumando2
        std suma1
	; suma1   = 69
	; suma1+1 = 07

	; IMPRIMIMOS '0x'
	ldb #'0
	stb pantalla
	ldb #'x
	stb pantalla
	
	; PRIMER VALOR HEXADECIMAL
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

	; SEGUNDO VALOR HEXADECIMAL
	ldb temp
        lslb
        lslb
        lslb
        lslb
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

	; TERCER VALOR HEXADECIMAL
	lda suma1+1
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

	; CUARTO VALOR HEXADECIMAL
	ldb temp
        lslb
        lslb
        lslb
        lslb
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

	.org 0xFFFE	; vector de RESET
	.word programa
