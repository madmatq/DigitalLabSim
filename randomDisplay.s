 #-- Funcion que genera y muestra un numero aleatorio en el rango de 0 a 99
 #-- Uso del display de segmentos
 
 #-- PROGRAMA NO OPTIMIZADO, NO APTO PARA SU CORRECTO USO
	
	.globl numero2
	.include "servicios.asm"
	
	.text
	
numero2:
	#-- Descomentar la siguiente linea si se desea probar el programa
	#  li s0, BASE
	
	#-- Cargamos el valor maximo que puede generarse
	#-- En este caso sera 5 ya que el limite inferior del rango es 0
	li a1, MAX2
	
	#-- Llamamos al servicio para generar el numero contenido en el rango
	li a7, RAND_INT
	ecall
	
	#-- Imprimos el valor en la consola
	li a7, PRINT_INT
	ecall
	
contador: 
	#-- Uso de los segmentos de DERECHA A IZQUIERDA
	#-- Cargamos en t0 la primera direccion en memoria de los digitos, puntero der.
	la t0, num
	#-- Cargamos en t1 la primera direccion en memoria de los digitos, puntero izq.
	la t1, num
	#-- Cargamos el valor a sacar por el Display Izquierdo, temporal
	lb t2, 0(t0)	
	sb t2, DISPLAY_IZQ(s0)
	#-- Iniciamos los contadores
	li t2, 0 #-- Display derecho
	li t3, 0 #-- Display izquierdo
	li t4, 0 #-- Valor final
	
	b suma1
final:	
	#-- Reinicio el registro a0 ya que es el fin de la subrutina
	li a0, 0
	b fin
		
suma1: 
	#-- Funcion que aumenta el valor del display derecho
	
	#-- Movemos el puntero 1 vez hacia la siguiente direccion
	addi t0,t0,1
	
	#-- Incrementamos el contador en 1, display derecho
	addi t2,t2, 1
	
	#-- Valor maximo del display: 10
	li t6, 10
	
	#-- Incrementamos el contador en 1, valor final
	addi t4,t4, 1
	
	#-- Si coincide el contador con el numero generado, se imprime
	beq a0, t4, print 	
	
	#-- Cuando el contador del display derecho llegue a 10, se reinicia
	beq t2, t6, suma2
rep:
	#-- Mientras que el valor del digito derecho sea menor o igual que 9
	#-- Repetimos el bucle
	b suma1	

suma2: 
	#-- Funcion que reinicia el contador t2 y el puntero de la direccion
	#-- Valor maximo del display: 9
	li t6, 9
	#-- Mientras que el contador del display izquierdo no llegue a 10
	beq t3,t6, final
	#-- Reinicio el contador derecho a 0
	li t2, 0
	#-- Reinicio el puntero de la direccion de los digitos derechos
	addi t0,t0,-10
	#-- Incrementamos el contador en 1, display derecho
	addi t2,t2, 1
	
	#-- Movemos el puntero 1 vez hacia la siguiente direccion
	addi t0,t0,1
	
	#-- Muevo el puntero 1 vez hacia la siguiente direccion
	addi t1,t1, 1
	#-- Sumo 1 al contador del display izq
	addi t3,t3, 1
	
	#-- Sigo sumando
	j rep

print:	
	#-- Actualizo el valor del display derecho
	lb t4, 0(t0)
	sb t4, DISPLAY_DER(s0)
	
	#-- Actualizo el valor del display izquierdo
	lb t4, 0(t1)
	sb t4, DISPLAY_IZQ(s0)
	
finale:
	li a0, 0
	b fin