 #-- Funcion de contador(0-99)
#-- NO TERMINADO, REGISTROS SIN CORREGIR
	
	.globl contador
	.include "servicios.asm"
	
	.text

contador: 
	#-- Uso de los segmentos de DERECHA A IZQUIERDA
	#-- Cargamos en t0 la primera direccion en memoria de los digitos, puntero der.
	la t0, num
	#-- Cargamos en t6 la primera direccion en memoria de los digitos, puntero izq.
	la t6, num2
	
	#-- Cargar el valor a sacar por el Display Derecho, temporal
	lb t1, 0(t0)
	sb t1, DISPLAY_DER(s0)
	
	#-- Cargar el valor a sacar por el Display Izquierdo, temporal
	lb t2, 0(t0)	
	sb t2, DISPLAY_IZQ(s0)
	
	#-- Iniciamos los contadores
	li t1, 0 #-- Display derecho
	li t2, 0 #-- Display izquierdo
	
	b suma1
final:	
	#-- Reinicio el registro a0 ya que es el fin de la subrutina
	li a0, 0
	b finf
		
suma1: 
	#-- Funcion que aumenta el valor de los digitos en el display
	#-- Actualizamos el valor del display derecho a 0
	lb t3, 0(t0)
	sb t3, DISPLAY_DER(s0)
	
	#-- Movemos el puntero 1 vez hacia la siguiente direccion
	addi t0,t0,1
	
	#-- Incrementamos el contador en 1, display derecho
	addi t1,t1, 1
	
	#-- Valor maximo del display: 10
	li t4, 10
	#-- Cuando el contador del display derecho llegue a 10, se reinicia
	beq t1, t4, suma2
rep:
	#-- Mientras que el valor del digito derecho sea menor o igual que 9
	#-- Repetimos el bucle
	b suma1	

suma2: 
	#-- Funcion que reinicia el contador t1 y el puntero de la direccion
	#-- Reinicio el contador derecho a 0
	li t1, 0
	#-- Reinicio el puntero de la direccion de los digitos
	addi t0,t0,-10
	
	#-- Actualizamos el valor del display derecho
	lb t3, 0(t0)
	sb t3, DISPLAY_DER(s0)
	
	#-- Actualizo el valor del display izquierdo
	lb t3, 0(t6)
	sb t3, DISPLAY_IZQ(s0)
	#-- Muevo el puntero 1 vez hacia la siguiente direccion
	addi t6,t6,1
	#-- Sumo 1 al contador del display izq
	addi t2,t2, 1
	#-- Valor maximo del display: 10
	li t4, 10
	#-- Mientras que el contador del display izquierdo no llegue a 10
	beq t2,t4, final
	#-- Sigo sumando
	j rep