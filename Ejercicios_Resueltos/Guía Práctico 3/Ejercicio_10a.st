"La posicion inicial de la palabra mas larga"
|frase fraseCad pos pal i|

frase := 'hola como estas valen a holaaa'.
fraseCad:= frase findTokens: ' '. 
pos:=0.
pal:=1.
i:=1.
fraseCad do: [ :c|
	(c size > pal) 
	ifTrue: [ 
		pal:= c size.
		pos:=i
		].
	i:=i+ c size +1.
	 ].
Transcript show: (frase at: pos).