using analyzer;
using Antlr4.Runtime.Misc;
using api.Common;
using Symbols;
using System.Collections.Generic;
using System.Text;


public class CompilerVisitor : GoLangBaseVisitor<Object?>
{
    public ArmGenerator c = new();

    public CompilerVisitor()
    {

    }

    public override Object? VisitPrintStatement(GoLangParser.PrintStatementContext context)
    {
        System.Console.WriteLine("Visiting print statement");
        c.Comment("Print statement");
        c.Align(16); // Usar explícitamente un valor de alineamiento

        var expr = context.expr();

        // Determinar si es una operación flotante antes de visitar
        bool isFloatValue = IsFloatExpressionForPrint(expr);
        // Determinar si es una operación booleana
        bool isBooleanValue = IsBooleanExpression(expr);

        Visit(expr);

        // Determinar el tipo de expresión a imprimir
        if (expr is GoLangParser.StringContext)
        {
            c.Comment("Popping string address and length");
            c.Pop(Register.X1); // Longitud
            c.Pop(Register.X0); // Dirección
            c.PrintString(Register.X0, Register.X1);
        }
        else if (expr is GoLangParser.BooleanContext || isBooleanValue)
        {
            c.Comment("Popping boolean value");
            c.Pop(Register.X0);
            c.PrintBoolean(Register.X0);
        }
        else if (expr is GoLangParser.NilContext)
        {
            c.Comment("Printing nil value");
            c.PrintNil();
        }
        else if (isFloatValue || expr is GoLangParser.FloatContext)
        {
            c.Comment("Popping float value");
            c.Pop(Register.X0);
            c.PrintFloat(Register.X0);
        }
        else
        {
            c.Comment("Popping integer value");
            c.Pop(Register.X0);
            c.PrintInteger(Register.X0);
        }

        c.Align(16); // Usar explícitamente un valor de alineamiento

        return null;
    }

    public override Object? VisitAddSub(GoLangParser.AddSubContext context)
    {
        c.Comment("AddSub operation");
        var operation = context.GetChild(1).GetText();

        // Verificar si estamos trabajando con operaciones flotantes
        bool leftIsFloat = IsFloatExpression(context.expr(0));
        bool rightIsFloat = IsFloatExpression(context.expr(1));
        bool isFloatOperation = leftIsFloat || rightIsFloat;

        // Visitar operandos
        c.Comment("Visiting left operand");
        Visit(context.expr(0));
        c.Comment("Visiting right operand");
        Visit(context.expr(1));

        if (isFloatOperation)
        {
            c.Comment("Floating point operation");
            c.Comment("Popping operands");
            c.Pop(Register.X1);  // Segundo operando
            c.Pop(Register.X0);  // Primer operando

            // Conversión automática de tipos si es necesario
            if (leftIsFloat && !rightIsFloat)
            {
                c.Comment("Converting right operand from int to float");
                c.Fmov(Register.D0, Register.X0);
                c.Fcvt(Register.D1, Register.X1);  // Convertir de int a float
            }
            else if (!leftIsFloat && rightIsFloat)
            {
                c.Comment("Converting left operand from int to float");
                c.Fcvt(Register.D0, Register.X0);  // Convertir de int a float
                c.Fmov(Register.D1, Register.X1);
            }
            else
            {
                // Ambos son flotantes
                c.Fmov(Register.D0, Register.X0);
                c.Fmov(Register.D1, Register.X1);
            }

            // Realizar la operación de punto flotante
            if (operation == "+")
            {
                c.Fadd(Register.D0, Register.D0, Register.D1);
            }
            else if (operation == "-")
            {
                c.Fsub(Register.D0, Register.D0, Register.D1);
            }

            // Convertir el resultado de vuelta a entero (bits de float) y guardar en la pila
            c.Fmovi(Register.X0, Register.D0);
            c.Push(Register.X0);
        }
        else
        {
            c.Comment("Popping operands");
            c.Pop(Register.X1);
            c.Pop(Register.X0);

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
        }

        return null;
    }

