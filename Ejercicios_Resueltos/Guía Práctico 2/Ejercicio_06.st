"Solicitar el ingreso de un nº y verificar si este es o no primo."
"Idem anterior, decir si es par o impar"
| n validarPrimo resultado |

n := (UIManager default request: 'Ingrese un número') asNumber.

validarPrimo := [:num |
    | m cont salida |
    m := num.
    cont := 0.
    [ m > 1 ] whileTrue: [ 
        (num \\ m = 0) ifTrue: [ cont := cont + 1 ].
        m := m - 1.
    ].
		salida:=''.
    (cont = 1)
        ifTrue: [ salida:=salida, 'es primo.']
        ifFalse: [ salida:=salida, 'no es primo.' ].
	 (num \\ 2 = 0)
		  ifTrue: [ salida:= salida, ' Es par']
		  ifFalse: [ salida:=salida, ' Es impar'].
].

resultado := validarPrimo value: n.
UIManager default alert: resultado.
