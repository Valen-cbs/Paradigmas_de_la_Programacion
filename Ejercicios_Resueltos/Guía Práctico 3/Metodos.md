## Diferencias entre `collect:`, `select:` y `count:` en Pharo

En Pharo, las colecciones tienen métodos de alto nivel para transformarlas, filtrarlas o contarlas.  
Estos son los tres más usados:

### `collect:`
- **Transforma** cada elemento.
- Devuelve una colección del mismo tamaño que la original.
```st
#(1 2 3 4) collect: [ :n | n * 2 ].
" => #(2 4 6 8)"
```
### `select:`
- **Filtra** elementos que cumplen con una condición.
- Devuelve un subconjunto de la colección original.
```st
#(1 2 3 4) select: [ :n | n odd ].
" => #(1 3)"
```
### `count:`
- **Cuenta** cuántos elementos cumplen con una condición.
- Devuelve un número.

```st
#(1 2 3 4) count: [ :n | n odd ].
" => 2"
```

## Ejemplo práctico con palabras en mayúscula
```st
frase := 'hola COMO ESTAS hoy'.
palabras := frase findTokens: ' '.

"Contar cuántas están en mayúscula"
palabras count: [ :w | w = w asUppercase ].
" => 2"

"Seleccionar las palabras en mayúscula"
palabras select: [ :w | w = w asUppercase ].
" => #('COMO' 'ESTAS')"

"Transformar todas a minúscula"
palabras collect: [ :w | w asLowercase ].
" => #('hola' 'como' 'estas' 'hoy')"
```