    public override Object? VisitMulDiv(GoLangParser.MulDivContext context)
    {
        c.Comment("MulDiv operation");
        var operation = context.GetChild(1).GetText();

        // La división siempre debe producir resultado flotante
        bool isDivision = operation == "/";

        // Verificar si estamos trabajando con operaciones flotantes
        bool leftIsFloat = IsFloatExpression(context.expr(0));
        bool rightIsFloat = IsFloatExpression(context.expr(1));
        bool isFloatOperation = leftIsFloat || rightIsFloat || isDivision;

        // Visitar operandos
        c.Comment("Visiting left operand");
        Visit(context.expr(0));
        c.Comment("Visiting right operand");
        Visit(context.expr(1));

        if (isFloatOperation)
        {
            c.Comment("Floating point operation");
            c.Comment("Popping operands");
            c.Pop(Register.X1);  // Segundo operando
            c.Pop(Register.X0);  // Primer operando

            // Verificar tipos y realizar conversiones automáticas si es necesario
            if (isDivision || leftIsFloat || rightIsFloat)
            {
                if (!leftIsFloat && !rightIsFloat)
                {
                    c.Comment("Converting both integer operands to float");
                    c.Fcvt(Register.D0, Register.X0);  // Convertir primer operando a float
                    c.Fcvt(Register.D1, Register.X1);  // Convertir segundo operando a float
                }
                else if (leftIsFloat && !rightIsFloat)
                {
                    c.Comment("Converting right operand from int to float");
                    c.Fmov(Register.D0, Register.X0);
                    c.Fcvt(Register.D1, Register.X1);  // Convertir de int a float
                }
                else if (!leftIsFloat && rightIsFloat)
                {
                    c.Comment("Converting left operand from int to float");
                    c.Fcvt(Register.D0, Register.X0);  // Convertir de int a float
                    c.Fmov(Register.D1, Register.X1);
                }
                else
                {
                    // Ambos ya son flotantes
                    c.Fmov(Register.D0, Register.X0);
                    c.Fmov(Register.D1, Register.X1);
                }
            }

            // Realizar la operación de punto flotante
            if (operation == "*")
            {
                c.Fmul(Register.D0, Register.D0, Register.D1);
            }
            else if (operation == "/")
            {
                c.Fdiv(Register.D0, Register.D0, Register.D1);
            }
            // El módulo no está definido para flotantes en Go

            // Convertir el resultado de vuelta a entero (bits de float) y guardar en la pila
            c.Fmovi(Register.X0, Register.D0);
            c.Push(Register.X0);
        }
        else
        {
            c.Comment("Popping operands");
            c.Pop(Register.X1);
            c.Pop(Register.X0);

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
        }

        return null;
    }

    public override Object? VisitEquality(GoLangParser.EqualityContext context)
    {
        string op = context.op.Text; // Obtener el operador (== o !=)
        c.Comment($"Equality operation ({op})");

        // Determinar tipos de los operandos
        bool leftIsFloat = IsFloatExpression(context.expr(0));
        bool rightIsFloat = IsFloatExpression(context.expr(1));
        bool leftIsString = context.expr(0) is GoLangParser.StringContext;
        bool rightIsString = context.expr(1) is GoLangParser.StringContext;
        bool isFloatOperation = leftIsFloat || rightIsFloat;
        bool isStringOperation = leftIsString || rightIsString;

        // Visitar operandos
        Visit(context.expr(0));
        Visit(context.expr(1));

        // Obtener resultados de la pila
        c.Pop(Register.X1); // Segundo operando
        c.Pop(Register.X0); // Primer operando

        string labelPrefix = "equality_op";
        string trueLabel = $"{labelPrefix}_true_{_labelCounter}";
        string endLabel = $"{labelPrefix}_end_{_labelCounter++}";

        if (isFloatOperation)
        {
            c.Comment("Floating point comparison");

            // Convertir a float si es necesario
            if (leftIsFloat && !rightIsFloat)
            {
                c.Comment("Converting right operand from int to float");
                c.Fmov(Register.D0, Register.X0);
                c.Fcvt(Register.D1, Register.X1);
            }
            else if (!leftIsFloat && rightIsFloat)
            {
                c.Comment("Converting left operand from int to float");
                c.Fcvt(Register.D0, Register.X0);
                c.Fmov(Register.D1, Register.X1);
            }
            else
            {
                // Ambos son flotantes
                c.Fmov(Register.D0, Register.X0);
                c.Fmov(Register.D1, Register.X1);
            }

            // Comparación de flotantes
            c.Add("FCMP", Register.D0, Register.D1);

            if (op == "==")
                c.Add("BEQ", trueLabel); // Saltar si iguales
            else // !=
                c.Add("BNE", trueLabel); // Saltar si diferentes
        }
        else if (isStringOperation)
        {
            // Para strings, comparamos las direcciones y longitudes
            // Nota: Esto es una simplificación. En una implementación completa,
            // deberíamos hacer una comparación de contenido.
            c.Comment("String comparison not fully implemented");
            c.Add("CMP", Register.X0, Register.X1);

            if (op == "==")
                c.Add("BEQ", trueLabel); // Saltar si iguales
            else // !=
                c.Add("BNE", trueLabel); // Saltar si diferentes
        }
        else
        {
            // Comparación entre enteros o booleanos
            c.Add("CMP", Register.X0, Register.X1);

            if (op == "==")
                c.Add("BEQ", trueLabel); // Saltar si iguales
            else // !=
                c.Add("BNE", trueLabel); // Saltar si diferentes
        }

        // Caso falso (0)
        c.Mov(Register.X0, 0);
        c.Add("B", endLabel);

        // Caso verdadero (1)
        c.Add($"{trueLabel}:");
        c.Mov(Register.X0, 1);

        // Fin
        c.Add($"{endLabel}:");
        c.Push(Register.X0);

        return null;
    }

