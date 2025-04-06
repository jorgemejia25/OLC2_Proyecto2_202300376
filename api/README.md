# Comandos para la ejecución

### Instalar ANTLR4

Para instalar ANTLR4 en Ubuntu, ejecuta el siguiente comando:

```sh
sudo apt install antlr4
```

### Generar gramática

```sh
java -jar antlr-4.13.2-complete.jar -Dlanguage=CSharp -o analyzer -package analyzer -visitor -no-listener Grammar/*.g4
antlr4 -Dlanguage=CSharp -o analyzer -package analyzer -visitor -no-listener ./Grammar/*.g4
```