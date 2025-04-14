using analyzer;


public class CompilerVisitor : GoLangBaseVisitor<Object?>
{
    public ArmGenerator c = new();

    private string _currentBreakLabel = string.Empty;
    private string _currentContinueLabel = string.Empty;

    public CompilerVisitor()
    {

    }

    // Asegurar que las etiquetas generadas sean únicas y válidas
    private string GenerateUniqueLabel(string prefix)
    {
        return $"{prefix}_{Guid.NewGuid().ToString("N").Substring(0, 8)}";
    }

    public override Object? VisitPrintStatement(GoLangParser.PrintStatementContext context)
    {
        c.Comment("Print statement");
        c.Align(16); // Usar explícitamente un valor de alineamiento

        var expr = context.expr();
        Visit(expr);

        c.Comment("Popping value for printing");
        var value = c.PopObject(Register.X0);

        if (value.Type == StackObject.StackObjectType.Integer)
        {
            c.PrintInteger(Register.X0);
        }
        else if (value.Type == StackObject.StackObjectType.String)
        {
            c.PrintString(Register.X0);
        }
        else if (value.Type == StackObject.StackObjectType.Boolean)
        {
            // Usar la nueva función PrintBool en lugar de PrintInteger para valores booleanos
            c.PrintBool(Register.X0);
        }
        else if (value.Type == StackObject.StackObjectType.Rune)
        {
            c.PrintRune(Register.X0);
        }
        else if (value.Type == StackObject.StackObjectType.Float)
        {
            c.Comment("Loading float for printing");

        }

        return null;
    }

    public override Object? VisitAddSub(GoLangParser.AddSubContext context)
    {
        c.Comment("AddSub operation");
        var operation = context.GetChild(1).GetText();

        // Visitar operandos
        c.Comment("Visiting left operand");
        Visit(context.expr(0));
        c.Comment("Visiting right operand");
        Visit(context.expr(1));

        c.Comment("Popping operands");

        var right = c.PopObject(Register.X1);
        var left = c.PopObject(Register.X0);


            // Operación con enteros normales
            if (operation == "+")
            {
                c.Add(Register.X0, Register.X0, Register.X1);
            }
            else if (operation == "-")
            {
                c.Sub(Register.X0, Register.X0, Register.X1);
            }

            c.Comment("Pushing integer result");
            c.Push(Register.X0);

            // Crear un nuevo objeto para el resultado para evitar compartir referencias
            var resultObject = new StackObject
            {
                Type = left.Type,
                Length = left.Length,
                Depth = left.Depth,
                ID = null
            };
            c.PushObject(resultObject);


        return null;
    }

    public override Object? VisitMulDiv(GoLangParser.MulDivContext context)
    {
        c.Comment("MulDiv operation");
        var operation = context.GetChild(1).GetText();

        // Visitar operandos
        c.Comment("Visiting left operand");
        Visit(context.expr(0));
        c.Comment("Visiting right operand");
        Visit(context.expr(1));

        c.Comment("Popping operands");

        var right = c.PopObject(Register.X1);
        var left = c.PopObject(Register.X0);


            // Operación con enteros normales
            if (operation == "*")
            {
                c.Mul(Register.X0, Register.X0, Register.X1);
            }
            else if (operation == "/")
            {
                c.Div(Register.X0, Register.X0, Register.X1);
            }
            else if (operation == "%")
            {
                c.Mod(Register.X0, Register.X0, Register.X1);
            }

            c.Comment("Pushing integer result");
            c.Push(Register.X0);
            c.PushObject(c.CloneObject(left));
        

        return null;
    }

