"Se tiene un arreglo de n números naturales que se quiere ordenar por frecuencia, y en caso de igual
frecuencia, por su valor. Por ejemplo, a partir del arreglo [1, 3, 1, 7, 2, 7, 1, 7, 3] se quiere obtener
[1, 1, 1, 7, 7, 7, 3, 3, 2]."

|arreglo frecuencias ordenar resultado|

arreglo := #(1 3 1 7 2 7 1 7 3).

frecuencias:= Dictionary new.

arreglo do: [:num|
	frecuencias at: num 
		ifPresent: [:c| frecuencias at: num put: c + 1.]
		ifAbsent: [frecuencias at: num put: 1.]. 
	 ].

ordenar := [:a :b|
	|fa fb|
	
	fa:= frecuencias at: a.
	fb:= frecuencias at: b.
	
	(fa = fb) ifTrue: [ a < b ] "de igual frecuencia, ordenar por valor"
				 ifFalse: [ fa > fb ]. "de frecuencias distintas, primero mayor frecuencia."
	 ].

resultado:= arreglo asSortedCollection: ordenar.

Transcript show: resultado asArray printString.