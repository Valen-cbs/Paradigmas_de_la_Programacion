"Dado un texto terminado en punto, determinar cuál es la vocal que aparece con mayor frecuencia"
|texto vocales mayor pos z|

texto:= 'Lorem ipsum dolor sit amet consectetur adipiscing elit dictum nisi, 
vivamus ligula aliquet praesent cursus pulvinar sagittis orci, luctus condimentum duis metus vitae magna nulla integer. 
Luctus sociosqu mi ridiculus placerat cubilia mauris ante, consequat ligula vestibulum sociis facilisi imperdiet diam orci, 
cras et augue netus rutrum inceptos. Urna non posuere tristique ultrices hac nascetur ad, senectus massa a est ornare.'.

vocales:=#(0 0 0 0 0).

texto:=texto findTokens: '.'.

texto do: [:c| 
    c do: [:i|
        (i isVowel) ifTrue: [
            (i = $a) ifTrue: [vocales at: 1 put: ((vocales at: 1) + 1) ].
            (i = $e) ifTrue: [vocales at: 2 put: ((vocales at: 2) + 1) ].
            (i = $i) ifTrue: [vocales at: 3 put: ((vocales at: 3) + 1) ].
            (i = $o) ifTrue: [vocales at: 4 put: ((vocales at: 4) + 1) ].
            (i = $u) ifTrue: [vocales at: 5 put: ((vocales at: 5) + 1) ].
        ].
    ].
].
mayor:=0.
z:=1.
vocales do: [:c|
    (c > mayor) ifTrue:[
        mayor:=c.
        pos:=z
    ].
    z:=z+1.
].

(pos = 1) ifTrue: [Transcript show: 'la vocal mas repetida es la a'].
(pos = 2) ifTrue: [Transcript show: 'la vocal mas repetida es la e'].
(pos = 3) ifTrue: [Transcript show: 'la vocal mas repetida es la i'].
(pos = 4) ifTrue: [Transcript show: 'la vocal mas repetida es la o'].
(pos = 5) ifTrue: [Transcript show: 'la vocal mas repetida es la u'].

Transcript show: vocales asString.





