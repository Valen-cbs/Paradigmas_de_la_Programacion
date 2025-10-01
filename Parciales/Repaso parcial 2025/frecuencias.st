"dada una frase, contar la frecuencia de cada letra usando solo arreglos."
|frecu frase band car|
frase:='hola como estas'.
frecu:=Array new.
band:=false.

1 to: frase size do: [ :i|
	((frase at:i) isLetter) ifTrue: [ 
		car:= frase at: i.
	1 to: frecu size by:2 do: [ :j|
		((frecu at: j) = car) ifTrue: [ frecu at: (j+1) put: ((frecu at: (j+1))+1). band:=true. ].
		 ].
	(band = false) ifTrue: [ frecu:=frecu, {car . 1}. band:=false. ].
	 ].
].
Transcript show: frecu asString.
