	.area PROG (ABS)

; Constantes       
pantalla .equ 0xFF00
fin      .equ 0xFF01
teclado	 .equ 0xFF02

	.org 0x100

; Variables
tmpB:	.word 0x2190

	.globl programa
programa:
	ldd #987
	tfr d,x
	
	; primera cifra
	cmpd #800
	blo Menor800
	subd #800
	tfr d,x
	clrb
	incb
	stb tmpB

Menor800:
	ldb tmpB
	lslb
	stb tmpB

	tfr x,d
	cmpd #400
	blo Menor400
	subd #400
	tfr d,x

	ldb tmpB
	incb
	stb tmpB

Menor400:
	ldb tmpB
	lslb
	stb tmpB
	
	tfr x,d
	cmpd #200
	blo Menor200
	subd #200
	tfr d,x

	ldb tmpB
	incb
	stb tmpB

Menor200:
	ldb tmpB
	lslb
	stb tmpB
		tfr x,d
	tfr b,a
		ldb tmpB
		cmpa #100
		blo Menor100
		suba #100
		incb
		cmpa #100
		blo Menor100
		incb
		suba #100
		stb pantalla

Menor100:
	addb #'0
		stb pantalla
	; IMPRIMIMOS '0x'
	ldb #'0
	stb pantalla
	ldb #'x
	stb pantalla
	
	; PRIMER VALOR HEXADECIMAL
	;lda suma1
	tfr a,b
	lsrb
	lsrb
	lsrb
	lsrb
	std tmp
	clra 
	addb #246	
        adca #0 	
        ldb #'A-'9-1	
	mul		
	addb tmp+1	
        addb #'0	
        stb pantalla

	; SEGUNDO VALOR HEXADECIMAL
	ldb tmp
        lslb
        lslb
        lslb
        lslb
        lsrb
        lsrb
        lsrb
        lsrb 
        std tmp
        clra
        addb #246
        adca #0 
        ldb #'A-'9-1
	mul
	addb tmp+1
        addb #'0
        stb pantalla

	; TERCER VALOR HEXADECIMAL
	lda suma1+1
	tfr a,b
	lsrb
	lsrb
	lsrb
	lsrb
	std tmp
	clra 
	addb #246	
        adca #0 	
        ldb #'A-'9-1	
	mul		
	addb tmp+1	
        addb #'0	
        stb pantalla

	; CUARTO VALOR HEXADECIMAL
	ldb tmp
        lslb
        lslb
        lslb
        lslb
        lsrb
        lsrb
        lsrb
        lsrb 
        std tmp
        clra
        addb #246
        adca #0 
        ldb #'A-'9-1
	mul
	addb tmp+1
        addb #'0
        stb pantalla

  	; Salto de linea
        ldb #'\n
        stb pantalla



acabar:				; Fin del programa
	clra
	sta fin

	.org 0xFFEE		; Vector de RESET
	.word programa
