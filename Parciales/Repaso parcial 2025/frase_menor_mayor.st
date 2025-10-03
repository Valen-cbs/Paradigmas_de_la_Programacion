"encontrar la letra mas chica y mas grande segun el abecedario en un string"
| frase mayor menor |

frase:='hola como estasZ' asLowercase.

mayor:= (frase at: 1) asciiValue.
menor:= (frase at: 1) asciiValue.

1 to: frase size do: [ :i|
	| letra |
	((frase at: i) isLetter) ifTrue: [
		letra:=(frase at: i) asciiValue.
		(letra > mayor) ifTrue: [ mayor:=letra ].
		(letra < menor) ifTrue: [ menor:=letra ].
	 ].
].

mayor:=mayor asCharacter asString.
menor:=menor asCharacter asString.

Transcript show: 'el menor es: ', menor, ' y el mayor: ', mayor.
