# Análisis del programa Hello World en ARM64

Este documento explica detalladamente el programa `hello-word.s` escrito en ensamblador ARM64, que muestra el clásico mensaje "Hello, world!" en la consola.

## Estructura general

```assembly
.section 

.globl _start
```

- `.section`: Define una sección en el programa. Normalmente debería especificarse el nombre de la sección (como `.text` para código o `.data` para datos), pero aquí se usa sin nombre lo que implica la sección por defecto.
- `.globl _start`: Declara la etiqueta `_start` como global, haciéndola visible al enlazador (linker). Esta es la etiqueta estándar que el sistema operativo buscará como punto de entrada del programa.

## Punto de entrada y función principal

```assembly
_start:
    mov x0, #1  
    adr x1, msg
    mov x2, len
    mov x8, #64
    svc #0

    mov x8, #0
    mov w8, #93
    svc #0
```

### Análisis detallado:

1. `mov x0, #1`:
   - Carga el valor inmediato 1 en el registro `x0`.
   - En las llamadas al sistema de Linux en ARM64, `x0` es el primer argumento, y 1 representa el descriptor de archivo para la salida estándar (stdout).
   - Los registros `x0-x7` se utilizan para pasar argumentos a las llamadas al sistema.

2. `adr x1, msg`:
   - Carga la dirección de memoria de la etiqueta `msg` en el registro `x1`.
   - `adr` calcula la dirección relativa al contador de programa (PC-relative).
   - `x1` es el segundo argumento de la llamada al sistema, aquí representa la dirección donde comienza el mensaje a imprimir.

3. `mov x2, len`:
   - Carga el valor de `len` (calculado como la longitud del mensaje) en el registro `x2`.
   - `x2` es el tercer argumento de la llamada al sistema y define cuántos bytes se imprimirán.

4. `mov x8, #64`:
   - Carga el valor 64 en el registro `x8`.
   - En ARM64 Linux, `x8` contiene el número de la llamada al sistema. El valor 64 corresponde a `sys_write`.
   - La llamada `sys_write` requiere tres parámetros: descriptor de archivo (x0), puntero al buffer (x1) y tamaño (x2).

5. `svc #0`:
   - Instrucción de Llamada al Supervisor (Supervisor Call).
   - Genera una excepción que transfiere el control al sistema operativo para realizar la llamada al sistema.
   - El núcleo de Linux ejecuta la llamada al sistema indicada en `x8` con los argumentos en `x0-x7`.
   - En este caso, `sys_write` imprime "Hello, world!\n" en la consola.

6. `mov x0, #0`:
   - Carga el valor 0 en el registro `x0`.
   - Este valor se usará como el código de salida del programa.
   - El código de salida 0 generalmente indica que el programa se ejecutó correctamente.

7. `mov w8, #93`:
   - Carga el valor 93 en la parte baja de 32 bits del registro `x8` (referenciada como `w8`).
   - El número 93 corresponde a la llamada al sistema `sys_exit` en Linux ARM64.
   - Nota: `w8` se refiere a los 32 bits inferiores del registro `x8` de 64 bits.

8. `svc #0`:
   - Genera otra llamada al sistema, esta vez `sys_exit`.
   - Termina el programa con un código de salida 0 (indicado en `x0` por defecto).
   - Sin esta llamada, el programa podría continuar ejecutando instrucciones inválidas.

## Sección de datos

```assembly
msg:
    .ascii "Hello, world!\n"
    len = . - msg
```

- `msg:`: Etiqueta que marca la dirección de inicio de nuestro mensaje en memoria.
- `.ascii "Hello, world!\n"`: Define una cadena ASCII sin byte nulo al final. El `\n` representa un salto de línea.
- `len = . - msg`: Define el símbolo `len` como la diferencia entre la posición actual (`.`) y la etiqueta `msg`.
  - El punto (`.`) representa el contador de ubicación actual en el ensamblador.
  - Esta es una técnica común para calcular dinámicamente la longitud de una cadena.
  - En este caso, `len` será igual a 14 (13 caracteres más el salto de línea).

## Registros ARM64 utilizados

- `x0-x7`: Registros de propósito general, usados para pasar argumentos a las llamadas al sistema.
- `x8`: Contiene el número de la llamada al sistema.
- `w0-w30`: Referencias a la parte baja (32 bits) de los registros `x0-x30`.

## Llamadas al sistema Linux en ARM64

- `sys_write (64)`: 
  - Función: Escribe datos a un descriptor de archivo.
  - Parámetros: 
    - `x0`: Descriptor de archivo (1 para stdout)
    - `x1`: Puntero al buffer de datos
    - `x2`: Número de bytes a escribir
  - Valor de retorno: Número de bytes escritos (en `x0`)

- `sys_exit (93)`: 
  - Función: Termina el proceso actual.
  - Parámetros: 
    - `x0`: Código de salida (0 indica éxito)
  - No retorna.

## Compilación y ejecución

Para compilar y ejecutar este programa:

```bash
# Ensamblar
as -o hello.o hello-word.s

# Enlazar
ld -o hello hello.o

# Ejecutar
./hello
```
