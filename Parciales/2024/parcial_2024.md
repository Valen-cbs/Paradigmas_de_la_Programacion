# 1er Parcial Práctico 2024

## 1. 

### Cifrado por desplazamiento de n caracteres. Ingresar una frase y cifrarla siguiendo la regla de desplazamiento de César. Utilizar como valor de desplazamiento el día de la semana. Ejemplo: Dom=1, Lun=2, ...

```st
|desp frase|
desp:= Date today dayOfWeek.

frase:= 'hola mundoz.'.

1 to: frase size do: [ :i| 
	|char|
	char:=frase at: i.
	(char isLetter) ifTrue: [
		char:= ((char asInteger) + desp) asCharacter.
		(char isLetter) 
		ifTrue: [ frase at: i put: char.]
		ifFalse: [ 
			char:=((char asInteger) - 26) asCharacter.
			frase at: i put: char.].
		].
	 ].
 Transcript show: frase.
```
## 2.
### Calcule el número e utilizando la serie descubierta por Newton:
### $\sum_{k=0}^{\infty} \frac{1}{k!} \approx e$

### **Nota:** analizar si es posible optimizar el cálculo de cada término.  
No utilizar el método factorial existente en Smalltalk.

```st
|serie fact n|
fact:=1.
n:= (UIManager default request: 'ingrese un numero para hacer la serie.') asInteger.
serie:=0.
0 to: n do: [:i|
	(i = 0) 
	ifTrue: [ serie:=serie + 1] "es el primer valor, 1/0! donde 0! = 1"
	ifFalse: [ 
		fact:=fact*i.
		serie:=serie + (1/fact). 
		].
	 ].
Transcript show: serie asFloat .
```

## 3.
### Las colecciones en Smalltalk son objetos que contienen un grupo de otros objetos. Una colección puede contener objetos sencillos como caracteres o de mayor complejidad como ser arreglo.
### Marque la opción correcta: 
- [X] Verdadero 
- [ ] Falso

## 4.
### Dado el siguiente arreglo:

```st 
arr:= #(#($a $b ‘parcial’ 5) ‘paradigmas’) 
```
### Indicar cómo reemplazar ‘parcial’ por la palabra ‘PARCIAL’.

### Solución:
```st
|modif arr|
arr:= #(#($a $b 'parcial' 5) 'paradigmas') .
modif:=((arr at: 1) at: 3) asUppercase.
(arr at: 1) at: 3 put: modif.
Transcript show: arr.
```


## 5.
### Dada la siguiente expresión:
```st
| z q a |
z:=3. 
t=6. 
q:=q. 
a:= #(31 25 18). 
a do: [:c | Transcript show: (c sqrtFloor * 1); cr. ].
```
### En el caso de errores u operaciones sin sentido, corregirlas. ¿Cuál sería el resultado?

### Solución:

```st
| a |
a:= #(31 25 18). 
a do: [:c | Transcript show: c sqrtFloor; cr. ].
```
### Explicación: 
La primer línea de código ```z:=3.``` esta correcta sintácticamente, aunque es inútil ya que luego no se utiliza a la variable z. 

La segunda linea de código: ```t=6.``` está mal debido a que no es correcta la asignación, además la variable t no esta definida previamente.

La tercer línea de código: ```q:=q.``` no tiene errores sintácticos, q vale nil y es el valor que vuelve a tomar la variable, pero no tiene sentido realizarla, además no se la utiliza a futuro a dicha variable.

Todo lo demás está bien, salvo lo siguiente: ```(c sqrtFloor * 1)```, debido a que multiplicar por 1 a un número no tiene sentido.


