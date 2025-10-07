# Repaso

## ¿Cuál es el orden de evaluación de los operadores unarios, binarios y palabra clave?

En Pharo, el orden de evaluación de los mensajes (operadores) es fijo y muy simple. Se evalúan en este orden:

1) Mensajes unarios

2) Mensajes binarios

3) Mensajes de palabra clave (keyword messages)

Además, los mensajes del mismo tipo se evalúan de izquierda a derecha.

## ¿Que pasa usas ^ en medio de un método?

En Pharo, usar ^ (el operador de retorno) en cualquier parte de un método termina inmediatamente la ejecución del método y devuelve el valor especificado al llamador.

Ejemplo:
```st
miMetodo
   1 + 2.
   ^ 42.
   3 + 4.  "Nunca se ejecuta"
```


Al llamar self miMetodo, el resultado será 42, y la línea 3 + 4 no se ejecutará, porque el ^ 42 detuvo el flujo del método.

En resumen:

^ valor devuelve valor y corta el resto del método.

No importa si aparece al principio, en medio o al final: siempre sale del método inmediatamente.

## Ejemplo 1:
```st
| intro outro |
Intro := 10.
^outro := intro + x. outro.
```
provocará un error en tiempo de ejecución, específicamente:

```st
MessageNotUnderstood: UndefinedObject>>x
```
Por qué:
- ```x``` no está definido ni como variable local, ni como método, ni como variable de instancia.

- Pharo interpreta ```x``` como un mensaje enviado al receptor actual (```self```).

- Como ```self``` no entiende el mensaje ```x```, lanza un ```MessageNotUnderstood```.

## Ejemplo 2:
```st
4 + 3 factorial * 2 max: 10
```


## Evaluación de la expresión en Pharo

Pharo evalúa la siguiente expresión:

```smalltalk
4 + 3 factorial * 2 max: 10
```

siguiendo **el orden de precedencia de los operadores**:

1. **Unarios** (más alta prioridad):  
   Se evalúa `3 factorial` → `6`.

2. **Binarios** (segunda prioridad):  
   Se evalúa de **izquierda a derecha**.  
   - Primero `4 + 6` → `10`.  
   - Luego `10 * 2` → `20`.

3. **Palabra clave** (menor prioridad):  
   Finalmente `20 max: 10` → devuelve el **máximo** entre 20 y 10 → `20`.

👉 **Resultado final:**  
```
20
```


