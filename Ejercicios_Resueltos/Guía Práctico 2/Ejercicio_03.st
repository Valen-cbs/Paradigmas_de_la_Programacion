"Realizar x^y sin utilizar la operación potencia."
|x y result|

x:=(UImanager default request: 'ingrese la base') asInteger.
y:=(UImanager default request: 'ingrese el exponente') asInteger.
result:=1.

potencia:= [ 
	result:=result*x.
	y:=y-1.
].

[ y > 0 ] whileTrue: potencia.

(y=0 and: x~=0) ifTrue: [ 
	result:=1.
].

Transcript show: result; cr