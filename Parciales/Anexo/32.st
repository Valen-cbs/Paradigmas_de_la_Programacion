|matriz n num col salida|

n:=3.
matriz:=Array new: (n*n).
salida:=Array new: (n*n).
num:=1.
1 to: n do: [ :i|
	1 to: n do: [ :j|
		matriz at: ((i-1)*n + j) put: num. num:=num+1.
		 ].
	 ].
col:=n.
1 to: n do: [ :i|
	1 to: n do: [ :j|
		|indice valor|
		indice:=(j-1)*n+col.
		valor:=matriz at: ((i-1)*n + j).
		salida at: indice put: valor.
		 ].
	col:=col-1.
	 ].
^salida.
