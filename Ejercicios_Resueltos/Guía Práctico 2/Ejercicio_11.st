" Ingresar 2 polinomios y realizar la suma y el producto de ambos"
|ec1 ec2 res n m|

n:=(UIManager default request: 'ingrese el grado de la ecuacion mas grande') asInteger.
m:=n.

ec1:= Array new: n withAll: 0.
ec2:= Array new: m withAll: 0.
res:= Array new: n.

1 to: n do: [ :i |
	ec1 at: i put: (UIManager default request: ('ingrese el termino nro: ', i asString)) asInteger.
	 ].

1 to: m do: [ :i |
	ec2 at: i put: (UIManager default request: ('ingrese el termino nro: ', i asString)) asInteger.
	 ].

1 to: (res size) do: [ :i |
	res at: i put: ((ec1 at: i) + (ec2 at: i))
	 ].

1 to:(res size) do: [:i| 
	Transcript show: ((res at: i) asString).
	(i>1) ifTrue: [ Transcript show: 'x^', i asString].
	(i < res size) ifTrue: [ Transcript show: ' + ' ].
	]. 