#-- Fichero con la subrutina de cuenta atras
#-- NO TERMINADO, REGISTROS SIN CORREGIR
	
	.globl cuentatras
	.include "servicios.asm"

	.text

cuentatras: #-- FUNCION SIN TERMINAR
	#-- Cuenta atras de 99 a 0
	#-- Uso de los segmentos de DERECHA A IZQUIERDA
	#-- Cargamos en t0 la ultima direccion en memoria de los digitos, puntero der.
	la t0, num3
	#-- Cargamos en t6 la ultima direccion en memoria de los digitos, puntero izq.
	la t6, num3
	
	#-- Cargar el valor a sacar por el Display Derecho, temporal
	lb t1, 0(t0)
	sb t1, DISPLAY_DER(s0)
	
	#-- Cargar el valor a sacar por el Display Izquierdo, temporal
	lb t2, 0(t0)	
	sb t2, DISPLAY_IZQ(s0)
	
	#-- Iniciamos los contadores
	li t1, 10 #-- Display derecho
	li t2, 10 #-- Display izquierdo

	b resta1
final:	
	#-- Reinicio el registro a0 ya que es el fin de la subrutina
	li a0, 0
	b finf
	
resta1:
	#-- Funcion que reduce el valor de los digitos en el display
	#-- Actualizamos el valor del display derecho a 0
	lb t3, 0(t0)
	sb t3, DISPLAY_DER(s0)
	
	#-- Movemos el puntero 1 vez hacia la direccion previa
	addi t0,t0, -1
	
	#-- Reducimos el contador en 1, display derecho
	addi t1,t1, -1
	
	#-- Valor minimo del display: 0
	li t4, 0
	#-- Cuando el contador del display derecho llegue a 0, se reinicia
	beq t1, t4, resta2
rep:
	#-- Mientras que el valor del digito derecho sea mayor o igual que 0
	#-- Repetimos el bucle
	b resta1
resta2: 
	#-- Funcion que reinicia el contador t1 y el puntero de la direccion
	#-- Reinicio el contador derecho a 10
	li t1, 10
	#-- Reinicio el puntero de la direccion de los digitos
	addi t0,t0,10
	#-- Actualizamos el valor del display derecho
	lb t3, 0(t0)
	sb t3, DISPLAY_DER(s0)
	#-- Muevo el puntero 1 vez hacia la anterior direccion
	addi t6,t6,-1
	#-- Actualizo el valor del display izquierdo
	lb t3, 0(t6)
	sb t3, DISPLAY_IZQ(s0)
	
	#-- Resto 1 al contador del display izq
	addi t2,t2, -1
	#-- Valor maximo del display: 0
	li t4, 0
	#-- Mientras que el contador del display izquierdo no llegue a 0
	beq t2,t4, final
	#-- Sigo restando
	j rep
	
