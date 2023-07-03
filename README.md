# DigitalLabSim

Funciones para el manejo del Digital Lab Sim del Rars


## Funciones display

- [Contador(0-99)](#Contador(0-99))
- [Cuenta atras(99-0)](#Cuenta_atras(99-0))
- [Contador decimal(0.0-9.9)](#Contador_decimal(0.0-9.9))
- [Cuenta atras decimal(9.9-0.0)](#Cuenta_atras_decimal(9.9-0.0))
- [Dado electronico (1-6)](#Dado(1-6))

## Funciones teclado hexadecimal

- [Lectura de teclas individuales](#Lectura_teclado_hexadecimal)
- Lectura de numeros decimales y hexadecimales(2 digitos)

## Contador

La función contador trabaja con los displays de segmentos, alojados en la direccion 0xFFFF0010 y 0xFFFF0011, derecho e iqzuierdo respectivamente.
Al iniciar el programa, eligiendo la funcion 1 en el menú de opciones y con el display de segmentos conectado, los dos displays iran actualizando los valores que muestran con respecto a un orden ascendente.
Debido a la cantidad de displays de segmentos disponibles, solo podemos contar desde el 00 al 99.

## Cuenta_atras

La funcion cuenta atras trabaja con los displays de segmentos, alojados en las direcciones 0xFFFF0010 y 0xFFFF0011, derecha e izquierda respectivamente.
Al iniciar el programa, eligiendo la funcion 2 en el menu de opciones y con el display de segmentos conectado, los dos displays iran actualizando los valores que muestran con respecto a un orden descendente.
Debido a la cantidad de displays de segmentos disponibles, solo podemos contar desde el 99 al 00.


## Contador_decimal

La función contador trabaja con los displays de segmentos, alojados en la direccion 0xFFFF0010 y 0xFFFF0011, derecho e iqzuierdo respectivamente. Al iniciar el programa, eligiendo la funcion 1 en el menú de opciones y con el display de segmentos conectado, los dos displays iran actualizando los valores que muestran con respecto a un orden ascendente. Debido a la cantidad de displays de segmentos disponibles, solo podemos contar desde el 00 al 99.

Para añadir el punto en el display habria que encender el segmento 7.
Por ejemplo, para representar el numero 2 en el display, usamos el valor 0x5B en hexadecimal, 
traducido al binario 010110111 (91 en decimal) 
añadiriamos un 1 en el bit de mayor peso = 110110111,
lo cual se traduce en sumar 10 millones (que en decimal seria sumar 128 y en hexadecimal 80). 
Por lo tanto solo se trata de sumar 128 al valor en decimal (91+128=219 a hexadecimal: 0xDB).	

## Cuenta_atras_decimal

La funcion cuenta atras trabaja con los displays de segmentos, alojados en las direcciones 0xFFFF0010 y 0xFFFF0011, derecha e izquierda respectivamente.
Al iniciar el programa, eligiendo la funcion 2 en el menu de opciones y con el display de segmentos conectado, los dos displays iran actualizando los valores que muestran con respecto a un orden descendente.
Debido a la cantidad de displays de segmentos disponibles, solo podemos contar desde el 99 al 00.

Para añadir el punto en el display habria que encender el segmento 7.
Por ejemplo, para representar el numero 2 en el display, usamos el valor 0x5B en hexadecimal, 
traducido al binario 010110111 (91 en decimal) 
añadiriamos un 1 en el bit de mayor peso = 110110111,
lo cual se traduce en sumar 10 millones (que en decimal seria sumar 128 y en hexadecimal 80). 
Por lo tanto solo se trata de sumar 128 al valor en decimal (91+128=219 a hexadecimal: 0xDB).	

## Lectura_teclado_hexadecimal

Programa estudiado pero no terminado.
![foto](https://github.com/madmatq/DigitalLabSim/assets/136661637/5467b371-3432-4a2d-bfef-d60d6033dfcd)


## Dado

Es esto posible?

Esa era la pregunta y tras una exhaustiva busqueda, dimos con una 'respuesta'. 

Tras estudiar la posibilidad de añadir una funcion que pudiese generar numeros 'pseudoaleatorios', encontramos la llamada al sistema 42 (Get a random bounded integer),
a la cual se le puede pasar como argumento el limite superior al que se debe adecuar, dandonos asi un numero 'aleatorio' dentro de nuestro rango.
![foto](https://github.com/madmatq/DigitalLabSim/assets/136661637/10f0fd17-34ae-4023-ac99-9e9c648b964b)


## Autores

- [@madmatq](https://github.com/madmatq)


## Referencias

 - [2019-20-LAB-AO. L4: Pract 2-1.](https://github.com/myTeachingURJC/2019-20-LAB-AO/wiki/L4:-Practica-2)
 - [Awesome README](https://github.com/matiassingers/awesome-readme)
 - [RARS -- RISC-V Assembler and Runtime Simulator](https://github.com/TheThirdOne/rars)


