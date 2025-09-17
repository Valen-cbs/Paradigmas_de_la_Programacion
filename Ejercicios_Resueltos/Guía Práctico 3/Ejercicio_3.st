"Verificar si una frase es un palíndromo o no"

|cadena bandera|

cadena := 'ahola como estassatse omoc aloha'.
bandera := 'si'.
1 to: (cadena size // 2) do: [:i|
	
	((cadena at: i) = (cadena at: (cadena size - i + 1))) ifFalse: [ bandera := 'no'. ].
	
].

(bandera = 'si') 
ifTrue: [ Transcript show: 'Sí, es un palíndromo' ]
ifFalse: [ Transcript show: 'No es un palíndromo' ].