"Convertir un número en el sistema decimal al sistema binario."
|dec oc|

dec:=(UIManager default request: 'ingrese un numero en decimal') asInteger .
oc:=OrderedCollection new.

[ dec > 0 ] whileTrue: [ 
	oc add: (dec \\ 2).
	dec:= dec // 2.
	 ].

oc:= oc reverse asString.
oc:= oc copyFrom: 22 to: (oc size) - 1.
Transcript show: 'el numero en binario es: ', oc .