    public override Object? VisitVarDeclaration(GoLangParser.VarDeclarationContext context)
    {
        var varName = context.ID().GetText();
        c.Comment("Variable declaration: " + varName);

        // Verificar si hay una expresión explícita para asignar
        if (context.expr() != null)
        {
            // Si hay una expresión, visitarla normalmente
            Visit(context.expr());
        }
        else if (context.sliceInit() != null)
        {
            // Si es una inicialización de slice/array
            Visit(context.sliceInit());
        }
        else
        {
            // No hay expresión explícita, aplicar valores por defecto según el tipo
            if (context.type() != null)
            {
                string typeName = context.type().GetText();
                c.Comment($"Using default value for type: {typeName}");

                if (typeName == "string")
                {
                    // Valor por defecto para string: ""
                    var stringObject = c.StringObject();
                    c.PushConstant(stringObject, "");
                }
                else if (typeName == "int" || typeName.StartsWith("[]"))
                {
                    // Valor por defecto para int o arrays: 0
                    var intObject = c.IntObject();
                    c.PushConstant(intObject, 0);
                }
                else if (typeName == "bool")
                {
                    // Valor por defecto para bool: false
                    var boolObject = c.BoolObject();
                    c.Mov(Register.X0, 0); // false = 0
                    c.Push(Register.X0);
                    c.PushObject(boolObject);
                }
                else if (typeName == "rune")
                {
                    // Valor por defecto para rune: 0
                    var runeObject = c.RuneObject();
                    c.PushConstant(runeObject, 0);
                }
                else
                {
                    // Para otros tipos, usar 0 como valor por defecto genérico
                    var intObject = c.IntObject();
                    c.PushConstant(intObject, 0);
                }
            }
            else
            {
                // Si no se especifica tipo, asumir int como tipo por defecto
                c.Comment("Using default value: 0 (int)");
                var intObject = c.IntObject();
                c.PushConstant(intObject, 0);
            }
        }

        c.TagObject(varName);

        return null;
    }

    public override Object? VisitExprStatement(GoLangParser.ExprStatementContext context)
    {
        c.Comment("Expression statement");
        Visit(context.expr());
        c.Comment("Popping expression result");
        c.PopObject(Register.X0); // Desapilar el resultado de la expresión

        return null;
    }

    public override Object? VisitAssignment(GoLangParser.AssignmentContext context)
    {
        c.Comment("Assignment statement");

        // Si tenemos acceso a índice en el lado izquierdo (ej: array[i] = valor)
        if (context.expr().Length > 2)
        {
            // Manejo de asignación a índice de array
            c.Comment("Array index assignment");
            // Implementación pendiente para arrays
            return null;
        }

        // Asignación normal (a = expresión)
        string varName = context.ID().GetText();
        c.Comment("Assignment to variable: " + varName);

        // Visitar la expresión del lado derecho
        Visit(context.expr(0));

        var valueObject = c.PopObject(Register.X0); // Desapilar el valor de la expresión
        var (offset, varObject) = c.GetObject(varName); // Obtener el objeto de la variable 

        c.Mov(Register.X1, offset); // Mover el offset a X1
        c.Add(Register.X1, Register.SP, Register.X1); // Sumar el offset al stack pointer
        c.Str(Register.X0, Register.X1); // Almacenar el valor en la dirección de la variable
        c.Comment("Assignment complete");

        varObject.Type = valueObject.Type; // Actualizar el tipo del objeto de la variable  

        c.Push(Register.X0); // Volver a apilar el valor de la expresión
        c.PushObject(c.CloneObject(varObject)); // Clonar el objeto de la variable y apilarlo

        return null;
    }

    public override Object? VisitVariable(GoLangParser.VariableContext context)
    {
        var id = context.ID().GetText();
        c.Comment($"Loading variable '{id}'");

        var (offset, varObject) = c.GetObject(id);

        // Cargar el valor de la variable desde la memoria con offset correcto
        c.Comment($"Calculating offset for variable '{id}'");
        c.Mov(Register.X0, offset);
        c.Add(Register.X0, Register.SP, Register.X0);
        c.Ldr(Register.X0, Register.X0);

        // Guardar una copia independiente del valor en la pila
        c.Comment($"Pushing copy of variable value for '{id}'");
        c.Push(Register.X0);

        // Usar un nuevo objeto para evitar compartir referencias
        var newObject = new StackObject
        {
            Type = varObject.Type,
            Length = varObject.Length,
            Depth = varObject.Depth,
            ID = null  // No etiquetar este valor como variable
        };
        c.PushObject(newObject);

        return null;
    }

