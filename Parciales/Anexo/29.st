| epsilon n_max n eActual eAnterior diferencia |

"1. Se solicitan los valores de control al usuario"
epsilon := (UIManager default request: 'Ingrese el valor de épsilon (ej: 0.0001):') asNumber.
n_max := (UIManager default request: 'Ingrese el número máximo de iteraciones:') asInteger.

"2. Inicialización de las variables"
n := 1.
eAnterior := 0.0. "Se inicializa en 0.0 para asegurar la primera iteración"
eActual := (1 + (1 / n)) ** n. "Cálculo del primer término donde n=1, el resultado es 2"
diferencia := (eActual - eAnterior) abs.

"3. Bucle principal de cálculo"
"Se ejecuta mientras la diferencia sea mayor o igual a epsilon Y no se supere el máximo de iteraciones."
[ (diferencia >= epsilon) and: [ n < n_max ] ] whileTrue: [
	n := n + 1.
	eAnterior := eActual. "El término actual pasa a ser el anterior"
	
	"Se calcula el nuevo término de la serie"
	eActual := (1 + (1 / n)) ** n.
	
	"Se calcula la diferencia en valor absoluto para la siguiente comprobación"
	diferencia := (eActual - eAnterior) abs.
].

"4. Se muestra el resultado en el Transcript"
Transcript clear.
Transcript show: 'El valor calculado de e es: ', eActual asFloat asString; cr.
Transcript show: 'Número de iteraciones realizadas: ', n asString.
