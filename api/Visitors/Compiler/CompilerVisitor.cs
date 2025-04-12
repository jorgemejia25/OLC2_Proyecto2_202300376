using analyzer;


public class CompilerVisitor : GoLangBaseVisitor<Object?>
{
    public ArmGenerator c = new();


    public CompilerVisitor()
    {

    }

    public override Object? VisitPrintStatement(GoLangParser.PrintStatementContext context)
    {
        c.Comment("Print statement");
        c.Align(16); // Usar explícitamente un valor de alineamiento

        var expr = context.expr();
        Visit(expr);

        c.Comment("Popping integer value");
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
            c.PrintInteger(Register.X0); // Imprimimos booleanos como enteros (0/1)
        }
        else if (value.Type == StackObject.StackObjectType.Rune)
        {
            c.PrintRune(Register.X0);    // Nueva función para imprimir runes
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

        if (operation == "+")
        {
            c.Add(Register.X0, Register.X0, Register.X1);
        }
        else if (operation == "-")
        {
            c.Sub(Register.X0, Register.X0, Register.X1);
        }

        c.Comment("Pushing result");
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

        c.Comment("Pushing result");
        c.Push(Register.X0);
        c.PushObject(c.CloneObject(left));

        return null;
    }

    public override Object? VisitVarDeclaration(GoLangParser.VarDeclarationContext context)
    {
        var varName = context.ID().GetText();
        c.Comment("Variable declaration: " + varName);

        Visit(context.expr());
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


}