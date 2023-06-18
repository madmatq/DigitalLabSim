#-- DigitalLabSim

	#-- Fichero con los codigos de los servicios del Sistema operativo
	.include "servicios.asm"
	
	.data
	
mg1:	.string "Elige la funcion y escribe en la consola de comandos "
mg2:	.string "\n -Contador(0-99): [1] "
mg3:	.string "\n -Cuenta atras(99-0): [2] "
mg4:	.string "\n ERROR: caracter no valido "
salto:	.string "\n"
	
	.text
	
	#-- Usamos s0 como puntero de acceso al puerto
	#-- Cargamos en s0 la direccion de memoria del puerto, valor estatico
	li s0, BASE
	
	#-- Cargamos en s1, s2, s3,... para numerar las funciones, valores estaticos.
	li s1, 1 #-- Contador(0-99)
	li s2, 2 #-- Cuenta atras(99-0)
	
	#-- Comienza el programa
	b inicio
	
inicio:
	#-- Se imprimen las opciones del usuario
	la a0, mg1
	li a7, PRINT_STRING
	ecall
	la a0,mg2
	li a7,PRINT_STRING
	ecall
	la a0,mg3
	li a7, PRINT_STRING
	ecall
	
	#-- Imprimo un salto de linea antes de leer de la consola
	la a0,salto 
	li a7, PRINT_STRING
	ecall
	
	#-- Se lee de la consola
	#-- Se almacena valor en a0
	li a7, READ_INT
	ecall
	
	#-- Se traduce a una subrutina
	#-- Segun el valor que contenga a0, usaremos una funcion u otra
	
	beq a0,s1,contador	
	beq a0,s2, cuentatras
	
	#-- Si el usuario introduce un valor fuera del rango de funciones disponibles
	#-- Se tratara como error y se terminara el programa
	beqz a0, errores
	
	bgt a0, s2, errores
		
	b fin
	
	
contador: #-- FUNCION SIN TERMINAR
	
	#-- Uso de los segmentos de DERECHA A IZQUIERDA
	#-- Cargar el valor a sacar por el Display Derecho, temporal
	li t0, CERO
	sb t0, DISPLAY_DER(s0)
	
	#-- Cargar el valor a sacar por el Display Izquierdo, temporal
	li t1, CERO	
	sb t1, DISPLAY_IZQ(s0)
	
	#-- Mientras el valor del digito derecho sea menor que 9, se sumara 1
	blt t3,s1,suma1
	
	b fin
		
suma1: #-- FUNCION SIN TERMINAR
	#-- Funcion que suma 1	

	#--- Funcion para convertir en decimal el valor del display
	
cuentatras: #-- FUNCION SIN TERMINAR
	
	#-- Cuenta atras de 99 a 0
	
	b fin	


decimal: #-- FUNCION SIN TERMINAR

	#-- Cargamos en a0 el valor del display izquierdo
	# mv a0, t1
	#-- Cargamos en a1 el valor en hexadecimal del PUNTO, en caso de que haya que usarlo, es un argumento
	#li a1, PUNTO
	#-- Llamada a la funcion decimal(x)
	# jal decimal
	# mv t1,a0
	# sb t1, DISPLAY_IZQ(s0)
	

	#-- Para añadir el punto en el display habria que encender el segmento 7.
	#-- Lo cual equivale a sumar 0x80 en hexadecimal al valor inicial del display izquierdo
	add t0,a0,a1
	
	#-- Devolvemos resultado por a0
	mv a0, t0
	ret
	
errores:

	#-- Se imprime un mensaje de error por la consola
	la a0, mg4
	li a7, PRINT_STRING
	ecall

	b fin

fin:	
	#-- Fin del programa
	li a7, EXIT
	ecall



#----------------------------------------------------------------------------------------------------------------------
#-- Lineas en des uso

#-- Cargamos en s1 el valor maximo del display, valor estatico
	# li s1, MAX