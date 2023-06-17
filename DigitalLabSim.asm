#-- DigitalLabSim

	#--- Direccion base del display: 0xFFFF0010 
	.eqv BASE 0xFFFF0010
	
	#--- Servicios
	.eqv EXIT 10
	.eqv DISPLAY_DER 0
	.eqv DISPLAY_IZQ 1
	
	#-- Valores a sacar por los displays en hexadecimal (0 - 9)
	.eqv UNO 0x06
	.eqv DOS 0x5B
	.eqv TRES 0X4F
	.eqv CUATRO 0X66
	.eqv CINCO 0X6D
	.eqv SEIS 0X7C
	.eqv SIETE 0X07
	.eqv OCHO 0X7F
	.eqv NUEVE 0X67
	.eqv CERO 0X3F
	.eqv PUNTO 0X80
	
	#-- Si se necesita existe la posibilidad de hacer un LAMP test con este valor
	.eqv LAMP 0XFF
	
	.text
	
	#-- Usamos s1 como puntero de acceso al puerto
	#-- Cargamos en s1 la direccion de memoria del puerto
	li s1, BASE
	
	#-- Uso de los segmentos de DERECHA A IZQUIERDA
	
	#-- Cargar el valor a sacar por el Display Derecho, temporal
	li t1, SIETE
	sb t1, DISPLAY_DER(s1)
	
	#-- Cargar el valor a sacar por el Display Izquierdo, temporal
	li t1, DOS	
	sb t1, DISPLAY_IZQ(s1)
	
fin:	
	#-- Fin del programa
	li a7, EXIT
	ecall
