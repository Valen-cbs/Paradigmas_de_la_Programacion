"Dada una cadena de entrada, devolver otra en la cual las palabras estén en formato ‘tipo título’."
| cadena capitalizarProxima |
cadena := 'hola comO esTAs.'.
capitalizarProxima := true.

1 to: cadena size do: [:i |
  | ch |
  ch := cadena at: i.
  (ch = $ )
    ifTrue: [ capitalizarProxima := true ]   "después de espacio, capitalizar próxima letra"
    ifFalse: [
      (capitalizarProxima and: [ ch isLetter ])
        ifTrue:  [ cadena at: i put: ch asUppercase. capitalizarProxima := false ]
        ifFalse: [ cadena at: i put: ch asLowercase ] ].
].

Transcript show: cadena.