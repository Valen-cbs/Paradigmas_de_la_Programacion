# 1er Parcial Práctico 2019

## 1. (40%) Cargar e imprimir una matriz caracol de n x n, llenándola de afuera hacia adentro. Ejemplo:

| 1 | 2 | 3 |
|---|---|---|
| 8 | 9 | 4 |
| 7 | 6 | 5 |

### Solución:
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

