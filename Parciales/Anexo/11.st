| frase palabrasSinRepetir palabras fraseFinal|

frase := 'esta es una frase con palabras repetidas para probar el ejercicio de palabras repetidas'.

"Separamos la frase en una colección de palabras"
palabras := frase findTokens: ' '.

"Usamos una OrderedCollection para mantener el orden de aparición"
palabrasSinRepetir := OrderedCollection new.

"Iteramos sobre cada palabra de la frase original"
palabras do: [:unaPalabra |
	"Si la palabra no está en nuestra nueva colección, la agregamos"
	(palabrasSinRepetir includes: unaPalabra) ifFalse: [
		palabrasSinRepetir add: unaPalabra.
	].
].

"Si se desea reconstruir la frase"

fraseFinal := ''.
1 to: palabrasSinRepetir size do: [:i |
	fraseFinal := fraseFinal, (palabrasSinRepetir at: i), ' '.
].
fraseFinal:= fraseFinal copyFrom: 1 to: fraseFinal size -1.
Transcript show: fraseFinal.