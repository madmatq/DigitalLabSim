#-- DigitalLabSim

	#-- Fichero con los codigos de los servicios del Sistema operativo
	.globl fin
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
	
	beq a0,s1,contador
	beq a0,s2, cuentatras
	
	#-- Si el usuario introduce un valor fuera del rango de funciones disponibles
	#-- Se tratara como error y se terminara el programa
	beqz a0, errores
	bgt a0, s2, errores
		
	b fin
		

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
