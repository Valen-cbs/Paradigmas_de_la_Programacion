|cadenaOriginal palabras cadenaTransf cadenaSalida|

cadenaOriginal := '   hola  como estas   valentino y oriana belennn    aguilar cabas '.
cadenaSalida:=''.
palabras:= cadenaOriginal findTokens: ' '.

cadenaTransf := palabras collect: [ :p|
	(p size > 5) ifTrue: [ 
		(p copyFrom: 1 to: 5), '@'.
		 ]
	ifFalse: [ 
		p
		 ].
	
	 ].

cadenaTransf do: [ :p|
	cadenaSalida:= cadenaSalida , p ,' '.
	 ].

cadenaSalida := cadenaSalida copyFrom: 1 to: (cadenaSalida size - 1).

^cadenaSalida