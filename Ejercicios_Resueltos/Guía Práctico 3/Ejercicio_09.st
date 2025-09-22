"A partir de una frase ingresada por el usuario contar la cantidad de palabras que empiezan con una
determinada letra (también ingresada por el usuario)"

|frase letra|
"ingresar la frase y la letra con UIManager, pero es mas facil de verlo asi"

frase := 'hola como estas'.

letra:= $c. "letra := (UIManager default request: 'ingrese una letra') at: 1."

frase:= frase findTokens: ' '. 

cant:=frase count: [ :i | (i at: 1) = letra ].

Transcript show: cant asString

"frase do: [ :c |
	((c at: 1) = letra) ifTrue: [cant:=cant + 1].
	 ]."