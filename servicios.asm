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
	
	#-- Valores para elegir el display
	.eqv DISPLAY_DER 0
	.eqv DISPLAY_IZQ 1
	#-- Valor maximo para los digitos en el display
	.eqv MAX 9 
	#--- Direccion base del display: 0xFFFF0010 
	.eqv BASE 0xFFFF0010
		
	#-- Cargamos en el segmento de datos
	.data
	
	#-- Valores a sacar por los displays en hexadecimal (0 - 9)
	
num:	.byte 0x3F #-- Valor de 0 en Displays (0), puntero der.
num2:	.byte 0x06 #-- Valor de 1 en Displays (1), puntero izq.
	.byte 0x5B #-- Valor de 2 en Displays (2)
	.byte 0x4F #-- Valor de 3 en Displays (3)
	.byte 0x66 #-- Valor de 4 en Displays (4)
	.byte 0x6D #-- Valor de 5 en Displays (5)
	.byte 0x7C #-- Valor de 6 en Displays (6)
	.byte 0x07 #-- Valor de 7 en Displays (7)
	.byte 0x7F #-- Valor de 8 en Displays (8)
	.byte 0X67 #-- Valor de 9 en Displays (9)
	
extrad:	.byte 0X80 #-- Valor del punto en Displays (10)
	.byte 0xFF #-- Valore para LAMP TEST en DISPLAYS (11)
