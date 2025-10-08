|substring frase i band pos|

frase:= 'hola como estas oriana belen aguilar'.
substring:= 'ana'.

i:=1.
band:=0.

[ ((i + substring size - 1) <= frase size) and: (band = 0) ] whileTrue: [
	|temp|
	temp:=frase copyFrom: i to: (i + substring size - 1).
	(temp = substring) ifTrue: [
		pos:=i.
		band:=1.
	].
	i:=i+1.
].

(band = 1)
	ifTrue: [ Transcript show: 'se encontro el substring: ', substring, ' en la posicion: ', pos asString. ]
	ifFalse: [ Transcript show: 'no se encontro el substring: ', substring ].