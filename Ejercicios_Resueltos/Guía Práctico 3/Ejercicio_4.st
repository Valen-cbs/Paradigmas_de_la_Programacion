"Contar la cantidad de vocales de una frase."

|cadena cant|

cadena:='hola como estas'.
cant:=0.
1 to: (cadena size) do: [:c| 
	((cadena at: c) isVowel) 
    ifTrue: [ cant:=cant + 1 ].
].

Transcript show: 'la cantidad de vocales que tiene es: ', cant asString.