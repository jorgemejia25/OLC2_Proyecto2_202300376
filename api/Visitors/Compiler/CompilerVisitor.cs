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

        Visit(expr);

        // Determinar el tipo de expresión a imprimir
        if (expr is GoLangParser.StringContext)
        {
            c.Comment("Popping string address and length");
            c.Pop(Register.X1); // Longitud
            c.Pop(Register.X0); // Dirección
            c.PrintString(Register.X0, Register.X1);
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
}