"Dada una cadena de entrada, devolver otra en la que los caracteres en mayúsculas hayan sido
cambiados por caracteres en minúsculas y viceversa."

|cadena|

cadena:='Esto Es una CadenA'.

1 to: cadena size do: [ :i |
    cadena at: i put: (cadena at: i) asLowercase. "asUppercase en caso contrario."
].

Transcript show: cadena.