    public override Object? VisitBlock(GoLangParser.BlockContext context)
    {
        c.Comment("Block statement");

        // Guarda referencia al tamaño actual del stack antes de entrar al bloque
        int stackSizeBefore = c.stack.Count;

        c.NewScope(); // Crear un nuevo scope

        foreach (var statement in context.statement())
        {
            Visit(statement); // Visitar cada declaración en el bloque
        }

        int bytesToRemove = c.EndScope(); // Terminar el scope y obtener los bytes a eliminar

        if (bytesToRemove > 0)
        {
            c.Comment("Removing " + bytesToRemove + " bytes from stack");
            c.Addi(Register.SP, Register.SP, bytesToRemove); // Ajustar el puntero de pila
            c.Comment("Stack pointer adjusted");
        }

        // Eliminar cualquier objeto que se haya quedado en la pila después de finalizar el scope
        while (c.stack.Count > stackSizeBefore)
        {
            c.Comment("Removing leftover object from stack");
            c.PopObject(Register.X0); // Limpiar cualquier valor extra en la pila
        }

        return null;
    }

    public override Object? VisitNumber(GoLangParser.NumberContext context)
    {
        var value = context.GetText();
        c.Comment("Constant " + value);

        var intObject = c.IntObject();
        c.PushConstant(intObject, int.Parse(value));

        return null;
    }

    public override Object? VisitString(GoLangParser.StringContext context)
    {
        // eliminar las comillas
        var value = context.GetText().Trim('"');
        c.Comment("String constant: " + value);
        var stringObject = c.StringObject();
        c.PushConstant(stringObject, value);

        return null;
    }

    public override Object? VisitRune(GoLangParser.RuneContext context)
    {
        // Extraer el valor del rune (carácter) eliminando las comillas simples
        var text = context.GetText();
        var value = text.Substring(1, text.Length - 2); // Eliminar comillas simples

        int runeValue;
        if (value.StartsWith("\\")) // Es un carácter de escape
        {
            // Manejar caracteres de escape comunes
            switch (value)
            {
                case "\\n": runeValue = '\n'; break;
                case "\\t": runeValue = '\t'; break;
                case "\\r": runeValue = '\r'; break;
                case "\\\"": runeValue = '\"'; break;
                case "\\\'": runeValue = '\''; break;
                case "\\\\": runeValue = '\\'; break;
                case "\\b": runeValue = '\b'; break;
                case "\\f": runeValue = '\f'; break;
                default: runeValue = value[1]; break; // Caracter normal después de \
            }
        }
        else // Es un carácter normal
        {
            runeValue = char.ConvertToUtf32(value, 0); // Convertir a valor Unicode (rune)
        }

        c.Comment($"Rune constant: '{value}' (Unicode: {runeValue})");
        var runeObject = c.RuneObject();
        c.PushConstant(runeObject, runeValue);

        return null;
    }

    public override Object? VisitIncDecStatement(GoLangParser.IncDecStatementContext context)
    {
        var id = context.ID().GetText();
        var operation = context.op.Text;
        c.Comment($"Increment/Decrement operation: {id} {operation}");

        var (offset, varObject) = c.GetObject(id);

        // Cargar el valor de la variable
        c.Comment($"Loading variable '{id}'");
        c.Mov(Register.X1, offset);
        c.Add(Register.X1, Register.SP, Register.X1);
        c.Ldr(Register.X0, Register.X1);

        // Incrementar o decrementar el valor
        if (operation == "++")
        {
            c.Comment($"Incrementing '{id}'");
            c.Addi(Register.X0, Register.X0, 1);
        }
        else if (operation == "--")
        {
            c.Comment($"Decrementing '{id}'");
            c.Addi(Register.X0, Register.X0, -1);
        }

        // Guardar el valor de vuelta en la variable
        c.Comment($"Saving updated value back to '{id}'");
        c.Str(Register.X0, Register.X1);

        return null;
    }

    public override Object? VisitBoolean(GoLangParser.BooleanContext context)
    {
        var value = context.GetText();
        c.Comment("Boolean constant: " + value);

        var boolObject = c.BoolObject();

        // Convertir el string "true"/"false" a valor entero (1/0)
        int boolValue = value.ToLower() == "true" ? 1 : 0;

        c.Mov(Register.X0, boolValue);
        c.Push(Register.X0);

        c.PushObject(boolObject);
        return null;
    }

