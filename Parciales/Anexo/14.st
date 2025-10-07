|frase murcielago|

murcielago := #($m $u $r $c $i $e $l $a $g $o).

frase:= 'hola murcielago como estas'.
frase:=frase asLowercase.

1 to: frase size do: [ :c|
	|car|
	car:=(frase at: c).
	1 to: murcielago size do: [ :i|
		(car = (murcielago at: i)) ifTrue: [ 
			frase at: c put: (i-1) asString first.
			 ].
		 ]
	 ].
Transcript show: frase
