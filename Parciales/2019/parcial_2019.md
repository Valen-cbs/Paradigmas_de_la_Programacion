# 1er Parcial Práctico 2019

## 1. (40%) Cargar e imprimir una matriz caracol de n x n, llenándola de afuera hacia adentro. Ejemplo:

| 1 | 2 | 3 |
|---|---|---|
| 8 | 9 | 4 |
| 7 | 6 | 5 |

### Solución 1:
```st
|n matriz top bottom right left num|

n:=7.

matriz:= Array new: n.

1 to: n do: [ :i |
	matriz at: i put: (Array new: n).
	 ].

top:=1.
bottom:=n.
right:=n.
left:=1.
num:=1.

[ (top <= bottom) and: (left <= right) ] whileTrue: [ 
	"de izquierda a derecha"
	left to: right do: [ :j |
		(matriz at: top) at: j put: num. num:=num + 1.
		 ].
	top:=top+1.
	
	"de arriba a abajo"
	top to: bottom do: [ :i |
		(matriz at: i) at: right put: num. num:=num + 1.
		 ].
	right:=right - 1.
	
	"de derecha a izquierda"
	(right to: left by: -1) do: [ :j |
		(matriz at: bottom) at: j put: num. num:=num + 1.
		 ].
	bottom :=bottom - 1.
		
	"de abajo a arriba"
	(bottom to: top by:-1) do: [ :i |
		(matriz at: i) at: left put: num. num:=num+1.
		 ]. 
	left:=left + 1.
	 ].

1 to: n do: [ :i |
	Transcript show: (matriz at: i); cr.
	 ].
```
### Solución 2:
```st
"matriz caracol nxn"

|matriz n izq der arriba abajo num indice|

n:= (UIManager default request: 'ingrese un numero')asInteger.
matriz:=Array new: n*n.
num:=1. arriba:=1. abajo:=n. izq:=1. der:=n.

[ arriba <=abajo and: [izq <=der ] ] whileTrue: [
    "izq a der"
    izq to: der do: [ :j| 
        indice:=(arriba -1)*n + j.
        matriz at: indice put: num. num:=num+1.
    ].

    arriba:=arriba+1.
    "arriba a abajo"
    arriba to: abajo do: [ :i| 
        indice:=(i-1)*n + der.
        matriz at: indice put: num. num:=num+1.
    ].

    der:=der-1.
    "der a izq"
    der to: izq by:-1 do: [ :j| 
        indice:=(abajo-1)*n+j.
        matriz at: indice put: num. num:=num+1.
    ].

    abajo:=abajo-1.
    "abajo a arriba"
    abajo to: arriba by:-1 do: [ :i| 
        indice:=(i-1)*n+izq.
        matriz at: indice put: num. num:=num+1.
    ].
    izq:=izq+1.
].

1 to: n do: [ :i| 
    1 to: n do: [:j| 
        indice:=(i-1)*n + j.
        Transcript show: (matriz at: indice) asString, ' '.
    ].
    Transcript show: ' ' ;cr.
].

```


## 2.

## 3.

## 4. **(40%) Calcule el valor de Pi teniendo en cuenta la serie de Leibniz:**


### **$\sum_{n=0}^{\infty} \frac{(-1)^n}{2n+1} = \frac{\pi}{4}$**


```st
"serie de pi"

|serie n|

n:=100000.

serie:=0.

0 to: n do: [:i|
    serie:= serie + (((1 negated)**i) / ((2*i) + 1))
    ].

serie:=4*serie.

Transcript show: serie asFloat asString.
```