    public override Object? VisitComparison(GoLangParser.ComparisonContext context)
    {
        string op = context.op.Text; // Obtener el operador (>, <, >=, <=)
        c.Comment($"Comparison operation ({op})");

        // Determinar tipos de los operandos
        bool leftIsFloat = IsFloatExpression(context.expr(0));
        bool rightIsFloat = IsFloatExpression(context.expr(1));
        bool isFloatOperation = leftIsFloat || rightIsFloat;

        // Visitar operandos
        Visit(context.expr(0));
        Visit(context.expr(1));

        // Obtener resultados de la pila
        c.Pop(Register.X1); // Segundo operando
        c.Pop(Register.X0); // Primer operando

        string labelPrefix = "comparison_op";
        string trueLabel = $"{labelPrefix}_true_{_labelCounter}";
        string endLabel = $"{labelPrefix}_end_{_labelCounter++}";

        if (isFloatOperation)
        {
            c.Comment("Floating point comparison");

            // Convertir a float si es necesario
            if (leftIsFloat && !rightIsFloat)
            {
                c.Comment("Converting right operand from int to float");
                c.Fmov(Register.D0, Register.X0);
                c.Fcvt(Register.D1, Register.X1);
            }
            else if (!leftIsFloat && rightIsFloat)
            {
                c.Comment("Converting left operand from int to float");
                c.Fcvt(Register.D0, Register.X0);
                c.Fmov(Register.D1, Register.X1);
            }
            else
            {
                // Ambos son flotantes
                c.Fmov(Register.D0, Register.X0);
                c.Fmov(Register.D1, Register.X1);
            }

            // Comparación de flotantes
            c.Add("FCMP", Register.D0, Register.D1);

            switch (op)
            {
                case ">": c.Add("BGT", trueLabel); break;  // Saltar si mayor
                case "<": c.Add("BLT", trueLabel); break;  // Saltar si menor
                case ">=": c.Add("BGE", trueLabel); break; // Saltar si mayor o igual
                case "<=": c.Add("BLE", trueLabel); break; // Saltar si menor o igual
            }
        }
        else
        {
            // Comparación entre enteros o booleanos
            c.Add("CMP", Register.X0, Register.X1);

            switch (op)
            {
                case ">": c.Add("BGT", trueLabel); break;  // Saltar si mayor
                case "<": c.Add("BLT", trueLabel); break;  // Saltar si menor
                case ">=": c.Add("BGE", trueLabel); break; // Saltar si mayor o igual
                case "<=": c.Add("BLE", trueLabel); break; // Saltar si menor o igual
            }
        }

        // Caso falso (0)
        c.Mov(Register.X0, 0);
        c.Add("B", endLabel);

        // Caso verdadero (1)
        c.Add($"{trueLabel}:");
        c.Mov(Register.X0, 1);

        // Fin
        c.Add($"{endLabel}:");
        c.Push(Register.X0);

        return null;
    }

    // Método para verificar si una operación aditiva/sustractiva es flotante
    private bool IsFloatOperation(GoLangParser.AddSubContext context)
    {
        return IsFloatExpression(context.expr(0)) || IsFloatExpression(context.expr(1));
    }

    // Método para verificar si una operación multiplicativa/divisoria es flotante
    private bool IsFloatOperation(GoLangParser.MulDivContext context)
    {
        return IsFloatExpression(context.expr(0)) || IsFloatExpression(context.expr(1));
    }

