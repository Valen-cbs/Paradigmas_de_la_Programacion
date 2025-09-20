"Solicitar al usuario que ingrese los coeficientes de una ecuación cuadrática, calcular sus raíces y
mostrarlas"

|a b c x1 x2|

"a:= (UIManager default request: 'ingrese a') asNumber.
b:= (UIManager default request: 'ingrese b') asNumber.
c:= (UIManager default request: 'ingrese c') asNumber."
a := 2.
b := 0.
c := -2.

((b ** 2 - 4 * a * c) >= 0)
    ifTrue: [  
        x1 := (b negated + (b ** 2 - 4 * a * c) sqrt) / (2 * a).
        x2 := (b negated - (b ** 2 - 4 * a * c) sqrt) / (2 * a).

        UIManager default alert: 
            'X1 = ', x1 printString, String cr,
            'X2 = ', x2 printString.
    ]
    ifFalse: [
        UIManager default alert: 'La ecuación tiene raíces complejas'.
    ].
