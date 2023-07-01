# DigitalLabSim

Funciones para el manejo del Digital Lab Sim del Rars


## Funciones display

- Contador(0-99) 
- Cuenta atras(99-0)
- Contador decimal(0.0-9.9)
- Cuenta atras decimal(9.9-0.0)
- Dado electronico (1-6)

## Funciones teclado hexadecimal

- Lectura de teclas individuales
- Lectura de numeros decimales y hexadecimales(2 digitos)

## Contador

La función contador trabaja con los displays de segmentos, alojados en la direccion 0xFFFF0010 y 0xFFFF0011, derecho e iqzuierdo respectivamente.
Al iniciar el programa, eligiendo la funcion 1 en el menú de opciones y con el display de segmentos conectado, los dos displays iran actualizando los valores que muestran con respecto a un orden ascendente.
Debido a la cantidad de displays de segmentos disponibles, solo podemos contar desde el 00 al 99.

## Cuenta atras

La funcion cuenta atras trabaja con los displays de segmentos, alojados en las direcciones 0xFFFF0010 y 0xFFFF0011, derecha e izquierda respectivamente.
Al iniciar el programa, eligiendo la funcion 2 en el menu de opciones y con el display de segmentos conectado, los dos displays iran actualizando los valores que muestran con respecto a un orden descendente.
Debido a la cantidad de displays de segmentos disponibles, solo podemos contar desde el 99 al 00.


## Contador decimal

No terminado

## Cuenta atras decimal

No terminado

## Lectura de teclado hexadecimal y display del numero tecleado

No terminado

## Dado electronico (?)

Es esto posible?

Esa era la pregunta y tras una exhaustiva busqueda, dimos con una 'respuesta'. 


## Autores

- [@madmatq](https://github.com/madmatq)


## Referencias

 - [2019-20-LAB-AO. L4: Pract 2-1.](https://github.com/myTeachingURJC/2019-20-LAB-AO/wiki/L4:-Practica-2)
 - [Awesome README](https://github.com/matiassingers/awesome-readme)
 - [RARS -- RISC-V Assembler and Runtime Simulator](https://github.com/TheThirdOne/rars)


