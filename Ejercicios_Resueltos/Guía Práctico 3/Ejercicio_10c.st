"cuantas palabras con una longitud entre 8 y 16 caracteres poseen más de tres
veces la vocal ‘a’"


|frase palabras|

frase:= 'hola holaholahola holaholaaa holaholaholahola aaaa'.

frase:= frase findTokens: ' '.
palabras:=0.
frase do: [ :c|
	((c size > 7) and: (c size < 17) )
	ifTrue: [ 
		|cant|
		cant:=0.
		c do: [ :i|
			(i = $a) ifTrue: [cant:=cant + 1].
			 ].
		(cant > 3) ifTrue: [ palabras := palabras + 1 ]
		 ].
	].

Transcript show: palabras.