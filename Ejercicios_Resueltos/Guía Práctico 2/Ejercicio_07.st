"Dado un número determinar sus múltiplos."
|n m|
n:= (UIManager default request: 'ingrese un numero') asInteger.
m:=n.

[m > 1] whileTrue: [ 
	(n \\ m = 0) ifTrue: [ 
		Transcript show: ' ', m asString, ' es multiplo.'; cr.
		 ].
	m:=m-1.
	 ]. 


Transcript show: 'Fin del cálculo'; cr.