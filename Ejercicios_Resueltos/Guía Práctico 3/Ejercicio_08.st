"Dada una frase contar la cantidad de palabras en mayúsculas"
| frase palabras cant |
frase := 'hola COMO ESTAS hoy'.
palabras := frase findTokens: ' '.

cant := palabras count: [ :w | w = w asUppercase ]. "comparo la cadena original con su respectiva conversion a mayusculas"

Transcript show: cant asString.
