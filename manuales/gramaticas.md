# Gramática del lenguaje Go simplificado en formato BNF

## Programa principal

```
<program> ::= <statement>+
```

## Statements

```
<statement> ::= <varDeclaration> ";"?
            | <structDefinition> ";"?
            | <structInstance> ";"?
            | <implicitDeclaration> ";"?
            | <funcDeclaration>
            | <simpleStatement>

<simpleStatement> ::= <exprStatement> ";"?
                   | <assignment> ";"?
                   | <compoundAssignment> ";"?
                   | <incDecStatement> ";"?
                   | <printStatement> ";"?
                   | <ifStatement>
                   | <whileStatement>
                   | <breakStatement>
                   | <continueStatement>
                   | <switchStatement>
                   | <returnStatement>
                   | <invoke> ";"?
                   | <invokeMethod> ";"?
                   | <structAssignment> ";"?
                   | <forStatement>
```

## Declaraciones

```
<varDeclaration> ::= ("var" | "const") <ID> <type>? ("=" (<expr> | <sliceInit> | <structInit>))?
                  | <ID> ":=" <type> <sliceInit>

<structInstance> ::= <ID> ":=" <ID> <structLiteral>

<funcDeclaration> ::= "func" <ID> "(" <funcParams>? ")" <type>? <block>
                   | "func" "(" <structReference> ")" <ID> "(" <funcParams>? ")" <type>? <block>

<structReference> ::= <ID> <ID>

<funcParams> ::= <funcParam> ("," <funcParam>)*

<funcParam> ::= <ID> <type>

<invoke> ::= <ID> "(" <invokeParams>? ")"

<invokeParams> ::= <expr> ("," <expr>)*

<invokeMethod> ::= <ID> "." <ID> "(" <invokeParams> ")"

<implicitDeclaration> ::= <ID> ":=" (<expr> | <sliceInit>)

<assignment> ::= <ID> "=" (<expr> | <sliceInit> | <structInit>)
               | <expr> "[" <expr> "]" "=" <expr>

<compoundAssignment> ::= <ID> ("+=" | "-=") <expr>

<incDecStatement> ::= <ID> ("++" | "--")

<exprStatement> ::= <expr>

<structAssignment> ::= <expr> "." <ID> "=" <expr>
```

## Control de flujo

```
<ifStatement> ::= "if" <expr> (<block> | <simpleStatement>) ("else" <elseBlock>)?

<whileStatement> ::= "while" <expr> (<block> | <simpleStatement>)

<breakStatement> ::= "break" ";"?

<continueStatement> ::= "continue" ";"?

<switchStatement> ::= "switch" <expr> "{" <caseStatement>* <defaultCase>? "}"

<forStatement> ::= "for" (<forCondition> | <forClause> | <forRange>) <block>

<forCondition> ::= <expr>

<forClause> ::= (<initStmt> ";")? <expr>? ";" (<postStmt> ";"?)?

<forRange> ::= <ID> ("," <ID>)? ":=" "range" <expr>

<initStmt> ::= <varDeclaration> | <implicitDeclaration> | <assignment> | <compoundAssignment>

<postStmt> ::= <assignment> | <compoundAssignment> | <incDecStatement>

<caseStatement> ::= "case" <expr> ":" <statement>*

<defaultCase> ::= "default" ":" <statement>*

<block> ::= "{" <statement>* "}"

<elseBlock> ::= <ifStatement> | <block> | <simpleStatement>
```

## Expresiones

```
<expr> ::= <expr> "." <ID>
        | <expr> ("*" | "/" | "%") <expr>
        | <expr> ("+" | "-") <expr>
        | <expr> ("==" | "!=") <expr>
        | <expr> (">" | "<" | ">=" | "<=") <expr>
        | "!" <expr>
        | "-" <expr>
        | "len" "(" <expr> ")"
        | "append" "(" <expr> "," (<expr> | <sliceInit>) ")"
        | "strings.Join" "(" <expr> "," <expr> ")"
        | "slices.Index" "(" <expr> "," <expr> ")"
        | "strconv.Atoi" "(" <expr> ")"
        | "strconv.ParseFloat" "(" <expr> ")"
        | "reflect.TypeOf" "(" <expr> ")"
        | <expr> "[" <expr> "]"
        | <expr> "&&" <expr>
        | <expr> "||" <expr>
        | <INT>
        | <FLOAT>
        | <STRING>
        | <RUNE>
        | <invoke>
        | <invokeMethod>
        | <BOOL>
        | "nil"
        | <ID>
        | "(" <expr> ")"
        | <structLiteral>
        | <arrayType> <sliceInit>
```

## Literales y tipos

```
<sliceInit> ::= "{" (<exprList> | <nestedSliceInit>)? "}"

<nestedSliceInit> ::= <sliceInit> ("," <sliceInit>)* ","?

<structInit> ::= "{" <structFieldInit> ("," <structFieldInit>)* (",")? "}"

<structLiteral> ::= "{" (<structFieldAssignment> ("," <structFieldAssignment>)*)? (",")? "}"

<structFieldAssignment> ::= <ID> ":" <expr>

<structDefinition> ::= "type" <ID> "struct" "{" <structField>* "}"

<structField> ::= <ID> <type> ";"?

<type> ::= <baseType> | <arrayType>

<baseType> ::= "int" | "float64" | "string" | "bool" | "rune" | <ID>

<arrayType> ::= "[]" (<arrayType> | <baseType>)

<exprList> ::= <expr> ("," <expr>)* ","?
```
