"Realizar un algoritmo que lea una serie de números reales y verifique si están ordenados ascendentemente o no, informando por pantalla."

|oc fin|

oc:=OrderedCollection new.
fin:='no'.
[ fin = 'no' ] whileTrue: [
	oc add: ((UIManager default request: 'ingrese numeros reales.') asNumber)asFloat..
	fin:= UIManager default request: 'desea terminar si/no'.
].


oc isSorted.
"no pide, pero si pidiera en orden descendente, creo un bloque que verifique y uso el metodo isSortedBy:"
"descendente:= [ :a :b| a>b]. 
oc isSortedBy: descendente."