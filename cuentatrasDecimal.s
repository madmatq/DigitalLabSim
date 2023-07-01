#-- Fichero con la subrutina de cuenta atras

	.globl cuentatrasDec
	.include "servicios.asm"

	.text

cuentatrasDec: 
	#-- Cuenta atras de 99 a 0
	#-- Uso de los segmentos de DERECHA A IZQUIERDA
	#-- Cargamos en t0 la ultima direccion en memoria de los digitos, puntero der.
	la t0, num2
	#-- Cargamos en t1 la ultima direccion en memoria de los digitos, puntero izq.
	la t1, num2
	#-- Cargar el valor a sacar por el Display Izquierdo, temporal
	lb t2, 0(t0)	
	
	#-- Para añadir el punto en el display habria que encender el segmento 7.
	#-- Añadiriamos un 1 en el bit de mayor peso = 110110111 (ejemplo del digito 2),
	#-- lo cual se traduce en sumar 10 millones (que en decimal seria sumar 128 y en hexadecimal 80).
	addi t2,t2, PUNTO
	
	sb t2, DISPLAY_IZQ(s0)
	
	#-- Iniciamos los contadores
	li t2, 10 #-- Display derecho
	li t3, 10 #-- Display izquierdo

	b resta1
final:	
	#-- Reinicio el registro a0 ya que es el fin de la subrutina
	li a0, 0
	b fin
	
resta1:
	#-- Funcion que reduce el valor de los digitos en el display
	#-- Actualizamos el valor del display derecho a 0
	lb t4, 0(t0)
	sb t4, DISPLAY_DER(s0)
	
	#-- Movemos el puntero 1 vez hacia la direccion previa
	addi t0,t0, -1
	
	#-- Reducimos el contador en 1, display derecho
	addi t2,t2, -1
	
	#-- Valor minimo del display: 0
	li t5, 0
	#-- Cuando el contador del display derecho llegue a 0, se reinicia
	beq t2, t5, resta2
rep:
	#-- Mientras que el valor del digito derecho sea mayor o igual que 0
	#-- Repetimos el bucle
	b resta1
	
resta2: 
	#-- Funcion que reinicia el contador t2 y el puntero de la direccion
	#-- Valor maximo del display: 1 (serian los valores 00)
	li t5, 1
	#-- Mientras que el contador del display izquierdo no llegue a 0
	beq t3,t5, final
	#-- Reinicio el contador derecho a 10
	li t2, 10
	#-- Reinicio el puntero de la direccion de los digitos
	addi t0,t0,10
	#-- Reducimos el contador en 1, display derecho
	addi t2,t2, -1
	#-- Actualizamos el valor del display derecho
	lb t4, 0(t0)
	sb t4, DISPLAY_DER(s0)
	#-- Movemos el puntero 1 vez hacia la direccion previa
	addi t0,t0, -1
	
	#-- Muevo el puntero 1 vez hacia la anterior direccion
	addi t1,t1,-1
	#-- Actualizo el valor del display izquierdo
	lb t4, 0(t1)
	#-- Añadimos el punto
	addi t4,t4, PUNTO
	sb t4, DISPLAY_IZQ(s0)
	#-- Resto 1 al contador del display izq
	addi t3,t3, -1
	
	
	#-- Sigo restando
	j rep
	
