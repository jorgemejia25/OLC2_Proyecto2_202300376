// Gramática para el lenguaje Go simplificado. Reglas principales, expresiones, tipos y tokens están
// documentados para mayor claridad.

grammar GoLang;

// ---------------------------------------------------------------- Regla principal: un programa es
// una secuencia de statements
program: statement+;

// ---------------------------------------------------------------- Reglas de Statements
statement:
	varDeclaration ';'? // Punto y coma opcional
	| implicitDeclaration ';'? //  regla para declaración implícita
	| funcDeclaration //  regla para declaración de funciones
	| simpleStatement
	| block;

simpleStatement:
	exprStatement ';'?
	| assignment ';'?
	| compoundAssignment ';'?
	| incDecStatement ';'? // Nueva regla para ++ y --
	| printStatement ';'?
	| ifStatement
	| whileStatement
	| breakStatement
	| continueStatement
	| switchStatement
	| returnStatement
	| invoke ';'?
	| invokeMethod ';'?
	| forStatement;

// Declaración de variables/constantes: 'var' o 'const' ID (type)? '=' (expr | sliceInit)
varDeclaration: ('var' | 'const') ID (type)? (
		'=' ( expr | sliceInit)
	)?
	| ID ':=' (type) (sliceInit);

funcDeclaration: 'func' ID '(' funcParams? ')' type? block;

funcParams: funcParam (',' funcParam)*;

funcParam: ID type;

invoke: ID '(' invokeParams? ')';

invokeParams: expr (',' expr)*;

invokeMethod: ID '.' ID '(' invokeParams? ')';

// Nueva regla para declaración implícita: ID ':=' (expr | sliceInit)
implicitDeclaration: ID ':=' (expr | sliceInit);

// Asignación: ID '=' (expr | sliceInit)
assignment:
	ID '=' (expr | sliceInit)
	| expr '[' expr ']' '=' expr;

// Nueva regla para asignación compuesta
compoundAssignment: ID op = ('+=' | '-=') expr;

// Nueva regla para incremento/decremento
incDecStatement: ID op = ('++' | '--');

// Statement de expresión
exprStatement: expr;

// Impresión: 'fmt.Println' '(' expr ')'; Modificar la regla del if para aceptar tanto block como
// simpleStatement
ifStatement:
	'if' expr (block | simpleStatement) ('else' elseBlock)?;

// Nueva regla para while
whileStatement: 'while' expr (block | simpleStatement);

// Nueva regla para break
breakStatement: 'break' ';'?;

// Nueva regla para continue
continueStatement: 'continue' ';'?;

// Nueva regla para switch
switchStatement:
	'switch' expr '{' caseStatement* defaultCase? '}';

// Nueva regla para for
forStatement:
	'for' (
		forCondition // for condición { }
		| forClause // for i := 0; i < 10; i++ { }
		| forRange // for i, v := range slice { }
	) block;

forCondition: expr;

forClause: (initStmt ';')? expr? ';' (postStmt ';'?)?;

// Nueva regla para manejar la iteración for-range
forRange: ID (',' ID)? ':=' 'range' expr;

initStmt:
	varDeclaration
	| implicitDeclaration
	| assignment
	| compoundAssignment;

postStmt: assignment | compoundAssignment | incDecStatement;

// Regla para los cases
caseStatement: 'case' expr ':' statement*;

// Regla para el default
defaultCase: 'default' ':' statement*;

// Bloque de código
block: '{' statement* '}';

// Modificar elseBlock para aceptar simpleStatement también
elseBlock: ifStatement | block | simpleStatement;

// ---------------------------------------------------------------- Expresiones aritméticas y
// literales
expr:
	// Aseguramos que FieldAccess tenga mayor precedencia colocando esta producción primero
	expr '.' ID										# FieldAccess
	| expr op = ('*' | '/' | '%') expr				# MulDiv // Operaciones de multiplicación, división o módulo
	| expr op = ('+' | '-') expr					# AddSub // Operaciones de suma o resta
	| expr op = ('==' | '!=') expr					# Equality // Modificado para incluir !=
	| expr op = ('>' | '<' | '>=' | '<=') expr		# Comparison // Nueva regla
	| '!' expr										# Not // Nueva regla para NOT lógico
	| '-' expr										# Neg // Operador de negación
	| 'len' '(' expr ')'							# Len // Nueva regla para len
	| 'append' '(' expr ',' (expr | sliceInit) ')'	# Append // Permitir sliceInit en append
	| 'strings.Join' '(' expr ',' expr ')'			# StringsJoin // Nueva regla para strings.Join
	| 'slices.Index' '(' expr ',' expr ')'			# SlicesIndex // Nueva regla para slices.Index
	| 'strconv.Atoi' '(' expr ')'					# StrconvAtoi
	| 'strconv.ParseFloat' '(' expr ')'				# StrconvParseFloat
	| 'reflect.TypeOf' '(' expr ')'					# ReflectTypeOf
	| expr '[' expr ']'								# IndexAccess
	| expr '&&' expr								# And // Nueva regla para AND lógico
	| expr '||' expr								# Or // Nueva regla para OR lógico
	| INT											# Number // Número entero
	| FLOAT											# Float // Número flotante
	| STRING										# String // Cadena de texto
	| RUNE											# Rune // Carácter
	| invoke										# InvokeLiteral // Nueva regla para invocación de funciones
	| invokeMethod									# InvokeMethodLiteral // Nuevo: permite persona1.Saludar() como expr
	| BOOL											# Boolean // Valor booleano
	| 'nil'											# Nil // Valor nulo
	| ID											# Variable // Identificador
	| '(' expr ')'									# Parens // Expresión entre paréntesis
	| arrayType sliceInit							# TypedSliceInit;

// Slice literal
sliceInit: '{' (exprList | nestedSliceInit)? '}';
nestedSliceInit: sliceInit (',' sliceInit)* ','?;

printStatement: 'fmt.Println' '(' expr ')';

returnStatement: 'return' expr? ';'?;

// ---------------------------------------------------------------- Tipos de datos soportados
type: baseType | arrayType;
baseType: 'int' | 'float64' | 'string' | 'bool' | 'rune' | ID;
arrayType: '[]' (arrayType | baseType);

exprList: expr (',' expr)* ','?;

// ---------------------------------------------------------------- Tokens

INT: [0-9]+;
FLOAT: [0-9]+ '.' [0-9]+;
STRING: '"' (ESC | ~["\\])* '"';
RUNE: '\'' (ESC | ~['\\]) '\'';
BOOL: 'true' | 'false';
ID: [a-zA-Z_][a-zA-Z0-9_]*;
SEMICOLON: ';';
WS: [ \t\r\n]+ -> skip;

// Comentarios
SINGLE_LINE_COMMENT: '//' ~[\r\n]* -> skip;
MULTI_LINE_COMMENT: '/*' .*? '*/' -> skip;

// Secuencia de escape
fragment ESC: '\\' [btnfr"'\\];