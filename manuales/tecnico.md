# Manual Técnico del Proyecto

## Índice

- [Manual Técnico del Proyecto](#manual-técnico-del-proyecto)
  - [Índice](#índice)
  - [1. Introducción](#1-introducción)
  - [2. Estructura del Proyecto](#2-estructura-del-proyecto)
    - [2.1 Frontend](#21-frontend)
    - [2.2 Backend](#22-backend)
  - [3. Configuración del Entorno](#3-configuración-del-entorno)
    - [3.1 Requisitos Previos](#31-requisitos-previos)
    - [3.2 Instalación](#32-instalación)
      - [Frontend](#frontend)
      - [Backend](#backend)
  - [4. Descripción de Componentes](#4-descripción-de-componentes)
    - [4.1 Frontend](#41-frontend)
    - [4.2 Backend](#42-backend)
      - [4.2.1 analyzer](#421-analyzer)
      - [4.2.2 Common](#422-common)
      - [4.2.3 Controllers](#423-controllers)
      - [4.2.4 Enums](#424-enums)
      - [4.2.5 Grammar](#425-grammar)
      - [4.2.6 Symbols](#426-symbols)
      - [4.2.7 Visitors](#427-visitors)
  - [5. Análisis Léxico y Sintáctico](#5-análisis-léxico-y-sintáctico)
    - [5.1 Gramática ANTLR](#51-gramática-antlr)
    - [5.2 Generación de Código](#52-generación-de-código)
  - [6. Análisis Semántico](#6-análisis-semántico)
    - [6.1 Visitors](#61-visitors)
    - [6.2 Entorno y Símbolos](#62-entorno-y-símbolos)
  - [7. Manejo de Errores](#7-manejo-de-errores)
  - [8. Comandos Útiles](#8-comandos-útiles)
    - [8.1 Frontend](#81-frontend)
    - [8.2 Backend](#82-backend)
  - [9. Configuración de ESLint](#9-configuración-de-eslint)
  - [10. Notas Adicionales](#10-notas-adicionales)

## 1. Introducción
Este manual técnico proporciona una guía detallada sobre la estructura, configuración y funcionamiento del proyecto. El proyecto está dividido en dos partes principales: **Frontend** desarrollado con **Next.js** y **Backend** desarrollado con **.NET 9.0** y **ANTLR** para el análisis de código.

## 2. Estructura del Proyecto

### 2.1 Frontend
```
.
├── actions
│   ├── getSymbols.ts
│   ├── postAST.ts
│   └── sendCommand.ts
├── app
│   ├── favicon.ico
│   ├── globals.css
│   ├── layout.tsx
│   ├── page.tsx
│   └── symbols
│       └── page.tsx
├── components
│   ├── CodeEditor.tsx
│   └── Navbar.tsx
├── hooks
│   └── useCodeEditor.ts
├── public
│   ├── file.svg
│   ├── globe.svg
│   ├── next.svg
│   ├── vercel.svg
│   └── window.svg
├── utils
│   └── editor-config.ts
├── next.config.ts
├── package.json
├── tailwind.config.ts
├── tsconfig.json
└── README.md
```

### 2.2 Backend
```
.
├── analyzer
│   └── Grammar
│       ├── GoLangBaseVisitor.cs
│       ├── GoLang.interp
│       ├── GoLangLexer.cs
│       ├── GoLangLexer.interp
│       ├── GoLangLexer.tokens
│       ├── GoLangParser.cs
│       ├── GoLang.tokens
│       └── GoLangVisitor.cs
├── antlr-4.13.2-complete.jar
├── api.csproj
├── api.http
├── appsettings.Development.json
├── appsettings.json
├── Common
│   ├── BreakException.cs
│   ├── ControlFlow.cs
│   ├── ReturnException.cs
│   └── SemanticError.cs
├── Controllers
│   ├── Compile.cs
│   └── Requests
│       └── CompileRequest.cs
├── Enums
│   ├── VarMutability.cs
│   └── VarType.cs
├── Grammar
│   ├── ErrorListener.cs
│   └── GoLang.g4
├── Program.cs
├── Properties
│   └── launchSettings.json
├── README.md
├── README.pdf
├── Symbols
│   ├── DataType.cs
│   ├── Environment.cs
│   ├── Error.cs
│   ├── Function.cs
│   ├── Scope.cs
│   ├── SliceExtensions.cs
│   ├── SliceTypeRegistry.cs
│   ├── StructDefinition.cs
│   ├── StructInstance.cs
│   ├── Symbol.cs
│   ├── SymbolInfo.cs
│   ├── SymbolTableReport.cs
│   └── ValueWrapper.cs
└── Visitors
    ├── BuiltInFunctionsVisitor.cs
    ├── DeclarationVisitor.cs
    ├── ExpressionVisitor.cs
    ├── FlowControlVisitor.cs
    ├── FunctionVisitor.cs
    ├── LoopVisitor.cs
    ├── MainVisitor.cs
    ├── PrintVisitor.cs
    ├── StructVisitor.cs
    ├── SwitchVisitor.cs
    ├── TypeVisitor.cs
    └── VariableVisitor.cs
```

## 3. Configuración del Entorno

### 3.1 Requisitos Previos
- Node.js v18 o superior
- .NET 9.0
- pnpm (Package Manager)
- Java (para ANTLR)

### 3.2 Instalación
#### Frontend
```bash
# Clonar el repositorio
git clone <repo-url>
cd frontend

# Instalar dependencias
pnpm install

# Ejecutar en modo desarrollo
pnpm dev
```

#### Backend
```bash
# Moverse al directorio del backend
cd backend

# Restaurar paquetes
dotnet restore

# Ejecutar la API
dotnet run
```

## 4. Descripción de Componentes

### 4.1 Frontend
- **actions/**: Contiene funciones para interactuar con la API (obtener símbolos, enviar comandos, etc.).
- **components/**: Componentes React reutilizables como `CodeEditor` y `Navbar`.
- **hooks/**: Custom hooks como `useCodeEditor`.
- **utils/**: Utilidades compartidas, como configuraciones del editor.

### 4.2 Backend

#### 4.2.1 analyzer
Esta carpeta contiene los archivos generados automáticamente por ANTLR4 a partir de la gramática definida. Estos archivos son responsables del análisis léxico y sintáctico del código fuente.

- **GoLangLexer.cs**: Implementa el analizador léxico que convierte el texto fuente en tokens.
- **GoLangParser.cs**: Implementa el analizador sintáctico que construye el AST a partir de los tokens.
- **GoLangBaseVisitor.cs**: Clase base generada para implementar el patrón Visitor.
- **GoLangVisitor.cs**: Interfaz que define los métodos de visita para cada regla gramatical.

#### 4.2.2 Common
Contiene clases para el manejo de excepciones y flujo de control en el intérprete:

- **BreakException.cs**: Excepción para manejar la sentencia `break` en bucles.
- **ContinueException.cs**: Excepción para manejar la sentencia `continue` en bucles.
- **ControlFlow.cs**: Clase para gestionar el flujo de ejecución.
- **ReturnException.cs**: Excepción para manejar retornos de funciones.
- **SemanticError.cs**: Excepción para errores semánticos durante la ejecución.

#### 4.2.3 Controllers
Gestiona las rutas API del backend:

- **Compile.cs**: Controlador principal que recibe el código fuente, lo compila y devuelve los resultados.
- **Requests/CompileRequest.cs**: Modelos de datos para las peticiones de compilación.

#### 4.2.4 Enums
Define enumeraciones utilizadas en el proyecto:

- **VarMutability.cs**: Define la mutabilidad de las variables (constante o variable).
- **VarType.cs**: Enumera los tipos de variables soportados.

#### 4.2.5 Grammar
Contiene la definición gramatical del lenguaje:

- **GoLang.g4**: Archivo de gramática ANTLR4 que define la sintaxis del lenguaje.
- **ErrorListener.cs**: Implementación personalizada para escuchar errores durante el análisis.

#### 4.2.6 Symbols
Implementa las estructuras de datos para la gestión de símbolos y entornos:

- **DataType.cs**: Clase para manejar tipos de datos y conversiones.
- **Environment.cs**: Gestiona el entorno de ejecución, incluyendo ámbitos y variables.
- **Error.cs**: Representa errores durante la compilación o ejecución.
- **Function.cs**: Define la estructura para representar funciones.
- **Scope.cs**: Implementa el concepto de ámbito para variables.
- **SliceExtensions.cs**: Métodos de extensión para manipular slices.
- **SliceTypeRegistry.cs**: Registra y gestiona tipos de slices.
- **StructDefinition.cs**: Define estructuras.
- **StructInstance.cs**: Representa instancias de estructuras.
- **Symbol.cs**: Representa un símbolo en la tabla de símbolos.
- **SymbolInfo.cs**: Información adicional para reportes de símbolos.
- **SymbolTableReport.cs**: Genera informes sobre la tabla de símbolos.
- **ValueWrapper.cs**: Encapsula valores con información de tipo.

#### 4.2.7 Visitors
Implementa el patrón Visitor para recorrer y evaluar el AST:

- **MainVisitor.cs**: Visitor principal que coordina y delega a otros visitors.
- **ExpressionVisitor.cs**: Evalúa expresiones aritméticas y lógicas.
- **VariableVisitor.cs**: Maneja declaraciones y asignaciones de variables.
- **FunctionVisitor.cs**: Procesa definiciones e invocaciones de funciones.
- **StructVisitor.cs**: Maneja estructuras y acceso a campos.
- **FlowControlVisitor.cs**: Controla estructuras if-else y switch.
- **LoopVisitor.cs**: Maneja bucles for y while.
- **PrintVisitor.cs**: Gestiona las funciones de impresión.
- **TypeVisitor.cs**: Analiza y verifica tipos.
- **BuiltInFunctionsVisitor.cs**: Implementa funciones integradas.

## 5. Análisis Léxico y Sintáctico

### 5.1 Gramática ANTLR
La gramática ANTLR (`GoLang.g4`) define la sintaxis del lenguaje implementado, inspirado en Go. Incluye reglas para expresiones, declaraciones, estructuras de control, y más.

### 5.2 Generación de Código
ANTLR genera automáticamente los analizadores léxico y sintáctico a partir de la gramática.

```bash
# Generar código C# a partir de la gramática
java -jar antlr-4.13.2-complete.jar -Dlanguage=CSharp GoLang.g4 -visitor -no-listener
```

## 6. Análisis Semántico

### 6.1 Visitors
El análisis semántico y la ejecución se implementan mediante el patrón Visitor. Cada visitor se especializa en un aspecto del lenguaje:

- **MainVisitor**: Coordina la ejecución global del programa.
- **ExpressionVisitor**: Evalúa expresiones y devuelve sus valores.
- **VariableVisitor**: Maneja variables, incluyendo declaración, inicialización y asignación.

### 6.2 Entorno y Símbolos
- **Environment**: Gestiona la tabla de símbolos y los ámbitos.
- **ValueWrapper**: Mantiene valores junto con su información de tipo.
- **DataType**: Implementa las reglas de tipado y conversiones.

## 7. Manejo de Errores
El sistema implementa diferentes niveles de manejo de errores:

- **Errores léxicos**: Detectados por el lexer de ANTLR.
- **Errores sintácticos**: Detectados por el parser de ANTLR.
- **Errores semánticos**: Gestionados mediante la clase `SemanticError`.

## 8. Comandos Útiles

### 8.1 Frontend
| Comando               | Descripción                |
|-----------------------|----------------------------|
| `pnpm install`        | Instala las dependencias   |
| `pnpm dev`            | Inicia el entorno local    |
| `pnpm build`          | Compila la aplicación      |

### 8.2 Backend
| Comando               | Descripción                |
|-----------------------|----------------------------|
| `dotnet restore`      | Restaura paquetes          |
| `dotnet run`          | Ejecuta la API             |
| `dotnet build`        | Compila el proyecto        |
| `dotnet test`         | Ejecuta pruebas            |

## 9. Configuración de ESLint

El proyecto usa **ESLint** con las siguientes configuraciones:
- `eslint-config-next`: Reglas específicas para Next.js
- `eslint-plugin-react`: Reglas para React
- `eslint-plugin-jsx-a11y`: Accesibilidad en JSX

## 10. Notas Adicionales
- Asegúrate de tener `antlr-4.13.2-complete.jar` configurado en tu sistema para la generación de gramáticas.
- La comunicación entre el frontend y el backend se realiza mediante API REST.
- El sistema está diseñado para ser fácilmente extensible con nuevas características del lenguaje o mejoras en la interfaz.
