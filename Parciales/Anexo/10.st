"Dado un string de entrada y un substring, quitar del string original el substring en cuestión. Ej.
‘Necesito practicar mas Smalltalk sino no llego a los parciales’, quitar: ‘si’-> ‘Neceto practicar mas
Smalltalk no no llego a los parciales’"

|string quitar i|

string:= 'Necesito practicar mas Smalltalk sino no llego a los parciales'.
quitar:= 'si'.
i:=1.

[i+quitar size -1 <= string size] whileTrue: [
    |temp|
    temp:= string copyFrom: i to: i + quitar size - 1.
    (temp = quitar) ifTrue: [
        string:=(string copyFrom: 1 to: i-1) , (string copyFrom: i + quitar size to: string size).
        i:=i-quitar size. (i<=0) ifTrue: [ i:=1. ]
    ].
    i:=i+1.
].

^string


