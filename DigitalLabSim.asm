#-- DigitalLabSim

	#-- Fichero codigo principal
	.globl fin
	.include "servicios.asm"
	
	.data
	
mg1:	.string "Elige la funcion y escribe en la consola de comandos "
mg2:	.string "\n [1] : Contador(0-99)  "
mg3:	.string "\n [2] : Cuenta atras(99-0)  "
mg4:	.string "\n [3] : Contador decimal(0.0-9.9) "
mg5:	.string "\n [4] : Cuenta atras decimal (9.9-0.0) "
mg6:	.string "\n ERROR: caracter no valido "
salto:	.string "\n"
	
	.text
	
	#-- Usamos s0 como puntero de acceso al puerto
	#-- Cargamos en s0 la direccion de memoria del puerto, valor estatico
	li s0, BASE
	
	#-- Cargamos en s1, s2, s3,... para numerar las funciones, valores estaticos.
	li s1, 1 #-- Contador(0-99)
	li s2, 2 #-- Cuenta atras(99-0)
	li s3, 3 #-- Contador decimal(0.0-9.9)
	li s4, 4 #-- Cuenta atras decimal(9.9-0.0)
	
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
	la a0, mg4
	li a7, PRINT_STRING
	ecall
	la a0, mg5
	li a7, PRINT_STRING
	ecall
	
	#-- Se imprime un salto de linea antes de leer de la consola
	la a0,salto 
	li a7, PRINT_STRING
	ecall
	
	#-- Se lee de la consola
	#-- Se almacena valor en a0
	li a7, READ_INT
	ecall
	
	#-- Se traduce a una subrutina
	#-- Segun el valor que contenga a0, usaremos una funcion u otra(subrutina)
	
	#-- Funcion contador del 0 al 99, display de segmentos
	beq a0,s1,contador
	#-- Funcion cuenta atras del 99 al 0, display de segmentos
	beq a0,s2, cuentatras
	#-- Funcion contador decimal del 0.0 al 9.9, display de segmentos
	beq a0,s3, contadorDec
	#-- Funcion cuenta atras decimal del 9.9 al 0.0, display de segmentos
	beq a0,s4, cuentatrasDec
	
	#-- Si el usuario introduce un valor fuera del rango de funciones disponibles
	#-- Se tratara como error y se terminara el programa
	beqz a0, errores
	bgt a0, s4, errores
	
		
errores:

	#-- Se imprime un mensaje de error por la consola
	la a0, mg6
	li a7, PRINT_STRING
	ecall

	b fin

fin:	
	#-- Fin del programa
	li a7, EXIT
	ecall