    // Método auxiliar mejorado para determinar si una expresión es de tipo flotante
    private bool IsFloatExpression(GoLangParser.ExprContext context)
    {
        if (context == null) return false;

        // Si es un literal flotante directo
        if (context is GoLangParser.FloatContext)
            return true;

        // Si es una expresión entre paréntesis, verificar el contenido
        if (context is GoLangParser.ParensContext parens)
            return IsFloatExpression(parens.expr());

        // Divisiones siempre producen flotantes
        if (context is GoLangParser.MulDivContext mulDiv && mulDiv.GetChild(1).GetText() == "/")
            return true;

        // Si es una operación aritmética, verificar los operandos
        if (context is GoLangParser.AddSubContext addSub)
            return IsFloatExpression(addSub.expr(0)) || IsFloatExpression(addSub.expr(1));

        if (context is GoLangParser.MulDivContext mulDivContext)
            return IsFloatExpression(mulDivContext.expr(0)) || IsFloatExpression(mulDivContext.expr(1));

        // Para otros tipos de expresiones, no son flotantes por ahora
        return false;
    }

    // Nuevo método específico para determinar si una expresión debe imprimirse como flotante
    private bool IsFloatExpressionForPrint(GoLangParser.ExprContext context)
    {
        if (context == null) return false;

        // Si es un literal flotante
        if (context is GoLangParser.FloatContext)
            return true;

        // Si es una expresión entre paréntesis, verificar el contenido
        if (context is GoLangParser.ParensContext parens)
            return IsFloatExpressionForPrint(parens.expr());

        // Detectar específicamente divisiones, que siempre producen resultados flotantes
        if (context is GoLangParser.MulDivContext mulDiv && mulDiv.GetChild(1).GetText() == "/")
            return true;

        // Si es una operación aritmética normal, verificar recursivamente
        if (context is GoLangParser.AddSubContext addSub)
            return IsFloatExpressionForPrint(addSub.expr(0)) || IsFloatExpressionForPrint(addSub.expr(1));

        if (context is GoLangParser.MulDivContext mulDivOther)
            return IsFloatExpressionForPrint(mulDivOther.expr(0)) || IsFloatExpressionForPrint(mulDivOther.expr(1));

        return false;
    }

    // Método auxiliar para determinar si la expresión es una operación booleana
    private bool IsBooleanExpression(GoLangParser.ExprContext context)
    {
        if (context == null) return false;

        // Comprobar si es un literal booleano directo
        if (context is GoLangParser.BooleanContext)
            return true;

        // Si es una expresión entre paréntesis, verificar su contenido
        if (context is GoLangParser.ParensContext parens)
            return IsBooleanExpression(parens.expr());

        // Operaciones lógicas (AND, OR, NOT)
        if (context is GoLangParser.NotContext ||
            context is GoLangParser.AndContext ||
            context is GoLangParser.OrContext)
            return true;

        // Operaciones de comparación y igualdad
        if (context is GoLangParser.EqualityContext ||
            context is GoLangParser.ComparisonContext)
            return true;

        return false;
    }

    public override Object? VisitNumber(GoLangParser.NumberContext context)
    {

        var value = context.GetText();
        c.Comment("Constant " + value);
        c.Mov(Register.X0, int.Parse(value));
        c.Push(Register.X0);
        return null;
    }

    public override Object? VisitString(GoLangParser.StringContext context)
    {
        var value = context.GetText();
        var content = value.Trim('"'); // Remover comillas
        var length = content.Length;

        // 1. Declarar string en sección .data
        var label = c.DeclareString(content);

        // 2. Cargar dirección del string
        c.Comment("Load string address");
        c.Adrp(Register.X0, label);          // ADRP X0, label@PAGE
        c.AddLabelOffset(Register.X0, label); // ADD X0, X0, label@PAGEOFF
        c.Push(Register.X0);                  // Guardar dirección en stack

        // 3. Cargar longitud del string
        c.Comment("Load string length");
        c.Mov(Register.X1, length);
        c.Push(Register.X1);                  // Guardar longitud en stack

        return null;
    }

    public override Object? VisitFloat(GoLangParser.FloatContext context)
    {
        var value = context.GetText();
        c.Comment("Float constant " + value);

        // Convertir el valor float a su representación de bits en un entero
        double doubleValue = double.Parse(value);
        long bits = BitConverter.DoubleToInt64Bits(doubleValue);

        // Cargar los bits como un entero y guardar en pila
        c.LoadConstantLong(Register.X0, bits);
        c.Push(Register.X0);

        return null;
    }

