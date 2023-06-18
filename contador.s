#-- Funcion de contador(0-99)
#-- NO TERMINADO
	
	.globl contador
	.include "servicios.asm"
	
	.text

contador: #-- FUNCION SIN TERMINAR
	
	#-- Uso de los segmentos de DERECHA A IZQUIERDA
	#-- Cargar el valor a sacar por el Display Derecho, temporal
	li t0, CERO
	sb t0, DISPLAY_DER(s0)
	
	#-- Cargar el valor a sacar por el Display Izquierdo, temporal
	li t1, CERO	
	sb t1, DISPLAY_IZQ(s0)
	
	#-- Iniciamos los contadores
	li t0, 0 #-- Display derecho
	li t1, 0 #-- Display izquierdo
	
	b suma1
	
	#-- Reinicio el registro a0 ya que es el fin de la subrutina
	li a0, 0
	ret
		
suma1: #-- FUNCION SIN TERMINAR
	#-- Funcion que suma 1	
	addi t0,t0, 1
	
	#-- Mientras el valor del digito derecho sea menor que 9, se sumara 1

