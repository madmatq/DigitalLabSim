#---- PROGRAMA SIN TERMINAR
	
	.globl teclado
	
	.include "servicios.asm"
	
	#--- Direccion base de mis perifericos
	.eqv BASE 0xFFFF0010
	
	#--- Servicios del s.o
	.eqv TECLADO_NUM 2
	.eqv DISPLAY_DER 0
	.eqv FILA1 1
	.eqv FILA2 2
	.eqv FILA3 4
	.eqv FILA4 8
	.eqv LEER_TECLA 4
	
	.text
	
teclado:

	#--- Leer la direccion base de acceso
	li t0, BASE
	 
dig1:
	#--- Seleccionar la fila 3
	li t1, FILA3
	sb t1, TECLADO_NUM(t0)
	
	#-- Seleccionar la fila 4
	li t1, FILA4
	sb t1, TECLADO_NUM(t0)
	
	#--- Leer la tecla
	lb t3, LEER_TECLA(t0)
	
	# display (t3)
	sb t3, DISPLAY_DER(t0)
	
	b dig1
	
