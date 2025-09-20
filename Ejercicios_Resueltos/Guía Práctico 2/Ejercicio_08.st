"Escribir un programa que ingrese un listado de números e informe la cantidad de múltiplos de 2, 3,
5 y 7."

|oc cond cant correct| 
oc:= OrderedCollection new. 
correct:= OrderedCollection new. 
cond:='no'. 

[ cond = 'no' ] whileTrue: [ 
	oc add: (UIManager default request: 'ingrese una lista de numeros: ') asInteger. 
	cond:= (UIManager default request: 'desea terminar?'). ] .
cant:=0.
1 to: oc size do: [:i| 
	(((((oc at: i) \\ 2 = 0) 
	and: ((oc at: i) \\ 3) = 0) 
	and: ((oc at:i )\\ 5) = 0) 
	and: ((oc at: i) \\ 7) = 0) 
	ifTrue: [ cant:=cant + 1.
		correct add: (oc at: i).
		 ].
	 ].

UIManager default alert:
    (cant = 0
        ifTrue: ['No hay múltiplos de 2, 3, 5 y 7.']
        ifFalse: ['Hay ', cant asString, ' múltiplos de 2, 3, 5 y 7. Estos son: ', correct asArray printString.]).