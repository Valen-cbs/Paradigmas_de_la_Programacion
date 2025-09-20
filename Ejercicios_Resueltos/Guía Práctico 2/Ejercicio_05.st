"Solicitar el ingreso de un nº y verificar si este es o no primo."

| n validarPrimo resultado |

n := (UIManager default request: 'Ingrese un número') asNumber.

validarPrimo := [:num |
    | m cont |
    m := num.
    cont := 0.
    [ m > 1 ] whileTrue: [ 
        (num \\ m = 0) ifTrue: [ cont := cont + 1 ].
        m := m - 1.
    ].
    (cont = 1)
        ifTrue: [ 'es primo' ]
        ifFalse: [ 'no es primo' ].
].

resultado := validarPrimo value: n.

UIManager default alert: resultado.
