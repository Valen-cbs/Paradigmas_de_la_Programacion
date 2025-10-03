"Calcular el producto de dos números aplicando la técnica de multiplicación árabe"

|n m filas col matriz resultado diagonales num|

n:=(UIManager default request: 'Ingrese el multiplicador') asInteger.
m:= (UIManager default request: 'Ingrese el multiplicando') asInteger.
filas:=n asString size.
col:=m asString size.

matriz:= Array2D rows: filas columns: col.

1 to: filas do: [ :i|
	1 to: col do: [ :j|
		matriz at: i at: j put: (Array new: 2 withAll:0).
		 ].
	 ].

1 to: filas do: [ :i|
	1 to: col do: [ :j|
		|valor|
		valor:=(((n asString) at:i) digitValue) * (((m asString) at: j) digitValue).
		(valor > 9) ifTrue: [ (matriz at: i at: j) at: 1 put: (valor //10) ].
		(matriz at:i at:j) at: 2 put: (valor \\ 10).
		 ].
	 ].
diagonales:= filas + col.
resultado:= Array new: diagonales withAll:0.
1 to: filas do: [ :i|
	1 to: col do: [ :j|
		|valor pos|
		valor:=(matriz at: i at: j)	at: 1.
		pos:= filas + j - i.
		resultado at: pos put: ((resultado at: pos) + valor).
		valor:= (matriz at: i at: j) at: 2.
		pos:=pos+1.
		resultado at: pos put: ((resultado at: pos) + valor). 
		 ].
	].

diagonales to: 1 by:-1 do: [ :d|
	|valor|
	valor:=resultado at: d.
	(valor > 9) ifTrue: [ 
		resultado at: (d-1) put: ((resultado at: (d-1)) + (valor//10)).
		resultado at: d put: (valor\\10).
		].
	 ].
num:=0.
resultado do: [ :pos|
	num:=num*10 + pos.
	 ].

Transcript show: 'El resultado de: ', n asString, ' x ', m asString, ' = ', num asString.
UIManager default alert: 'El resultado de: ', n asString, ' x ', m asString, ' = ', num asString.