    // Implementación para operador lógico OR (||)
    public override Object? VisitOr(GoLangParser.OrContext context)
    {
        c.Comment("Logical OR operation");

        // Generar etiquetas para el manejo de cortocircuito
        string trueLabel = GenerateUniqueLabel("or_true");
        string endLabel = GenerateUniqueLabel("or_end");

        // Evaluar el primer operando
        c.Comment("Evaluating first operand");
        Visit(context.expr(0));
        var left = c.PopObject(Register.X0);

        // Si el primer operando es verdadero, saltamos directamente a true (cortocircuito)
        c.Comment("Short-circuit evaluation: if first operand is true, result is true");
        c.Cbnz(Register.X0, trueLabel);

        // Si llegamos aquí, el primer operando es falso, evaluamos el segundo
        c.Comment("First operand is false, evaluating second operand");
        Visit(context.expr(1));
        var right = c.PopObject(Register.X0);

        // No es necesaria más lógica aquí, ya que el resultado está en X0
        c.B(endLabel);

        // Si el primer operando era verdadero, establecer resultado como verdadero
        c.Label(trueLabel);
        c.Mov(Register.X0, 1);

        // Fin de la evaluación OR
        c.Label(endLabel);

        // Guardar el resultado en la pila
        c.Push(Register.X0);

        // Crear un objeto para el resultado (siempre booleano)
        var resultObject = new StackObject
        {
            Type = StackObject.StackObjectType.Boolean,
            Length = 8,
            Depth = left.Depth,
            ID = null
        };
        c.PushObject(resultObject);

        return null;
    }

    // Implementación para operador lógico AND (&&)
    public override Object? VisitAnd(GoLangParser.AndContext context)
    {
        c.Comment("Logical AND operation");

        // Generar etiquetas para el manejo de cortocircuito
        string falseLabel = GenerateUniqueLabel("and_false");
        string endLabel = GenerateUniqueLabel("and_end");

        // Evaluar el primer operando
        c.Comment("Evaluating first operand");
        Visit(context.expr(0));
        var left = c.PopObject(Register.X0);

        // Si el primer operando es falso, saltamos directamente a false (cortocircuito)
        c.Comment("Short-circuit evaluation: if first operand is false, result is false");
        c.Cbz(Register.X0, falseLabel);

        // Si llegamos aquí, el primer operando es verdadero, evaluamos el segundo
        c.Comment("First operand is true, evaluating second operand");
        Visit(context.expr(1));
        var right = c.PopObject(Register.X0);

        // No es necesaria más lógica aquí, ya que el resultado está en X0
        c.B(endLabel);

        // Si el primer operando era falso, establecer resultado como falso
        c.Label(falseLabel);
        c.Mov(Register.X0, 0);

        // Fin de la evaluación AND
        c.Label(endLabel);

        // Guardar el resultado en la pila
        c.Push(Register.X0);

        // Crear un objeto para el resultado (siempre booleano)
        var resultObject = new StackObject
        {
            Type = StackObject.StackObjectType.Boolean,
            Length = 8,
            Depth = left.Depth,
            ID = null
        };
        c.PushObject(resultObject);

        return null;
    }

    // Implementación para operador lógico NOT (!)
    public override Object? VisitNot(GoLangParser.NotContext context)
    {
        c.Comment("Logical NOT operation");

        // Evaluar la expresión
        c.Comment("Evaluating expression");
        Visit(context.expr());
        var expr = c.PopObject(Register.X0);

        // Invertir el valor (NOT lógico): si es 0 -> 1, si no es 0 -> 0
        c.Comment("Inverting boolean value");
        c.Eor(Register.X0, Register.X0, 1);  // XOR con 1 invierte el bit menos significativo

        // Guardar el resultado en la pila
        c.Push(Register.X0);

        // Crear un objeto para el resultado (siempre booleano)
        var resultObject = new StackObject
        {
            Type = StackObject.StackObjectType.Boolean,
            Length = 8,
            Depth = expr.Depth,
            ID = null
        };
        c.PushObject(resultObject);

        return null;
    }