    public override Object? VisitBoolean(GoLangParser.BooleanContext context)
    {
        var value = context.GetText();
        c.Comment("Boolean " + value);

        // true = 1, false = 0
        int boolValue = value == "true" ? 1 : 0;
        c.Mov(Register.X0, boolValue);
        c.Push(Register.X0);

        return null;
    }

    public override Object? VisitNil(GoLangParser.NilContext context)
    {
        c.Comment("Nil value");
        c.Mov(Register.X0, 0); // Nil se representa como 0
        c.Push(Register.X0);

        return null;
    }

    public override Object? VisitNot(GoLangParser.NotContext context)
    {
        c.Comment("NOT operation (!)");
        // Visitar la expresión que se va a negar
        Visit(context.expr());

        // Obtener el resultado de la expresión
        c.Pop(Register.X0);

        // Generar una etiqueta única para el salto
        string labelPrefix = "not_op";
        string trueLabel = $"{labelPrefix}_true_{_labelCounter}";
        string endLabel = $"{labelPrefix}_end_{_labelCounter++}";

        // Comparar con 0 (false)
        c.Comment("Compare with 0 (false)");
        c.Add("CMP", Register.X0, "#0");

        // Si es igual a 0, va a trueLabel (el NOT de false es true)
        c.Add("BEQ", trueLabel);

        // Si no es igual a 0, el resultado es false (0)
        c.Mov(Register.X0, 0);
        c.Add("B", endLabel);

        // Label para el caso true
        c.Add($"{trueLabel}:");
        c.Mov(Register.X0, 1);

        // Label de fin
        c.Add($"{endLabel}:");

        // Guardar resultado en la pila
        c.Push(Register.X0);

        return null;
    }

    public override Object? VisitAnd(GoLangParser.AndContext context)
    {
        c.Comment("AND operation (&&)");

        // Generar etiquetas para la operación
        string labelPrefix = "and_op";
        string falseLabel = $"{labelPrefix}_false_{_labelCounter}";
        string evalRightLabel = $"{labelPrefix}_eval_right_{_labelCounter}";
        string endLabel = $"{labelPrefix}_end_{_labelCounter++}";

        // Evaluar operando izquierdo
        c.Comment("Evaluating left operand");
        Visit(context.expr(0));
        c.Pop(Register.X0);

        // Si el operando izquierdo es falso (0), el resultado es falso
        c.Comment("Check if left operand is false");
        c.Add("CMP", Register.X0, "#0");
        c.Add("BEQ", falseLabel);  // Si es 0, saltar a falseLabel

        // Evaluar operando derecho sólo si el izquierdo es verdadero
        c.Add($"{evalRightLabel}:");
        c.Comment("Evaluating right operand");
        Visit(context.expr(1));
        c.Pop(Register.X0);

        // El resultado es el valor del operando derecho
        c.Add("B", endLabel);

        // Caso falso
        c.Add($"{falseLabel}:");
        c.Mov(Register.X0, 0);  // Resultado es falso

        // Fin de la operación
        c.Add($"{endLabel}:");
        c.Push(Register.X0);

        return null;
    }

    public override Object? VisitOr(GoLangParser.OrContext context)
    {
        c.Comment("OR operation (||)");

        // Generar etiquetas para la operación
        string labelPrefix = "or_op";
        string trueLabel = $"{labelPrefix}_true_{_labelCounter}";
        string evalRightLabel = $"{labelPrefix}_eval_right_{_labelCounter}";
        string endLabel = $"{labelPrefix}_end_{_labelCounter++}";

        // Evaluar operando izquierdo
        c.Comment("Evaluating left operand");
        Visit(context.expr(0));
        c.Pop(Register.X0);

        // Si el operando izquierdo es verdadero (!=0), el resultado es verdadero
        c.Comment("Check if left operand is true");
        c.Add("CMP", Register.X0, "#0");
        c.Add("BNE", trueLabel);  // Si no es 0, saltar a trueLabel

        // Evaluar operando derecho sólo si el izquierdo es falso
        c.Add($"{evalRightLabel}:");
        c.Comment("Evaluating right operand");
        Visit(context.expr(1));
        c.Pop(Register.X0);

        // El resultado es el valor del operando derecho
        c.Add("B", endLabel);

        // Caso verdadero
        c.Add($"{trueLabel}:");
        c.Mov(Register.X0, 1);  // Resultado es verdadero

        // Fin de la operación
        c.Add($"{endLabel}:");
        c.Push(Register.X0);

        return null;
    }

    // Agregar contador de etiquetas para generar etiquetas únicas
    private int _labelCounter = 0;
}