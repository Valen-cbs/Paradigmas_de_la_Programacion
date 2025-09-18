"Un número entero positivo se dice perfecto si es igual a la suma de todos sus divisores, excepto el
mismo. Ejemplo: los números 6 (1+2+3), 28 (1+2+4+7+14) y 496 (1+2+4+8+16+31+62+124
+248) son perfectos. Escriba un método booleano que permita diferenciar si un número (único
parámetro) es perfecto."

"esPerfecto: unNumero
|cont|
cont:=0.
	1 to: (unNumero - 1) do: [:i|
		(unNumero\\i = 0) ifTrue: [ 
			cont:=cont + i.
			 ].
		 ].
	^cont = unNumero.


Perfecto new esPerfecto:"
|esPerfecto|
esPerfecto:= [:unNumero|  
|cont|
cont:=0.
	1 to: (unNumero - 1) do: [:i|
		(unNumero\\i = 0) ifTrue: [ 
			cont:=cont + i.
			 ].
		 ].
	^cont = unNumero.
	
	].

esPerfecto value: 29.