    public override Object? VisitIfStatement(GoLangParser.IfStatementContext context)
    {
        c.Comment("If statement");

        // Generar etiquetas únicas para los saltos
        string elseLabel = GenerateUniqueLabel("else");
        string endIfLabel = GenerateUniqueLabel("endif");

        // Evaluar la condición
        c.Comment("Evaluating condition");
        Visit(context.expr());
        var conditionObj = c.PopObject(Register.X0);

        // Si es falso (0), saltar a la sección else
        c.Comment("Checking condition");
        c.Cbz(Register.X0, elseLabel);

        // Bloque then - ejecutar si la condición es verdadera
        c.Comment("Then block");

        // Visitar el bloque then (puede ser un bloque o una instrucción simple)
        if (context.block() != null)
        {
            Visit(context.block());
        }

        // Saltar al final del if después de ejecutar el bloque then
        c.B(endIfLabel);

        // Sección else
        c.Label(elseLabel);

        // Si hay un bloque else, visitarlo
        if (context.elseBlock() != null)
        {
            c.Comment("Else block");
            Visit(context.elseBlock());
        }

        // Etiqueta para el final del if
        c.Label(endIfLabel);

        return null;
    }

    public override Object? VisitElseBlock(GoLangParser.ElseBlockContext context)
    {
        // El elseBlock puede ser otro if (else if), un bloque de código o una instrucción simple
        if (context.ifStatement() != null)
        {
            c.Comment("Else-if branch");
            Visit(context.ifStatement());
        }
        else if (context.block() != null)
        {
            c.Comment("Else branch with block");
            Visit(context.block());
        }

        return null;
    }

    public override Object? VisitWhileStatement(GoLangParser.WhileStatementContext context)
    {
        c.Comment("While statement");

        // Generar etiquetas únicas para los saltos
        string loopStartLabel = GenerateUniqueLabel("while_start");
        string loopEndLabel = GenerateUniqueLabel("while_end");

        // Guardar las etiquetas actuales para break y continue
        string oldBreakLabel = _currentBreakLabel;
        string oldContinueLabel = _currentContinueLabel;

        // Establecer las nuevas etiquetas para el bucle actual
        _currentBreakLabel = loopEndLabel;
        _currentContinueLabel = loopStartLabel;

        // Punto de inicio del bucle donde evaluamos la condición
        c.Label(loopStartLabel);

        // Evaluar la condición
        c.Comment("Evaluating while condition");
        Visit(context.expr());
        var conditionObj = c.PopObject(Register.X0);

        // Si la condición es falsa (0), saltar al final del bucle
        c.Comment("Checking condition");
        c.Cbz(Register.X0, loopEndLabel);

        // Cuerpo del bucle - ejecutar si la condición es verdadera
        c.Comment("While body");

        // Visitar el cuerpo del bucle (puede ser un bloque o una instrucción simple)
        if (context.block() != null)
        {
            Visit(context.block());
        }

        // Volver al inicio del bucle para evaluar de nuevo la condición
        c.Comment("Jump back to loop start");
        c.B(loopStartLabel);

        // Etiqueta para el final del bucle
        c.Label(loopEndLabel);

        // Restaurar las etiquetas anteriores para break y continue
        _currentBreakLabel = oldBreakLabel;
        _currentContinueLabel = oldContinueLabel;

        return null;
    }

    public override Object? VisitBreakStatement(GoLangParser.BreakStatementContext context)
    {
        if (string.IsNullOrEmpty(_currentBreakLabel))
        {
            throw new Exception("Break statement outside of a loop or switch");
        }

        c.Comment("Break statement");
        c.B(_currentBreakLabel);

        return null;
    }

    public override Object? VisitContinueStatement(GoLangParser.ContinueStatementContext context)
    {
        if (string.IsNullOrEmpty(_currentContinueLabel))
        {
            throw new Exception("Continue statement outside of a loop");
        }

        c.Comment("Continue statement");
        c.B(_currentContinueLabel);

        return null;
    }

