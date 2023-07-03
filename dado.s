#-- Random num generator sobre Display

	.globl numero1
	#-- Servicios
	.include "servicios.asm"
	
	.text

numero1:
	#-- Cargamos el valor maximo que puede generarse
	#-- En este caso sera 5 ya que el limite inferior del rango es 0
	li a1, MAX1
	
	#-- Llamamos al servicio para generar el numero contendio en el rango
	li a7, RAND_INT
	ecall
	
	#-- Se suma 1 al entero generado para que nunca sea 0
	addi a0, a0, 1
	
	#-- Imprimos el valor en la consola
	li a7, PRINT_INT
	ecall
	
#------- DISPLAY ------
	#-- Cargamos en t0 la primera direccion en memoria de los digitos, puntero der.
	la t0, num

bucle:
	#-- Movemos el puntero 1 vez hacia adelante
	addi t0, t0, 1		
	#-- Sumamos 1 al contador
	addi t1, t1, 1		
	#-- Si coincide el contador con el numero generado, se imprime
	beq a0, t1, print 	
	#-- Sino se sigue sumando al contador y al puntero
	b bucle
	
print:
	#-- Actualizamos el valor del display derecho al valor del dado
	lb t2, 0(t0)
	sb t2, DISPLAY_DER(s0)
			
finale:
	li a7, EXIT
	ecall