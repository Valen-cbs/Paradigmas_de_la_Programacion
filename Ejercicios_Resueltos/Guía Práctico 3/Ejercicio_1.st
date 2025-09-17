"Convertir una cadena a mayúsculas y minúsculas."

|cadena|

cadena:= 'hola como estas'.

1 to: cadena size do:[ :c |
    Transcript show: (cadena at: c) asUppercase.
].

"o simplemente"

Transcript show: cadena asUppercase.