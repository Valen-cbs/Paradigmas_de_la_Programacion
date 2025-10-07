"b) Llenando de adentro hacia afuera de valores enteros en forma creciente.
   Nota: la matriz debe ser cargada en un arreglo unidimensional."

| n matriz num fila columna direccion pasosPorSegmento contadorDePasos cambiosDeDireccion |

"Se solicita al usuario un tamaño n para la matriz"
n := (UIManager default request: 'Ingrese el tamaño n de la matriz:') asInteger.

"Se inicializa el arreglo unidimensional que representará la matriz"
matriz := Array new: (n * n).

"Se calculan las coordenadas iniciales. Esta fórmula funciona para n par e impar."
fila := (n // 2) + 1.
columna := (n // 2) + 1.

"Inicialización de las variables de control del bucle"
num := 1.
direccion := 0. "0=Izquierda, 1=Abajo, 2=Derecha, 3=Arriba"
pasosPorSegmento := 1.
contadorDePasos := 0.
cambiosDeDireccion := 0.

"Bucle principal que se ejecuta mientras no se haya llenado la matriz"
[ num <= (n * n) ] whileTrue: [
    "1. Colocar el número en la posición actual (fila, columna)"
    matriz at: (((fila - 1) * n) + columna) put: num.

    "2. Mover a la siguiente posición según la dirección actual"
    (direccion = 0) ifTrue: [ columna := columna - 1 ].
    (direccion = 1) ifTrue: [ fila := fila + 1 ].
    (direccion = 2) ifTrue: [ columna := columna + 1 ].
    (direccion = 3) ifTrue: [ fila := fila - 1 ].

    "3. Actualizar contadores"
    contadorDePasos := contadorDePasos + 1.
    num := num + 1.

    "4. Verificar si se completó un segmento para cambiar de dirección"
    (contadorDePasos = pasosPorSegmento) ifTrue: [
        direccion := (direccion + 1) \\ 4. "Cambia a la siguiente dirección (0,1,2,3)"
        contadorDePasos := 0.
        cambiosDeDireccion := cambiosDeDireccion + 1.

        "Cada dos cambios de dirección, se incrementa la longitud del segmento"
        (cambiosDeDireccion = 2) ifTrue: [
            pasosPorSegmento := pasosPorSegmento + 1.
            cambiosDeDireccion := 0.
        ].
    ].
].

"Imprimir la matriz resultante en el Transcript"
Transcript clear.
Transcript show: 'Matriz Caracol (Adentro hacia Afuera):'; cr.
1 to: n do: [:i |
    | filaString |
    filaString := ''.
    1 to: n do: [:j |
        "Se concatena cada número para formar una fila legible"
        filaString := filaString, ' ', ((matriz at: (((i - 1) * n) + j)) asString).
    ].
    Transcript show: filaString; cr.
].
