"Ingresar dos cadenas y devolver una 3º que contenga los elementos de las 2 anteriores pero intercalados"

|cad1 cad2 cad3|
cad1:= 'Primer cadena'.
cad2:= 'Segunda'.
cad3:=''.

(cad1 size >= cad2 size) ifTrue: [
	1 to: cad2 size do: [ :c |
		cad3:= cad3, (cad1 at: c) asString.
		cad3:= cad3, (cad2 at: c) asString. 	
		 ].
	((cad1 size) + 1) - ((cad1 size) - (cad2 size)) to: cad1 size do:[ :i |
		cad3:= cad3, (cad1 at: i) asString.
		].
	]
ifFalse: [ 
	1 to: cad1 size do: [ :c |
		cad3:= cad3, (cad1 at: c) asString.
		cad3:= cad3, (cad2 at: c) asString. 	
		 ].
	((cad2 size) + 1) - ((cad2 size) - (cad1 size)) to: cad2 size do:[ :i |
		cad3:= cad3, (cad2 at: i) asString.
		].
].


Transcript clear.
Transcript show: cad3.