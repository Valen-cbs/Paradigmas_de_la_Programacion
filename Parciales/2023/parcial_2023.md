# Parcial Recuperatorio 2023

## 1.


## 2.


## 3. ¿Cuál es la diferencia entre to: do:, timesRepeat y whileFalse?

```to: do:``` se utiliza para recorrer un rango con un índice.

```timesRepeat:``` se utiliza para repetir una acción n veces sin un índice.

```whileFalse:``` ejecuta un bloque hasta que la condición sea falsa.

## 4. ¿Que diferencia existe entre value y ^? 

```value``` Es un mensaje que se envía a un bloque y se utiliza para evaluar un bloque y devolver un resultado

```^``` Es un operador de retorno. Termina la ejecución de un bloque o del programa inmediatamente y devuelve un resultado.

## 5. (25%) Busque un elemento en un arreglo donde cada elemento tiene números en forma de string (ej. ‘25’ ‘23’ … ) y si el mismo es primo, devuelva su posición. Utilizar un bloque con dos parámetros de entrada.

```rb 
|arr esPrimo|

arr:=#('1' '2' '12' '7' '13' '5' '6' '8' '9').

esPrimo:= [ :str :pos|
	|elemento posicion cont|
	elemento:=str asInteger.
	posicion:=pos.
	cont:=0.
	2 to: elemento do: [ :i|
		((str asInteger)\\i = 0) ifTrue: [ cont:=cont+1 ].
		 ].
	(cont = 1) ifTrue: 'el numero: ', str, ' es primo, su posicion es: ', posicion asString
	ifFalse: ['el numero: ', str, ' no es primo']
	 ].


1 to: arr size do: [ :i|
	Transcript show: (esPrimo value: ((arr at: i)) value: i) asString; cr.
	 ].
```
## 6. (35%) Resolver los siguientes ejercicios:
### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a. Calcular la serie de: $z^{2 + j} \over (k + j!)$, para $n$ términos. $k$ y $j$
### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. constante.
### Plantear por lo menos dos soluciones, se debe elaborar el algoritmo de factorial y potencia. Se puede utilizar bloques.

```rb
|pot fact serie n m z|

pot:= [:a :b| "a a la b"
    |result|
    result:=1.
    (b = 0) ifTrue: result
    ifFalse: [
        1 to: b do: [
            result:=result * a.
            result.
        ].
    ].
].

fact:= [:n|
    |result|
    result:=1.
    (n>0) ifTrue: [
        1 to: n do: [:i|
            result:=result*i
        ]
        result.
    ]
    ifFalse: result.
].

serie:=0.
"asumo que k es variable."
n:= (UIManager default request: 'ingrese k')asInteger.
m:= (UIManager default request: 'ingrese j')asInteger.
z:= (UIManager default request: 'ingrese z')asInteger.

1 to: n do: [:k|
    1 to: m do: [:j|
        serie:=serie + (((pot value: z value: (z + j))) / (k + fact value: j))
    ].
].

Transcript show: serie asString.

```
