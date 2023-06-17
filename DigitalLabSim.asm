#-- DigitalLabSim

	#-- Fichero con los codigos de los servicios del Sistema operativo
	.include "servicios.asm"
	
	.text
	
	#-- Cargamos en s0 el valor en hexadecimal del PUNTO, en caso de que haya que usarlo, es un valor estatico que no cambiara
	li s0 PUNTO
	
	#-- Usamos s1 como puntero de acceso al puerto
	#-- Cargamos en s1 la direccion de memoria del puerto
	li s1, BASE
	
	#-- Uso de los segmentos de DERECHA A IZQUIERDA
	
	#-- Cargar el valor a sacar por el Display Derecho, temporal
	li t0, SIETE
	sb t0, DISPLAY_DER(s1)
	
	#-- Cargar el valor a sacar por el Display Izquierdo, temporal
	li t0, DOS	
	sb t0, DISPLAY_IZQ(s1)
	
	# jal decimal
	
	b fin
	
	#--- Subrutina para añadir punto
decimal:
	#-- Para añadir el punto en el display habria que encender el segmento 7.
	#-- Lo cual equivale a sumar 0x80 en hexadecimal al valor inicial del display izquierdo
	add t0,t0,s0
	sb t0, DISPLAY_IZQ(s1)
	
	ret
fin:	
	#-- Fin del programa
	li a7, EXIT
	ecall
