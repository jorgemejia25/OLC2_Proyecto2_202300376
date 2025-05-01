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

        // Verificar si hay una lista de expresiones
        if (context.exprList() != null)
        {
            var expressions = context.exprList().expr();
            c.Comment($"Processing {expressions.Length} expressions to print");

            // Procesar cada expresión en la lista
            for (int i = 0; i < expressions.Length; i++)
            {
                c.Comment($"Processing expression {i + 1} of {expressions.Length}");

                // Visitar la expresión para ponerla en la pila
                Visit(expressions[i]);

                // Imprimir el valor
                c.Comment($"Popping value {i + 1} for printing");
                var isDouble = c.TopObject().Type == StackObject.StackObjectType.Float;
                var isIntSlice = c.TopObject().Type == StackObject.StackObjectType.IntSlice;
                var value = c.PopObject(isDouble ? Register.D0 : Register.X0);

                // Determinar el tipo y usar la función de impresión adecuada
                if (value.Type == StackObject.StackObjectType.Integer)
                {
                    c.PrintIntegerNoNewline(Register.X0);
                }
                else if (value.Type == StackObject.StackObjectType.String)
                {
                    c.PrintString(Register.X0);
                }
                else if (value.Type == StackObject.StackObjectType.Boolean)
                {
                    c.PrintBool(Register.X0);
                }
                else if (value.Type == StackObject.StackObjectType.Rune)
                {
                    c.PrintRune(Register.X0);
                }
                else if (value.Type == StackObject.StackObjectType.Float)
                {
                    c.PrintFloat();
                }
                else if (value.Type == StackObject.StackObjectType.IntSlice)
                {
                    c.Comment("Printing int slice");
                    c.PrintIntSlice(Register.X0);
                }

                // Si no es la última expresión, imprimir un espacio
                if (i < expressions.Length - 1)
                {
                    c.Comment("Printing space between values");
                    c.PrintSpace();
                }
            }

            // Imprimir un salto de línea al final
            c.Comment("Adding newline at end");
            c.PrintNewline();
        }
        else
        {
            // Si no hay expresiones, solo imprimir un salto de línea
            c.Comment("Empty print statement, only printing newline");
            c.PrintNewline();
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

        // Primero, determinar si alguno de los operandos es flotante
        var isRightFloat = c.TopObject().Type == StackObject.StackObjectType.Float;
        var right = c.PopObject(isRightFloat ? Register.D1 : Register.X1);

        var isLeftFloat = c.TopObject().Type == StackObject.StackObjectType.Float;
        var left = c.PopObject(isLeftFloat ? Register.D0 : Register.X0);

        // Verificar si alguno es float para operaciones de punto flotante
        if (isRightFloat || isLeftFloat)
        {
            c.Comment("Converting operands to float if needed");

            // Convertir explícitamente los operandos a float si es necesario
            if (!isLeftFloat)
            {
                c.Comment("Converting left operand from int to float");
                c.Scvtf(Register.D0, Register.X0);
            }

            if (!isRightFloat)
            {
                c.Comment("Converting right operand from int to float");
                c.Scvtf(Register.D1, Register.X1);
            }

            c.Comment($"Performing float {operation} operation");
            if (operation == "+")
            {
                c.Fadd(Register.D0, Register.D0, Register.D1);
            }
            else if (operation == "-")
            {
                c.Fsub(Register.D0, Register.D0, Register.D1);
            }

            c.Comment("Pushing float result");
            c.Push(Register.D0);

            // El resultado es siempre float cuando alguno de los operandos es float
            var resultObject = new StackObject
            {
                Type = StackObject.StackObjectType.Float,
                Length = 8,
                Depth = left.Depth,
                ID = null
            };
            c.PushObject(resultObject);

            return null;
        }

        // Verificar si ambos son strings para concatenación
        if (operation == "+" && left.Type == StackObject.StackObjectType.String && right.Type == StackObject.StackObjectType.String)
        {
            c.Comment("String concatenation");
            // Usar el método ConcatStrings para llamar a la función concat_strings
            c.ConcatStrings(Register.X0, Register.X1);

            c.Comment("Pushing string result");
            c.Push(Register.X0);

            // Crear un nuevo objeto para el resultado
            var stringResultObject = new StackObject
            {
                Type = StackObject.StackObjectType.String,
                Length = 8,
                Depth = left.Depth,
                ID = null
            };
            c.PushObject(stringResultObject);

            return null;
        }

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

        // Crear un nuevo objeto para el resultado
        var intResultObject = new StackObject
        {
            Type = left.Type,
            Length = left.Length,
            Depth = left.Depth,
            ID = null
        };
        c.PushObject(intResultObject);

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

        // Primero, determinar si alguno de los operandos es flotante
        var isRightFloat = c.TopObject().Type == StackObject.StackObjectType.Float;
        var right = c.PopObject(isRightFloat ? Register.D1 : Register.X1);

        var isLeftFloat = c.TopObject().Type == StackObject.StackObjectType.Float;
        var left = c.PopObject(isLeftFloat ? Register.D0 : Register.X0);

        // Verificar si alguno es float o si es una operación de división
        bool shouldConvertToFloat = isRightFloat || isLeftFloat || operation == "/";

        if (shouldConvertToFloat)
        {
            c.Comment("Converting operands to float if needed");

            // Convertir explícitamente los operandos a float si es necesario
            if (!isLeftFloat)
            {
                c.Comment("Converting left operand from int to float");
                c.Scvtf(Register.D0, Register.X0);
            }

            if (!isRightFloat)
            {
                c.Comment("Converting right operand from int to float");
                c.Scvtf(Register.D1, Register.X1);
            }

            c.Comment($"Performing float {operation} operation");
            if (operation == "*")
            {
                c.Fmul(Register.D0, Register.D0, Register.D1);
            }
            else if (operation == "/")
            {
                c.Fdiv(Register.D0, Register.D0, Register.D1);
            }
            else if (operation == "%")
            {
                // Módulo para flotantes usando fmod
                c.UseStdLib("float_mod");
                c.Align(16); // Garantizar alineamiento a 16 bytes para llamadas a función
                c.Comment("D0 contains first float value");
                c.Comment("D1 contains second float value");
                c.Bl("float_mod"); // Resultado en D0
            }

            c.Comment("Pushing float result");
            c.Push(Register.D0);

            // El resultado es siempre float cuando alguno de los operandos es float o es división
            var resultObject = new StackObject
            {
                Type = StackObject.StackObjectType.Float,
                Length = 8,
                Depth = left.Depth,
                ID = null
            };
            c.PushObject(resultObject);
        }
        else
        {
            // Operación con enteros normales
            if (operation == "*")
            {
                c.Mul(Register.X0, Register.X0, Register.X1);
            }
            else if (operation == "/")
            {
                // Este caso no debería ocurrir porque ahora todas las divisiones se convierten a float
                c.Div(Register.X0, Register.X0, Register.X1);
            }
            else if (operation == "%")
            {
                c.Mod(Register.X0, Register.X0, Register.X1);
            }

            c.Comment("Pushing integer result");
            c.Push(Register.X0);

            // Crear un nuevo objeto para el resultado
            var intResultObject = new StackObject
            {
                Type = left.Type,
                Length = left.Length,
                Depth = left.Depth,
                ID = null
            };
            c.PushObject(intResultObject);
        }

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
        if (context.expr().Length > 1 && context.expr()[0] != null && context.expr()[1] != null)
        {
            // Manejo de asignación a índice de array
            c.Comment("Slice/array index assignment: expr[index] = value");

            // Primero, evaluar la expresión que representa el slice/array
            c.Comment("Evaluating slice/array expression");
            Visit(context.expr()[0]);

            // Luego, evaluar la expresión que representa el índice
            c.Comment("Evaluating index expression");
            Visit(context.expr()[1]);

            // Finalmente, evaluar la expresión del lado derecho (el valor a asignar)
            c.Comment("Evaluating value expression");
            Visit(context.expr()[2]);

            // Desapilar en orden inverso: valor, índice, slice
            c.Comment("Popping value to assign");
            var valueObj = c.PopObject(Register.X0); // Valor a asignar

            c.Comment("Popping index value");
            var indexObj = c.PopObject(Register.X1); // Índice

            c.Comment("Popping slice/array address");
            var sliceObj = c.PopObject(Register.X2); // Dirección base del slice

            // Verificar que estamos modificando un slice
            if (sliceObj.Type != StackObject.StackObjectType.IntSlice)
            {
                c.Comment("Warning: Attempting to modify a non-slice object.");
            }

            // 1. Verificar que el índice no exceda el tamaño del slice
            c.Comment("Checking index bounds");

            // Cargar el tamaño del slice (primeros 8 bytes en la dirección del slice)
            c.Ldr(Register.X3, Register.X2); // X3 = longitud del slice

            // Comparar el índice con el tamaño
            c.Cmp(Register.X1, Register.X3);

            // Generar etiquetas para el manejo de error y acceso correcto
            string indexOkLabel = GenerateUniqueLabel("assign_index_ok");
            string indexErrorLabel = GenerateUniqueLabel("assign_index_error");
            string endLabel = GenerateUniqueLabel("assign_index_end");

            // Si el índice es mayor o igual que el tamaño, es un error (fuera de rango)
            c.B("lt", indexOkLabel); // Saltar si el índice es menor que el tamaño

            // Manejar error de índice fuera de rango
            c.Label(indexErrorLabel);
            c.Comment("Index out of bounds error in assignment");
            c.B(endLabel);

            // Índice válido, proceder con la asignación
            c.Label(indexOkLabel);

            // 2. Calcular la dirección del elemento: dirección_base + 8 (longitud) + índice * 8
            c.Comment("Calculating element address: base + 8 + index*8");
            c.Add(Register.X2, Register.X2, "8"); // Saltar los primeros 8 bytes (longitud)
            c.Mov(Register.X3, 8); // Tamaño de cada elemento (8 bytes)
            c.Mul(Register.X1, Register.X1, Register.X3); // X1 = índice * 8
            c.Add(Register.X2, Register.X2, Register.X1); // X2 = base + 8 + índice*8

            // 3. Almacenar el valor en la dirección calculada
            c.Comment("Storing value at the calculated address");
            c.Str(Register.X0, Register.X2); // Guardar el valor en la dirección calculada

            c.Label(endLabel);

            return null;
        }

        // Asignación normal (a = expresión)
        string varName = context.ID().GetText();
        c.Comment("Assignment to variable: " + varName);

        // Visitar la expresión del lado derecho
        Visit(context.expr(0));

        var valueObject = c.PopObject(Register.X0); // Desapilar el valor de la expresión
        var (offset, varObject) = c.GetObject(varName); // Obtener el objeto de la variable

        // Guardar una copia del valor en X0 para almacenarlo en la variable
        c.Comment($"Storing value to variable '{varName}' at offset {offset}");
        c.Mov(Register.X1, offset);
        c.Add(Register.X1, Register.SP, Register.X1); // Calcular dirección en la pila
        c.Str(Register.X0, Register.X1); // Almacenar el valor en la dirección

        // Actualizar el tipo de la variable si es necesario
        varObject.Type = valueObject.Type;

        // No necesitamos volver a apilar el valor aquí, ya que está en X0
        c.Comment("Assignment complete");

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
        var switchResultObject = new StackObject
        {
            Type = StackObject.StackObjectType.Boolean,
            Length = 8,
            Depth = left.Depth,
            ID = null
        };
        c.PushObject(switchResultObject);

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
        var equalityResultObject = new StackObject
        {
            Type = StackObject.StackObjectType.Boolean,
            Length = 8,
            Depth = left.Depth,
            ID = null
        };
        c.PushObject(equalityResultObject);

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
        var negResultObject = new StackObject
        {
            Type = StackObject.StackObjectType.Boolean,
            Length = 8,
            Depth = left.Depth,
            ID = null
        };
        c.PushObject(negResultObject);

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

        // Primero, determinar si alguno de los operandos es flotante
        var isRightFloat = c.TopObject().Type == StackObject.StackObjectType.Float;
        var right = c.PopObject(isRightFloat ? Register.D1 : Register.X1);

        var isLeftFloat = c.TopObject().Type == StackObject.StackObjectType.Float;
        var left = c.PopObject(isLeftFloat ? Register.D0 : Register.X0);

        // Generar etiquetas únicas para los saltos
        string trueLabel = GenerateUniqueLabel("eq_true");
        string endLabel = GenerateUniqueLabel("eq_end");

        // Verificar si ambos son strings para manejo especial
        if (left.Type == StackObject.StackObjectType.String && right.Type == StackObject.StackObjectType.String)
        {
            c.Comment("String equality comparison");

            // Llamar a la función de biblioteca para comparar strings
            c.UseStdLib("string_equals");
            c.Align(16); // Garantizar alineamiento a 16 bytes para llamadas a función
            // Los argumentos ya están en X0 y X1
            c.Comment("X0 contains first string address");
            c.Comment("X1 contains second string address");
            c.Bl("string_equals");

            // X0 ahora contiene 1 si son iguales, 0 si no son iguales
            // Si la operación es !=, invertimos el resultado
            if (operation == "!=")
            {
                c.Comment("Inverting result for != operator");
                c.Eor(Register.X0, Register.X0, 1);
            }

            // Guardar el resultado en la pila
            c.Push(Register.X0);

            // Crear un objeto para el resultado (siempre booleano)
            var equalityResultObject = new StackObject
            {
                Type = StackObject.StackObjectType.Boolean,
                Length = 8,
                Depth = left.Depth,
                ID = null
            };
            c.PushObject(equalityResultObject);

            return null;
        }

        // Verificar si alguno es float para manejar comparaciones de punto flotante
        if (isLeftFloat || isRightFloat)
        {
            c.Comment("Float equality comparison");

            // Convertir explícitamente los operandos a float si es necesario
            if (!isLeftFloat)
            {
                c.Comment("Converting left operand from int to float");
                c.Scvtf(Register.D0, Register.X0);
            }

            if (!isRightFloat)
            {
                c.Comment("Converting right operand from int to float");
                c.Scvtf(Register.D1, Register.X1);
            }

            // Comparar los valores flotantes
            c.Comment("Comparing float values");
            c.Fcmp(Register.D0, Register.D1);

            // Saltar según el operador de comparación
            if (operation == "==")
            {
                c.B("eq", trueLabel); // B.EQ = Branch if EQual
            }
            else if (operation == "!=")
            {
                c.B("ne", trueLabel); // B.NE = Branch if Not Equal
            }
        }
        else
        {
            // Para tipos que no son string ni float, usar la comparación normal de enteros
            c.Comment($"Integer equality check with operator: {operation}");
            c.Cmp(Register.X0, Register.X1);

            if (operation == "==")
            {
                c.B("eq", trueLabel); // B.EQ = Branch if EQual
            }
            else if (operation == "!=")
            {
                c.B("ne", trueLabel); // B.NE = Branch if Not Equal
            }
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
        string loopPostLabel = GenerateUniqueLabel("for_post");
        string loopEndLabel = GenerateUniqueLabel("for_end");

        // Guardar las etiquetas actuales para break y continue
        string oldBreakLabel = _currentBreakLabel;
        string oldContinueLabel = _currentContinueLabel;

        // Establecer las nuevas etiquetas para el bucle actual
        _currentBreakLabel = loopEndLabel;

        // Determinar qué tipo de bucle for estamos manejando
        if (context.forCondition() != null)
        {
            // Tipo 1: for condición { }
            c.Comment("For with condition (similar to while)");

            // Para este tipo de bucle, el continue debe volver directamente al inicio
            _currentContinueLabel = loopStartLabel;

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

            // Para este tipo de bucle, el continue debe saltar a la sección de post-statement
            _currentContinueLabel = loopPostLabel;

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
            // Para consistencia, también establecemos la etiqueta continue aquí
            _currentContinueLabel = loopStartLabel;
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
        var value = context.GetText();
        c.Comment("Float constant: " + value);

        // Convertir el string a float y apilarlo
        var floatObject = c.FloatObject();
        c.PushConstant(floatObject, double.Parse(value));

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

    public override Object? VisitSwitchStatement(GoLangParser.SwitchStatementContext context)
    {
        c.Comment("Switch statement");

        // Generar etiquetas únicas para el final del switch y los casos
        string endSwitchLabel = GenerateUniqueLabel("switch_end");

        // Guardar la etiqueta actual para break
        string oldBreakLabel = _currentBreakLabel;
        _currentBreakLabel = endSwitchLabel;

        // Evaluar la expresión de la condición del switch y guardar en registro x19
        c.Comment("Evaluating switch expression");
        Visit(context.expr());
        var switchExpr = c.PopObject(Register.X19);

        // Procesar todos los casos
        var caseStatements = context.caseStatement();
        for (int i = 0; i < caseStatements.Length; i++)
        {
            string nextCaseLabel = GenerateUniqueLabel($"case_next_{i}");

            // Evaluar la expresión del case
            c.Comment($"Evaluating case {i} expression");
            Visit(caseStatements[i].expr());
            var caseExpr = c.PopObject(Register.X0);

            // Comparar la expresión del switch con la expresión del case
            c.Comment("Comparing switch expression with case expression");
            c.Cmp(Register.X19, Register.X0);

            // Si no son iguales, saltar al siguiente case
            c.Comment("If not equal, jump to next case");
            c.B("ne", nextCaseLabel);

            // Ejecutar las instrucciones del case
            c.Comment($"Executing case {i} body");
            foreach (var statement in caseStatements[i].statement())
            {
                Visit(statement);
            }

            // Saltar al final del switch (implicit break)
            c.Comment("Implicit break at end of case");
            c.B(endSwitchLabel);

            // Etiqueta para el siguiente case
            c.Label(nextCaseLabel);
        }

        // Procesar el caso default si existe
        if (context.defaultCase() != null)
        {
            c.Comment("Default case");
            foreach (var statement in context.defaultCase().statement())
            {
                Visit(statement);
            }
        }

        // Etiqueta para el final del switch
        c.Label(endSwitchLabel);

        // Restaurar la etiqueta de break
        _currentBreakLabel = oldBreakLabel;

        return null;
    }

    public override Object? VisitFuncDeclaration(GoLangParser.FuncDeclarationContext context)
    {
        var funcName = context.ID().GetText();
        c.Comment($"Function declaration: {funcName}");

        // Generar etiqueta única para la función
        string funcLabel = $"func_{funcName}";

        // Generar etiqueta para el punto de retorno a la función llamante
        string returnLabel = $"ret_{funcName}";

        // Saltar la ejecución de la función ya que estamos en la sección de declaración
        c.B($"skip_{funcName}");

        // Escribir el label para la función
        c.Label(funcLabel);

        // Setup del stack frame
        c.Comment("Function prologue: saving frame pointer and return address");
        c.Push(Register.X29);  // Guardar el frame pointer actual (FP)
        c.Push(Register.X30);  // Guardar la dirección de retorno (LR)

        // Establecer nuevo frame pointer
        c.Comment("FP = SP");
        c.MovReg(Register.X29, Register.SP);  // FP = SP

        c.NewScope();  // Crear un nuevo ámbito para la función

        // Procesar los parámetros de la función si existen
        if (context.funcParams() != null)
        {
            var params_list = context.funcParams().funcParam();
            int paramCount = params_list.Length;

            c.Comment($"Setting up {paramCount} parameters");

            // Los parámetros en ARM64 se pasan en registros X0-X7 para los primeros 8 parámetros
            // Los adicionales están en la pila
            for (int i = 0; i < paramCount; i++)
            {
                var paramName = params_list[i].ID().GetText();
                var paramType = params_list[i].type().GetText();
                c.Comment($"Parameter {i + 1}: {paramName} (type: {paramType})");

                if (i < 8)  // Los primeros 8 parámetros están en registros X0-X7
                {
                    // Guardar el valor del parámetro en la pila
                    c.Push($"x{i}");

                    // Crear un objeto de pila para este parámetro con el tipo correcto
                    var paramObject = new StackObject
                    {
                        Type = DetermineStackObjectType(paramType),
                        Length = 8,
                        Depth = c.stack.Count > 0 ? c.stack.Last().Depth : 0,
                        ID = paramName
                    };

                    // Agregar el objeto a la pila
                    c.PushObject(paramObject);
                    c.TagObject(paramName);
                }
                else  // Parámetros adicionales están ya en la pila relativa al FP
                {
                    // Necesitaríamos copiarlos desde su posición de pila actual
                    // Esta implementación requeriría cálculos más complejos de offset
                }
            }
        }

        // Visitar el bloque de la función
        c.Comment("Function body");
        Visit(context.block());

        // Si no hay un return explícito, asegurarnos de agregar uno aquí
        c.Label(returnLabel);
        c.Comment("Function epilogue");

        // Restaurar frame pointer y dirección de retorno
        c.Comment("SP = FP");
        c.MovReg(Register.SP, Register.X29);  // SP = FP
        c.Pop(Register.X30);  // Restaurar LR
        c.Pop(Register.X29);  // Restaurar FP

        // Retornar a la función llamante
        c.Comment("Return to caller");
        c.Ret();

        // Etiqueta para saltarse la definición de la función durante la ejecución normal
        c.Label($"skip_{funcName}");

        // Registrar la función en la tabla de símbolos o estructura interna
        // para poder manejar las invocaciones
        c.RegisterFunction(funcName, funcLabel);

        return null;
    }

    // Método auxiliar para determinar el tipo de objeto en la pila según el tipo de la variable
    private StackObject.StackObjectType DetermineStackObjectType(string typeName)
    {
        if (typeName == "int")
            return StackObject.StackObjectType.Integer;
        else if (typeName == "float64")
            return StackObject.StackObjectType.Float;
        else if (typeName == "string")
            return StackObject.StackObjectType.String;
        else if (typeName == "bool")
            return StackObject.StackObjectType.Boolean;
        else if (typeName == "rune")
            return StackObject.StackObjectType.Rune;
        else
            return StackObject.StackObjectType.Integer; // Por defecto, asumimos int
    }

    public override Object? VisitInvokeLiteral(GoLangParser.InvokeLiteralContext context)
    {
        // Aquí manejamos la invocación a funciones como expresión
        return VisitInvoke(context.invoke());
    }

    public override Object? VisitInvoke(GoLangParser.InvokeContext context)
    {
        var funcName = context.ID().GetText();
        c.Comment($"Function call: {funcName}");

        // Procesar argumentos si existen
        if (context.invokeParams() != null)
        {
            var expressions = context.invokeParams().expr();
            c.Comment($"Processing {expressions.Length} arguments");

            // Lista para almacenar valores y tipos de los argumentos
            var arguments = new List<(StackObject obj, bool isFloat)>();

            // Primera pasada: evaluar todos los argumentos
            for (int i = 0; i < expressions.Length; i++)
            {
                c.Comment($"Evaluating argument {i + 1}");
                Visit(expressions[i]);

                // Determinar si es un argumento de punto flotante
                bool isFloat = c.TopObject().Type == StackObject.StackObjectType.Float;

                // Guardar información del argumento pero dejarlo en la pila por ahora
                arguments.Add((c.TopObject(), isFloat));
            }

            // Segunda pasada: asignar registros de destino y cargar argumentos
            // Asignar desde el último al primero para que queden en orden en los registros
            for (int i = expressions.Length - 1; i >= 0; i--)
            {
                var (obj, isFloat) = arguments[i];
                string targetReg;

                // Los primeros 8 argumentos van en registros x0-x7
                if (i < 8)
                {
                    // Asignar el registro correcto según el índice
                    targetReg = isFloat ? $"d{i}" : $"x{i}";
                }
                else
                {
                    // Los argumentos adicionales irían a la pila (no implementado completamente)
                    targetReg = isFloat ? "d0" : "x0";
                }

                c.Comment($"Loading argument {i + 1} into {targetReg}");
                c.PopObject(targetReg);
            }
        }

        // Llamar a la función
        string funcLabel = $"func_{funcName}";
        c.Comment($"Calling function {funcName}");
        c.Bl(funcLabel);

        // El valor de retorno debería estar en X0 según la convención de llamada
        c.Comment("Pushing function return value");
        c.Push(Register.X0);

        // Crear un objeto para el valor de retorno
        var returnObject = new StackObject
        {
            Type = StackObject.StackObjectType.Integer,  // Asumimos que es entero por defecto
            Length = 8,
            Depth = c.stack.Count > 0 ? c.stack.Last().Depth : 0,
            ID = null  // No tiene nombre
        };
        c.PushObject(returnObject);

        return null;
    }

    public override Object? VisitReturnStatement(GoLangParser.ReturnStatementContext context)
    {
        c.Comment("Return statement");

        // Evaluar la expresión de retorno si existe
        if (context.expr() != null)
        {
            c.Comment("Evaluating return expression");
            Visit(context.expr());

            // Colocar el resultado en X0 como valor de retorno
            c.PopObject(Register.X0);
            c.Comment("Return value in X0");
        }

        // Restaurar el stack pointer y regresar
        c.Comment("SP = FP");
        c.MovReg(Register.SP, Register.X29);  // SP = FP
        c.Pop(Register.X30);  // Restaurar LR
        c.Pop(Register.X29);  // Restaurar FP

        // Retornar a la función llamante
        c.Comment("Return to caller");
        c.Ret();

        return null;
    }

    public override Object? VisitStrconvAtoi(GoLangParser.StrconvAtoiContext context)
    {
        c.Comment("strconv.Atoi - Convertir string a entero");

        // Visitar la expresión del string a convertir
        Visit(context.expr());

        // Obtener el objeto string de la pila
        var stringObj = c.PopObject(Register.X0);

        // Verificar que sea un string
        if (stringObj.Type != StackObject.StackObjectType.String)
        {
            c.Comment("Error: El argumento de strconv.Atoi debe ser una cadena");
            // En caso de error, retornar 0
            c.Mov(Register.X0, 0);
            c.Push(Register.X0);

            var resultObj = c.IntObject();
            c.PushObject(resultObj);
            return null;
        }

        // El registro X0 ya contiene la dirección del string

        // Crear una etiqueta única para la función de conversión
        string convertLabel = GenerateUniqueLabel("atoi_convert");
        string endLabel = GenerateUniqueLabel("atoi_end");
        string errorLabel = GenerateUniqueLabel("atoi_error");

        c.Comment("Inicializando variables para la conversión");
        c.Mov(Register.X1, 0);      // X1 = resultado acumulado
        c.Mov(Register.X2, 1);      // X2 = signo (1 = positivo, -1 = negativo)
        c.Mov(Register.X3, 0);      // X3 = índice del carácter actual

        // Verificar si el primer carácter es un signo
        c.Comment("Verificando si hay signo");
        c.Ldrb("w4", Register.X0);  // Cargar el primer byte
        c.Cmp("w4", "45");            // Comparar con '-' (ASCII 45)
        c.B("ne", "check_digit");   // Si no es negativo, verificar si es dígito

        // Es signo negativo
        c.Comment("Procesando signo negativo");
        c.Mov(Register.X2, -1);     // Establecer signo negativo
        c.Add(Register.X3, Register.X3, "1");  // Avanzar al siguiente carácter

        // Etiquetar el punto para verificar si es un dígito
        c.Label("check_digit");

        // Bucle principal para recorrer la cadena
        c.Label(convertLabel);

        // Cargar el carácter actual usando el índice
        c.Add("x4", Register.X0, Register.X3);  // X4 = X0 + X3 (dirección + índice)
        c.Ldrb("w4", "x4");         // Cargar el byte en la posición actual

        // Verificar si hemos llegado al final de la cadena (carácter nulo)
        c.Cmp("w4", "0");             // Comparar con NULL
        c.B("eq", endLabel);        // Si es NULL, terminar conversión

        // Verificar si es un dígito (ASCII 48-57)
        c.Sub("w5", "w4", "48");      // W5 = carácter - '0'
        c.Cmp("w5", "9");             // Comparar si está en el rango 0-9
        c.B("hi", errorLabel);      // Si es mayor que 9, no es dígito
        c.Cmp("w5", "0");             // Comparar si es menor que 0
        c.B("lt", errorLabel);      // Si es menor que 0, no es dígito

        // Es un dígito válido, actualizar el resultado
        c.Comment("Procesando dígito");
        c.Mov("x6", 10);            // Base 10
        c.Mul(Register.X1, Register.X1, "x6");  // X1 = X1 * 10
        c.Add(Register.X1, Register.X1, "x5");  // X1 = X1 + dígito

        // Incrementar el índice y continuar
        c.Add(Register.X3, Register.X3, "1");  // Incrementar índice
        c.B(convertLabel);          // Continuar bucle

        // En caso de error, devolver 0
        c.Label(errorLabel);
        c.Comment("Error en conversión: Carácter inválido");
        c.Mov(Register.X0, 0);      // Resultado = 0 en caso de error
        c.B(endLabel);

        // Final de la conversión
        c.Label(endLabel);
        c.Comment("Aplicando signo al resultado");
        c.Mul(Register.X0, Register.X1, Register.X2);  // X0 = resultado * signo

        // Guardar el resultado en la pila
        c.Comment("Guardando el resultado entero en la pila");
        c.Push(Register.X0);

        // Crear un objeto de tipo entero para el resultado
        c.Comment("Creando objeto entero para el resultado");
        var resultObject = c.IntObject();
        c.PushObject(resultObject);

        return null;
    }

    public override Object? VisitStrconvParseFloat(GoLangParser.StrconvParseFloatContext context)
    {
        c.Comment("strconv.ParseFloat - Convertir string a float64");

        // Visitar la expresión del string a convertir
        Visit(context.expr());

        // Obtener el objeto string de la pila
        var stringObj = c.PopObject(Register.X0);

        // Verificar que sea un string
        if (stringObj.Type != StackObject.StackObjectType.String)
        {
            c.Comment("Error: El argumento de strconv.ParseFloat debe ser una cadena");
            // En caso de error, retornar 0.0
            c.Mov(Register.X0, 0);
            c.Scvtf(Register.D0, Register.X0);  // Convertir 0 a float
            c.Push(Register.D0);

            var resultObj = c.FloatObject();
            c.PushObject(resultObj);
            return null;
        }

        // Llamar a la función de biblioteca estándar para convertir string a float
        c.UseStdLib("string_to_float");
        c.Align(16); // Garantizar alineamiento a 16 bytes para llamadas a función
        c.Comment("X0 contiene la dirección del string a convertir");
        // El string ya está en X0
        c.Bl("string_to_float"); // La función devolverá el resultado en D0

        // Guardar el resultado en la pila
        c.Comment("Guardando el resultado float en la pila");
        c.Push(Register.D0);

        // Crear un objeto de tipo float para el resultado
        c.Comment("Creando objeto float para el resultado");
        var resultObject = c.FloatObject();
        c.PushObject(resultObject);

        return null;
    }

    public override Object? VisitReflectTypeOf(GoLangParser.ReflectTypeOfContext context)
    {
        c.Comment("reflect.TypeOf - Obtener tipo de datos como string");

        // Visitar la expresión para obtener el valor cuyo tipo queremos conocer
        Visit(context.expr());

        // Obtener el objeto de la pila, pero NO consumirlo ya que solo necesitamos su tipo
        // En lugar de usar PopObject que consume el objeto, solo lo inspeccionamos
        var obj = c.stack.Last();

        // Determinar el tipo basado en el objeto
        string typeString = obj.Type switch
        {
            StackObject.StackObjectType.Integer => "int",
            StackObject.StackObjectType.Float => "float64",
            StackObject.StackObjectType.String => "string",
            StackObject.StackObjectType.Boolean => "bool",
            StackObject.StackObjectType.Rune => "rune",
            _ => "unknown"
        };

        c.Comment($"Tipo determinado: {typeString}");

        // Ahora sí, eliminar el objeto de la pila ya que ya tenemos su tipo
        c.PopObject(Register.X0);

        // Crear una cadena constante con el nombre del tipo
        var stringObj = c.StringObject();
        c.PushConstant(stringObj, typeString);

        return null;
    }

    public override Object? VisitProgram(GoLangParser.ProgramContext context)
    {
        c.Comment("Program start - compiling statements");

        // Primera pasada: procesar todas las declaraciones de funciones
        foreach (var statement in context.statement())
        {
            if (statement.funcDeclaration() != null)
            {
                Visit(statement.funcDeclaration());
            }
        }

        // Segunda pasada: procesar el resto de statements que no sean declaraciones de funciones
        foreach (var statement in context.statement())
        {
            if (statement.funcDeclaration() == null)
            {
                Visit(statement);
            }
        }

        // Verificar si existe la función main y llamarla al final
        if (c.HasFunction("main"))
        {
            c.Comment("Calling main function");
            c.Bl("func_main");
        }
        else
        {
            c.Comment("No main function found - program will exit without calling main");
        }

        // Finalizar el programa
        c.Comment("Program end");
        c.EndProgram();

        return null;
    }

    public override Object? VisitSliceInit(GoLangParser.SliceInitContext context)
    {
        c.Comment("Slice initialization");

        // Verificar si tenemos una inicialización anidada (slice 2D)
        if (context.nestedSliceInit() != null)
        {
            c.Comment("2D slice initialization not supported yet");
            // Implementación futura para slices 2D
            return null;
        }

        // Verificar si tenemos valores explícitos o es un slice vacío
        var exprList = context.exprList();
        int length = (exprList == null) ? 0 : exprList.expr().Length;

        c.Comment($"Initializing slice with {length} elements");

        // Calcular cuánto espacio necesitamos en el heap: 
        // 8 bytes para longitud + (8 bytes por elemento)
        int totalSize = 8 + (length * 8);

        // Guardar la dirección inicial en el heap
        c.Push(Register.HP);

        // Guardar longitud al principio del slice (primeros 8 bytes)
        c.Mov(Register.X0, length);
        c.Str(Register.X0, Register.HP);
        c.Addi(Register.HP, Register.HP, 8);

        // Si el slice está vacío, terminamos aquí
        if (length == 0)
        {
            var sliceObj = c.IntSliceObject();
            c.PushObject(sliceObj);
            return null;
        }

        // Evaluar cada expresión y guardar su valor en el heap
        for (int i = 0; i < length; i++)
        {
            c.Comment($"Evaluating and storing element {i}");
            Visit(exprList.expr(i));

            // Obtener el valor y asegurarnos de que sea un entero
            var obj = c.PopObject(Register.X0);

            // Guardar el valor en el heap
            c.Str(Register.X0, Register.HP);
            c.Addi(Register.HP, Register.HP, 8);
        }

        // Crear un objeto de slice que apunte a los datos
        var sliceObject = c.IntSliceObject();
        c.PushObject(sliceObject);

        return null;
    }

    public override Object? VisitIndexAccess(GoLangParser.IndexAccessContext context)
    {
        c.Comment("Index access operation (slice[index])");

        // Primero visitamos la expresión que representa el slice
        c.Comment("Visiting slice expression");
        Visit(context.expr(0));

        // Luego visitamos la expresión que representa el índice
        c.Comment("Visiting index expression");
        Visit(context.expr(1));

        // Desapilar el índice en X1
        c.Comment("Popping index value");
        var indexObject = c.PopObject(Register.X1);

        // Desapilar la dirección del slice en X0
        c.Comment("Popping slice address");
        var sliceObject = c.PopObject(Register.X0);

        // Verificar que estamos accediendo a un slice
        if (sliceObject.Type != StackObject.StackObjectType.IntSlice)
        {
            c.Comment("Warning: Attempting to index a non-slice object.");
        }

        // X0 contiene la dirección base del slice, ahora necesitamos:
        // 1. Verificar que el índice no exceda el tamaño del slice
        c.Comment("Checking index bounds");

        // Cargar el tamaño del slice (primeros 8 bytes en la dirección del slice)
        c.Ldr(Register.X2, Register.X0); // X2 = longitud del slice

        // Comparar el índice con el tamaño
        c.Cmp(Register.X1, Register.X2);

        // Generar etiquetas para el manejo de error y acceso correcto
        string indexOkLabel = GenerateUniqueLabel("index_ok");
        string indexErrorLabel = GenerateUniqueLabel("index_error");
        string endLabel = GenerateUniqueLabel("index_end");

        // Si el índice es mayor o igual que el tamaño, es un error (fuera de rango)
        c.B("lt", indexOkLabel); // Saltar si el índice es menor que el tamaño

        // Manejar error de índice fuera de rango
        c.Label(indexErrorLabel);
        c.Comment("Index out of bounds error: Using default value 0");
        c.Mov(Register.X0, 0); // Valor por defecto en caso de error
        c.B(endLabel);

        // Índice válido, acceder al elemento
        c.Label(indexOkLabel);

        // 2. Calcular la dirección del elemento: dirección_base + 8 (longitud) + índice * 8
        c.Comment("Calculating element address: base + 8 + index*8");
        c.Add(Register.X0, Register.X0, "8"); // Saltar los primeros 8 bytes (longitud)
        c.Mov(Register.X2, 8); // Tamaño de cada elemento (8 bytes)
        c.Mul(Register.X1, Register.X1, Register.X2); // X1 = índice * 8
        c.Add(Register.X0, Register.X0, Register.X1); // X0 = base + 8 + índice*8

        // 3. Cargar el valor del elemento desde la dirección calculada
        c.Ldr(Register.X0, Register.X0); // X0 = valor en la dirección calculada

        // Fin del acceso
        c.Label(endLabel);

        // Guardar el resultado en la pila
        c.Comment("Pushing element value to stack");
        c.Push(Register.X0);

        // Crear un objeto entero para el resultado
        var intObject = c.IntObject();
        c.PushObject(intObject);

        return null;
    }
}