#-- Código de los servicios del sistema operativo
#-- Incluir estos archivos en tus programas
#-- para acceder a ellos fácilmente, y hacerlos más
#-- legibles
	
	#-- Servicios
	.eqv PRINT_INT    1
	.eqv READ_INT     5
	.eqv PRINT_STRING 4
	.eqv READ_STRING  8
	.eqv PRINT_CHAR   11
	.eqv READ_CHAR    12
	
	.eqv EXIT         10
	.eqv DISPLAY_DER 0
	.eqv DISPLAY_IZQ 1
	
	#--- Direccion base del display: 0xFFFF0010 
	.eqv BASE 0xFFFF0010
	
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