    public override Object? VisitComparison(GoLangParser.ComparisonContext context)
    {
        c.Comment("Comparison operation");
        var operation = context.op.Text; // Obtener el operador (<, >, <=, >=)

        // Visitar operandos
        c.Comment("Visiting left operand");
        Visit(context.expr(0));
        c.Comment("Visiting right operand");
        Visit(context.expr(1));

        c.Comment("Popping operands");
        var right = c.PopObject(Register.X1);
        var left = c.PopObject(Register.X0);

        // Generar etiquetas únicas para los saltos
        string trueLabel = GenerateUniqueLabel("cmp_true");
        string endLabel = GenerateUniqueLabel("cmp_end");

        // Realizar la comparación adecuada según el operador
        c.Comment($"Comparison with operator: {operation}");
        c.Cmp(Register.X0, Register.X1);

        switch (operation)
        {
            case "<":
                c.B("lt", trueLabel); // B.LT = Branch if Less Than
                break;
            case ">":
                c.B("gt", trueLabel); // B.GT = Branch if Greater Than
                break;
            case "<=":
                c.B("le", trueLabel); // B.LE = Branch if Less than or Equal
                break;
            case ">=":
                c.B("ge", trueLabel); // B.GE = Branch if Greater than or Equal
                break;
        }

        // Si llegamos aquí, la comparación es falsa
        c.Mov(Register.X0, 0);
        c.B(endLabel);

        // Etiqueta para el caso verdadero
        c.Label(trueLabel);
        c.Mov(Register.X0, 1);

        // Etiqueta para el final
        c.Label(endLabel);

        // Guardar el resultado en la pila
        c.Push(Register.X0);

        // Crear un objeto para el resultado (siempre booleano)
        var resultObject = new StackObject
        {
            Type = StackObject.StackObjectType.Boolean,
            Length = 8,
            Depth = left.Depth,
            ID = null
        };
        c.PushObject(resultObject);

        return null;
    }

    public override Object? VisitEquality(GoLangParser.EqualityContext context)
    {
        c.Comment("Equality operation");
        var operation = context.op.Text; // Obtener el operador (== o !=)

        // Visitar operandos
        c.Comment("Visiting left operand");
        Visit(context.expr(0));
        c.Comment("Visiting right operand");
        Visit(context.expr(1));

        c.Comment("Popping operands");
        var right = c.PopObject(Register.X1);
        var left = c.PopObject(Register.X0);

        // Generar etiquetas únicas para los saltos
        string trueLabel = GenerateUniqueLabel("eq_true");
        string endLabel = GenerateUniqueLabel("eq_end");

        // Realizar la comparación adecuada según el operador
        c.Comment($"Equality check with operator: {operation}");
        c.Cmp(Register.X0, Register.X1);

        if (operation == "==")
        {
            c.B("eq", trueLabel); // B.EQ = Branch if EQual
        }
        else if (operation == "!=")
        {
            c.B("ne", trueLabel); // B.NE = Branch if Not Equal
        }

        // Si llegamos aquí, la comparación es falsa
        c.Mov(Register.X0, 0);
        c.B(endLabel);

        // Etiqueta para el caso verdadero
        c.Label(trueLabel);
        c.Mov(Register.X0, 1);

        // Etiqueta para el final
        c.Label(endLabel);

        // Guardar el resultado en la pila
        c.Push(Register.X0);

        // Crear un objeto para el resultado (siempre booleano)
        var resultObject = new StackObject
        {
            Type = StackObject.StackObjectType.Boolean,
            Length = 8,
            Depth = left.Depth,
            ID = null
        };
        c.PushObject(resultObject);

        return null;
    }

