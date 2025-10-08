<a name="header"></a><a name="content"></a><!-- Este apunte se basa en las notas tomadas en clase sobre Smalltalk. Se han organizado los conceptos, añadido explicaciones más detalladas y ejemplos adicionales. Las citas provienen de referencias públicas para dar contexto a conceptos como los tipos de mensajes, la precedencia y las estructuras de control. Entre corchetes se indican las referencias. -->
# <a name="apuntes-de-smalltalk"></a>Apuntes de Smalltalk
Smalltalk es un lenguaje **orientado a objetos** donde *todo* es un objeto y el trabajo se realiza enviando mensajes a esos objetos. No hay funciones que se llamen directamente; cada vez que se invoca una operación se está enviando un mensaje a un receptor. La documentación resalta que los mensajes pueden ser de tres tipos (unarios, binarios y de palabra clave) y que tienen un orden de precedencia de evaluación: *unario* > *binario* > *de palabra clave[\[1\]](https://jcsites.juniata.edu/faculty/rhodes/lt/smalltalk.htm#:~:text=Precedence%2C%20highest%20to%20lowest%3A%20unary%2C,can%20be%20overridden%20by%20parentheses)*.
## <a name="literales-y-tipos-básicos"></a>Literales y tipos básicos
En Smalltalk existen distintos literales para representar cadenas, caracteres, símbolos y colecciones:

|Literal|Descripción y ejemplo|
| :- | :- |
|'cadena de caracteres'|Cadena de texto. Puede contener espacios y se delimita con comillas simples. Ej.: 'Hola mundo'.|
|$a|Carácter individual. Utiliza el signo de dólar para indicar un carácter, por ejemplo $A representa la letra A.|
|#arreglo|Un símbolo (identificador interno). Los símbolos se utilizan como claves en diccionarios o como nombres de mensajes. Ej.: #size es el selector del mensaje size.|
|#(1 2 3)|Literal de **Array**. Entre paréntesis se enumeran los elementos separados por espacios. Puede mezclar tipos distintos: #(4 'cinco' 6 7) crea un array de cuatro elementos, donde el segundo es una cadena.|
### <a name="concatenación-con-la-coma"></a>Concatenación con la coma ,
La coma , es un mensaje que **concatena** dos secuencias del mismo tipo. Se utiliza para unir dos cadenas o dos colecciones, creando una nueva colección del mismo tipo. Por ejemplo:

'Hola ', 'mundo'             "Une dos cadenas y devuelve 'Hola mundo'"\
#(1 2 3), #(4 5 6)          "Concatena dos arrays y devuelve #(1 2 3 4 5 6)"\
('Hola ', 'mundo') size     "El resultado es una cadena de 10 caracteres"

**Nota:** no es posible concatenar dos caracteres con , porque el resultado sería una cadena de longitud 2 y no un carácter. Si se desea obtener una cadena a partir de caracteres individuales, puede enviarse el mensaje asString a cada carácter y luego concatenar las cadenas.
## <a name="variables-y-asignación"></a>Variables y asignación
En Smalltalk las variables **no se tipan**; cualquier variable puede contener un objeto de cualquier clase. Las variables se declaran en la cabecera de un método o bloque, utilizando barras verticales | para delimitar las temporales. La documentación distingue tres clases de variables: variables de clase, de instancia y locales[\[2\]](https://jcsites.juniata.edu/faculty/rhodes/lt/smalltalk.htm#:~:text=Variables%20are%20untyped%20and%20are,variables%20are%20found%20in%20Smalltalk). La asignación se realiza con := o \_[\[3\]](https://jcsites.juniata.edu/faculty/rhodes/lt/smalltalk.htm#:~:text=Assignment%20statements).

Ejemplo de variables locales y asignación:

| miArreglo arrayDiez miDiccionario |\
\
miArreglo := Array new: 5.             "crea un array vacío de 5 posiciones"\
miArreglo at: 1 put: 3.               "pone el valor 3 en la primera posición"\
\
"Inicializa un array de tres elementos, todos con el valor 10"\
arrayDiez := Array new: 3 withAll: 10.\
\
miDiccionario := Dictionary new: 5.    "crea un diccionario capaz de almacenar cinco entradas"
## <a name="mensajes-y-precedencia"></a>Mensajes y precedencia
En Smalltalk, el orden en el que se evalúan los mensajes es esencial:

1. **Mensajes unarios**: no llevan argumentos, su selector es una palabra alfabética. Ejemplo: 5 factorial envía el mensaje factorial al objeto 5 y devuelve 120[\[4\]](https://jcsites.juniata.edu/faculty/rhodes/lt/smalltalk.htm#:~:text=,argument).
1. **Mensajes binarios**: utilizan símbolos como +, -, \*, / o @ y reciben un único argumento. Ejemplo: 21 + 2 envía + con argumento 2 al receptor 21, obteniendo 23[\[5\]](https://jcsites.juniata.edu/faculty/rhodes/lt/smalltalk.htm#:~:text=,argument).
1. **Mensajes de palabra clave**: contienen dos puntos : y pueden recibir uno o más argumentos. El selector intercala las palabras clave con los argumentos. Ejemplo: miArreglo at: 1 put: 5 envía el mensaje at:put: con argumentos 1 y 5 al array miArreglo[\[6\]](https://jcsites.juniata.edu/faculty/rhodes/lt/smalltalk.htm#:~:text=,or%20more%20arguments).

La **precedencia** dicta que primero se evalúan los mensajes unarios, luego los binarios y finalmente los de palabra clave[\[1\]](https://jcsites.juniata.edu/faculty/rhodes/lt/smalltalk.htm#:~:text=Precedence%2C%20highest%20to%20lowest%3A%20unary%2C,can%20be%20overridden%20by%20parentheses). Esto permite escribir expresiones como:

4 + 'hola' size.     "Equivale a 4 + ('hola' size) => 4 + 4 = 8"\
'hola' size + 4.     "Se evalúa 'hola' size (4) y luego se suma 4 => 8"
## <a name="colecciones-y-algunos-mensajes-útiles"></a>Colecciones y algunos mensajes útiles
Los arreglos y las cadenas ofrecen una serie de mensajes unarios que resultan muy útiles. Algunos ejemplos prácticos:

#('arreglo' 'de' 'strings') size     "devuelve 3"\
'Hoy es Jueves' asUppercase          "devuelve 'HOY ES JUEVES'"\
#(4 'cinco' 6 7) reversed             "devuelve #(7 6 'cinco' 4)"\
$a asciiValue                        "devuelve 97 (valor ASCII de 'a')"\
65 asCharacter                      "devuelve $A"\
'¿Cuál es la longitud de esta oración?' size "devuelve 34"

En un **diccionario**, las claves suelen ser símbolos y los valores pueden ser de cualquier tipo. Para acceder y modificar entradas se utilizan los mensajes at: y at:put::

| miDic |\
miDic := Dictionary new.\
miDic at: #nombre put: 'Ana'.\
miDic at: #edad put: 30.\
miDic at: #nombre                 "-> devuelve 'Ana'"
## <a name="comparaciones-y-operadores-booleanos"></a>Comparaciones y operadores booleanos
La diferencia entre igualdad y identidad puede resultar confusa. La revista *The Smalltalk Report* señala que = devuelve true si dos objetos son **iguales** en valor, mientras que == devuelve true si son el **mismo objeto en memoria[\[7\]](https://rmod-files.lille.inria.fr/FreeBooks/TheSmalltalkReport/PDFS/ST/ST05/10WO.PDF#:~:text=%EF%9D%AE%EF%9D%A5%20%EF%9D%AF%EF%9D%A6%20%EF%9D%B4%EF%9D%A8%EF%9D%A5trickier%20concepts%20in,difference%20actually%20mean%20in%20a)**. Para negar la igualdad se utiliza ~= y para negar la identidad ~~. Ejemplos:

(1/2) = (1/2)           "true: las cadenas tienen el mismo contenido"\
(1/2) == (1/2)         "false: son dos objetos distintos"\
1 ~~ 2                  "true: 1 y 2 son objetos diferentes"
### <a name="operadores-lógicos-y-cortocircuito"></a>Operadores lógicos y cortocircuito
Las clases True y False definen los mensajes lógicos. Existen dos formas de enviar los operadores AND y OR:

|Operador|Descripción|
| :- | :- |
|& y ||Son **operadores binarios** que evalúan ambos operandos. Si el|
|primer operando genera un error (por ejemplo dividir por cero), el mensaje||
|no se interrumpe. Se consideran operadores no cortocircuitados[\[8\]](https://rigaux.org/language-study/syntax-across-languages-per-language/Smalltalk.html#:~:text=,true%20value).||
|and: y or:|Son mensajes de palabra clave que reciben un **bloque** como|
|segundo argumento. Solo evalúan el bloque cuando es necesario. Estas||
|versiones implementan cortocircuito[\[8\]](https://rigaux.org/language-study/syntax-across-languages-per-language/Smalltalk.html#:~:text=,true%20value).||
Ejemplo de uso de and: para evitar errores:

| x |\
x := 0.\
"El segundo bloque no se evalúa porque x > 0 es false"\
(x > 0) and: [ 5 / x > 1 ].    "devuelve false sin lanzar error"\
\
"Si usamos &, ambos lados se evalúan y se produce una división por cero"\
(x > 0) & (5 / x > 1).          "lanza ZeroDivide"
## <a name="bloques-y-estructuras-de-control"></a>Bloques y estructuras de control
Un **bloque** es un trozo de código encerrado entre corchetes [ ]. Representa una *closure* y solo se ejecuta al enviarle el mensaje value. Los bloques pueden recibir argumentos usando | para separarlos de los cuerpos. La documentación los describe como procedimientos anónimos que se pueden asignar a variables[\[9\]](https://jcsites.juniata.edu/faculty/rhodes/lt/smalltalk.htm#:~:text=%5B%3Aparm1%20%3Aparm2%20...%20,the%20p1%20argument%20to%20parm1).

Ejemplo de bloque con parámetros (similar al mostrado en clase):

| bloque |\
\
"Define un bloque que recibe un carácter y una cadena y los concatena\
`   `con un espacio intermedio"\
bloque := [:c :s | c asString, ' ', s ].\
\
"Invoca el bloque pasando un carácter y una cadena"\
bloque value: $a value: 'hola'.    "-> devuelve 'a hola'"
### <a name="condicionales-con-bloques"></a>Condicionales con bloques
Los objetos booleanos (true y false) implementan los mensajes ifTrue:, ifFalse: e ifTrue:ifFalse:. Estos mensajes reciben uno o dos bloques como argumentos. La invocación ejecuta el bloque correspondiente según el valor del receptor. Por ejemplo:

(5 > 3) ifTrue: [ 'cinco es mayor que tres' ] ifFalse: [ 'no debería imprimirse' ].\
\
(5 < 3) ifTrue: [ 'no se imprimirá' ] ifFalse: [ 'cinco no es menor que tres' ].
### <a name="bucles-con-whiletrue-y-whilefalse"></a>Bucles con whileTrue: y whileFalse:
Smalltalk no tiene estructuras de control integradas; los bucles se logran enviando mensajes a objetos. El mensaje whileTrue: se envía a un bloque que evalúa una condición y recibe otro bloque con las acciones a repetir. La semántica está documentada de la siguiente forma: whileTrue: envía value al bloque condición, y si devuelve true entonces evalúa el bloque de acciones; este proceso se repite hasta que la condición sea falsa[\[10\]](https://jcsites.juniata.edu/faculty/rhodes/lt/smalltalk.htm#:~:text=count%20_%200,count%20_%20count%20%2B%201).

**Ejemplo – decrementar un contador:**

| a |\
a := 10.\
\
"Mientras a sea mayor que 0, resta 1"\
[ a > 0 ] whileTrue: [ a := a - 1 ].\
"Al finalizar, a vale 0"

También existe el mensaje whileFalse: que ejecuta el bloque de acciones mientras la condición sea falsa. Por ejemplo:

| contador |\
contador := 0.\
\
"Sigue incrementando hasta que contador sea igual a 5"\
[ contador = 5 ] whileFalse: [ contador := contador + 1 ].
### <a name="repetición-con-timesrepeat"></a>Repetición con timesRepeat:
Para repetir una acción un número fijo de veces se utiliza el mensaje timesRepeat:. Se envía a un entero y recibe un bloque de código. Según el ejemplo de la documentación, 3 timesRepeat: [xVal := xVal + 1] incrementa una variable tres veces[\[11\]](https://jcsites.juniata.edu/faculty/rhodes/lt/smalltalk.htm#:~:text=Simple%20counter%20loop%20example%3A).

| mensaje |\
mensaje := ''.\
3 timesRepeat: [ mensaje := mensaje , 'Hola ' ].\
mensaje    "-> devuelve 'Hola Hola Hola '"
### <a name="rangos-y-bucles-con-todo-y-tobydo"></a>Rangos y bucles con to:do: y to:by:do:
Los mensajes to:do: y to:by:do: permiten recorrer rangos de números. Se envían a un número inicial y reciben como argumentos el límite final y un bloque que se ejecuta para cada valor del rango. La variante by: permite especificar el paso[\[12\]](https://jcsites.juniata.edu/faculty/rhodes/lt/smalltalk.htm#:~:text=For%20loop%20examples%3A).

| suma |\
suma := 0.\
1 to: 5 do: [:i | suma := suma + i ].   "suma -> 15"\
\
2 to: 10 by: 2 do: [:par | suma := suma + par ]. "suma suma los pares"
## <a name="mensajes-anidados-y-orden-de-evaluación"></a>Mensajes anidados y orden de evaluación
Al combinar mensajes unarios, binarios y de palabra clave en una expresión, Smalltalk sigue la precedencia mencionada anteriormente. Consideremos el siguiente ejemplo:

#(1 12 24 36) includes: 4 factorial.

Aquí 4 factorial es un mensaje unario y se evalúa primero, produciendo 24. Luego se envía el mensaje de palabra clave includes: con el argumento 24 al array, preguntando si contiene dicho elemento. El resultado es true porque 24 está en la colección.
## <a name="cascada-de-mensajes"></a>Cascada de mensajes
El punto y coma (;) permite **encadenar** varios mensajes enviados al mismo receptor. Es útil para evitar repetir el nombre del objeto. Por ejemplo, podemos crear y rellenar un conjunto de la siguiente forma:

| conjunto |\
conjunto := Set new.\
conjunto add: 3; add: 5; add: 'foo'; add: 5; yourself.\
"devuelve un set con los elementos 3, 5 y 'foo'; la segunda inserción de 5 no\
` `se añade porque un Set no admite duplicados"

Internamente, esta cascada equivale a ejecutar cada mensaje en una línea separada sobre el mismo objeto[\[13\]](https://jcsites.juniata.edu/faculty/rhodes/lt/smalltalk.htm#:~:text=Multiple%20messages%20are%20associated%20left,to%20right).
## <a name="x64a8edaff5c8405bd8b61df38a0d7423de25fd5"></a>Entrada de usuario: UIManager default request:
Pharo y otras implementaciones ofrecen utilidades de interfaz gráfica. El mensaje request: de UIManager default muestra una ventana de diálogo solicitando un valor. Por ejemplo:

| ui nombre |\
ui := UIManager default.\
nombre := ui request: 'Ingrese su nombre:' default: 'Anónimo'.\
Transcript show: 'Hola, ', nombre; cr.

En este caso se pide al usuario que introduzca su nombre; si se presiona *Cancelar* o se deja en blanco se utiliza el valor por defecto 'Anónimo'.
## <a name="cascada-de-factoriales"></a>Cascada de factoriales
El mensaje factorial es unario y devuelve el factorial de un número. Si queremos aplicar factorial varias veces, podemos encadenar llamadas en dos formas distintas:

1. **En cascada**, utilizando el punto y coma ; para enviar varias veces el mismo mensaje al mismo receptor:

```smalltalk 3 factorial; factorial; factorial. ````

Esta expresión calcula primero 3 factorial (que es 6) pero ignora el resultado y vuelve a enviar factorial al objeto original 3, y así sucesivamente. La respuesta final será siempre 6 porque 3 factorial produce 6 y las llamadas siguientes se vuelven a enviar a 3 debido al encadenamiento.

1. **Anidando mensajes unarios**, sin utilizar cascada:

3 factorial factorial factorial.

Aquí se evalúa 3 factorial (6), luego se envía factorial al resultado (720), y finalmente se envía factorial a 720, obteniendo un número enorme (720!).

Esta diferencia ilustra cómo la cascada afecta al receptor de los mensajes.
## <a name="resumen"></a>Resumen
Estas notas cubren los aspectos básicos de Smalltalk vistos en clase: tipos de literales, uso de la coma para concatenar, diferencias entre mensajes unarios, binarios y de palabra clave, precedencia de evaluación, bloques y estructuras de control (ifTrue:, whileTrue:, timesRepeat:, to:do:), comparación de objetos (= vs ==), operadores lógicos con y sin cortocircuito, cascada de mensajes y entrada de usuario. Se han añadido explicaciones y ejemplos adicionales para afianzar la comprensión del lenguaje.

---