|arr filas columnas i j|

arr:=#(10 100 1000 20 200 2000 30 300 3000 40 400 4000).

"
10 100 1000
20 200 2000
30 300 3000
40 400 4000
"

filas:=4.
columnas:=3.
i:=2. "fila"
j:=2. "columna"
"formula de prueba"
Transcript show: (arr at: ((i-1)*(columnas) + j)) asString. "posicion 32"

"Carga interactiva"
i:= (UIManager default request: 'ingrese filas: ') asInteger.
j:= (UIManager default request: 'ingrese columnas: ') asInteger.
arr:= Array new: (i*j).
1 to: i do: [:fil|
	1 to: j do: [ :col|
		arr at: (((fil - 1)* j) + col) put: ((UIManager default request: 'ingrese fila: ', fil asString, ' columna: ', col asString ) asInteger).
		 ].
	  ].
Transcript clear.
Transcript show: arr asString.