    public override Object? VisitForStatement(GoLangParser.ForStatementContext context)
    {
        c.Comment("For statement");

        // Generar etiquetas únicas para los saltos
        string loopStartLabel = GenerateUniqueLabel("for_start");
        string loopCondLabel = GenerateUniqueLabel("for_cond");
        string loopBodyLabel = GenerateUniqueLabel("for_body");
        string loopEndLabel = GenerateUniqueLabel("for_end");
        string loopPostLabel = GenerateUniqueLabel("for_post");

        // Guardar las etiquetas actuales para break y continue
        string oldBreakLabel = _currentBreakLabel;
        string oldContinueLabel = _currentContinueLabel;

        // Establecer las nuevas etiquetas para el bucle actual
        _currentBreakLabel = loopEndLabel;
        _currentContinueLabel = loopPostLabel;

        // Determinar qué tipo de bucle for estamos manejando
        if (context.forCondition() != null)
        {
            // Tipo 1: for condición { }
            c.Comment("For with condition (similar to while)");

            // Punto de inicio del bucle donde evaluamos la condición
            c.Label(loopStartLabel);

            // Evaluar la condición
            c.Comment("Evaluating for condition");
            Visit(context.forCondition().expr());
            var conditionObj = c.PopObject(Register.X0);

            // Si la condición es falsa (0), saltar al final del bucle
            c.Comment("Checking condition");
            c.Cbz(Register.X0, loopEndLabel);

            // Cuerpo del bucle - ejecutar si la condición es verdadera
            c.Comment("For body");

            // Visitar el cuerpo del bucle (puede ser un bloque o una instrucción simple)
            Visit(context.block());

            // Volver al inicio del bucle para evaluar de nuevo la condición
            c.Comment("Jump back to loop start");
            c.B(loopStartLabel);
        }
        else if (context.forClause() != null)
        {
            // Tipo 2: for i := 0; i < 10; i++ { }
            c.Comment("For with clause (C-style)");
            var forClause = context.forClause();

            // Crear un nuevo scope para las variables del for
            c.NewScope();

            // 1. Inicialización (si existe)
            if (forClause.initStmt() != null)
            {
                c.Comment("For initialization");
                Visit(forClause.initStmt());
            }

            // 2. Saltar a la verificación de la condición
            c.B(loopCondLabel);

            // 3. Actualización (post-statement) - se ejecuta después de cada iteración
            c.Label(loopPostLabel);
            if (forClause.postStmt() != null)
            {
                c.Comment("For post-statement");
                Visit(forClause.postStmt());
            }

            // 4. Verificar la condición
            c.Label(loopCondLabel);
            if (forClause.expr() != null)
            {
                c.Comment("Evaluating for condition");
                Visit(forClause.expr());
                var conditionObj = c.PopObject(Register.X0);

                // Si la condición es falsa (0), saltar al final del bucle
                c.Comment("Checking condition");
                c.Cbz(Register.X0, loopEndLabel);
            }

            // 5. Cuerpo del bucle
            c.Comment("For body");
            Visit(context.block());

            // 6. Volver a la actualización
            c.B(loopPostLabel);
        }
        else if (context.forRange() != null)
        {
            // Tipo 3: for i, v := range slice { }
            c.Comment("For-range loop not implemented yet");
            // La implementación completa del for-range requiere soporte para slices
            // y será implementada en una iteración futura
        }

        // Etiqueta para el final del bucle
        c.Label(loopEndLabel);

        // Restaurar las etiquetas anteriores para break y continue
        _currentBreakLabel = oldBreakLabel;
        _currentContinueLabel = oldContinueLabel;

        return null;
    }

    // Implementar el manejo de declaraciones implícitas para variables como i := 0
    public override Object? VisitImplicitDeclaration(GoLangParser.ImplicitDeclarationContext context)
    {
        var id = context.ID().GetText();
        c.Comment($"Implicit declaration: {id}");

        // Visitar la expresión de la parte derecha
        Visit(context.expr());

        // Etiquetar el objeto en la pila con el ID de la variable
        c.TagObject(id);

        return null;
    }

    public override Object? VisitForCondition(GoLangParser.ForConditionContext context)
    {
        // Este método simplemente visita y evalúa la expresión de condición
        // La lógica principal está en VisitForStatement
        return Visit(context.expr());
    }

    public override Object? VisitFloat(GoLangParser.FloatContext context)
    {
        return null;
    }

    // Implementación de la negación unitaria
    public override Object? VisitNeg(GoLangParser.NegContext context)
    {
        c.Comment("Unary negation operation");
        
        // Visitar la expresión a negar
        c.Comment("Visiting expression to negate");
        Visit(context.expr());
        
        // Obtener el valor a negar
        c.Comment("Popping value to negate");
        var value = c.PopObject(Register.X0);
        
        // Verificar que sea un tipo numérico (entero o float)
        if (value.Type == StackObject.StackObjectType.Integer)
        {
            // Negación de entero: multiplicar por -1
            c.Comment("Negating integer value");
            c.Mov(Register.X1, -1);
            c.Mul(Register.X0, Register.X0, Register.X1);
            
            // Guardar el resultado en la pila
            c.Comment("Pushing negated result");
            c.Push(Register.X0);
            
            // Mantener el mismo tipo de objeto en la pila
            c.PushObject(c.CloneObject(value));
        }
        else if (value.Type == StackObject.StackObjectType.Float)
        {
            // Para floats (pendiente de implementar)
            c.Comment("Float negation not implemented yet");
            c.Push(Register.X0);
            c.PushObject(c.CloneObject(value));
        }
        else
        {
            // Si no es un tipo numérico, simplemente devolver el valor original
            c.Comment("Cannot negate non-numeric value, returning original");
            c.Push(Register.X0);
            c.PushObject(c.CloneObject(value));
        }
        
        return null;
    }
}