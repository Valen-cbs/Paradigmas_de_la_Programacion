"Ídem anterior, pero contar la cantidad de palabras que terminan con una letra determinada"
|frase letra|

frase := 'hola como estas'.

letra:= $s.

frase:= frase findTokens: ' '. 

cant:=frase count: [ :i | (i at: i size) = letra ].

Transcript show: cant asString