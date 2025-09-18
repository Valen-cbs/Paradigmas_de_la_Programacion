"Dos números se dicen amigos cuando uno de ellos es igual a la suma de todos los divisores del otro excepto el mismo. Ejemplo: los números 220 (1+2+4+5+10+11+20+22+44+55+110=284) y 284
(1+2+4+71+142=220) son amigos. Escriba un método booleano que permita discernir si dos números (parámetros) son amigos."

|sonAmigos|

sonAmigos:= [:n :m|
|div_n div_m|
div_n:=0. div_m:=0.

	1 to: (n-1) do: [:i| 
		(n \\i = 0) ifTrue:[div_n:=div_n + i].
		 ].
 	1 to: (m-1) do: [:i| 
		(m \\i = 0) ifTrue:[div_m:=div_m + i].
		 ].
	^ div_n = m and: (div_m = n).
	 ].


sonAmigos value: 220 value: 285