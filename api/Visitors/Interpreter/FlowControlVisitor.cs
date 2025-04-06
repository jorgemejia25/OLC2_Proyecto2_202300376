using analyzer;
using Symbols;
using api.Common;

/// <summary>
/// Visitor para manejar el control de flujo en el lenguaje Go.
/// </summary>
class FlowControlVisitor : GoLangBaseVisitor<ValueWrapper>
{
    private readonly Environment _environment;
    private readonly ExpressionVisitor _expressionVisitor;
    private readonly SemanticVisitor _mainVisitor;
    private readonly ControlFlow _controlFlow;

    /// <summary>
    /// Constructor para inicializar el visitor con los componentes necesarios.
    /// </summary>
    /// <param name="environment">El entorno de ejecución.</param>
    /// <param name="expressionVisitor">Visitor para evaluar expresiones.</param>
    /// <param name="mainVisitor">Visitor principal para ejecutar bloques de código.</param>
    /// <param name="controlFlow">Objeto para manejar señales de control de flujo.</param>
    public FlowControlVisitor(Environment environment, ExpressionVisitor expressionVisitor, SemanticVisitor mainVisitor, ControlFlow controlFlow)
    {
        _environment = environment;
        _expressionVisitor = expressionVisitor;
        _mainVisitor = mainVisitor;
        _controlFlow = controlFlow;
    }

    /// <summary>
    /// Visita una declaración if y ejecuta el bloque correspondiente basado en la condición.
    /// </summary>
    /// <param name="context">El contexto de la declaración if.</param>
    /// <returns>El resultado de la ejecución del bloque if o else.</returns>
    public override ValueWrapper VisitIfStatement(GoLangParser.IfStatementContext context)
    {
        // Evaluate condition
        var condition = _expressionVisitor.Visit(context.expr());

        if (condition.Type != DataType.Type.Bool)
        {
            throw new SemanticError(
                $"Condición del if debe ser booleana, se encontró {condition.Type}",
                context.Start
            );
        }

        bool conditionValue = (bool)condition.Value;

        if (conditionValue)
        {
            // True case
            _environment.PushScope("if");
            ValueWrapper result;

            // Check if the true branch is a block or a simple statement
            if (context.block() != null)
            {
                result = _mainVisitor.Visit(context.block());
            }
            else
            {
                result = _mainVisitor.Visit(context.simpleStatement());
            }

            _environment.PopScope();

            // Propagar las señales de flujo de control (break, continue, return)
            if (_controlFlow.ShouldBreak || _controlFlow.ShouldContinue || _controlFlow.ShouldReturn)
            {
                return result;
            }

            return result;
        }
        else if (context.elseBlock() != null)
        {
            // False case with else
            _environment.PushScope("else");
            var result = _mainVisitor.Visit(context.elseBlock());
            _environment.PopScope();

            // Propagar las señales de flujo de control (break, continue, return)
            if (_controlFlow.ShouldBreak || _controlFlow.ShouldContinue || _controlFlow.ShouldReturn)
            {
                return result;
            }

            return result;
        }

        return ValueWrapper.Nil;
    }

    /// <summary>
    /// Visita un bloque de código y ejecuta cada declaración dentro del bloque.
    /// </summary>
    /// <param name="context">El contexto del bloque de código.</param>
    /// <returns>El resultado de la ejecución del bloque.</returns>
    public override ValueWrapper VisitBlock(GoLangParser.BlockContext context)
    {
        _environment.PushScope("block");

        foreach (var statement in context.statement())
        {
            var result = _mainVisitor.Visit(statement);
            if (_controlFlow.ShouldReturn)
            {
                _controlFlow.ReturnValue = result;
                break;
            }
        }

        _environment.PopScope();
        return _controlFlow.ShouldReturn
            ? _controlFlow.ReturnValue
            : ValueWrapper.Nil;
    }

    /// <summary>
    /// Visita un bloque else y ejecuta el bloque correspondiente.
    /// </summary>
    /// <param name="context">El contexto del bloque else.</param>
    /// <returns>El resultado de la ejecución del bloque else.</returns>
    public override ValueWrapper VisitElseBlock(GoLangParser.ElseBlockContext context)
    {
        try
        {
            if (context.ifStatement() != null)
            {
                return Visit(context.ifStatement());
            }
            else if (context.block() != null)
            {
                return Visit(context.block());
            }
            else if (context.simpleStatement() != null)
            {
                return _mainVisitor.Visit(context.simpleStatement());
            }

            throw new SemanticError("Error al ejecutar el bloque else", context.Start);
        }
        catch (Exception)
        {
            throw new SemanticError("Error al ejecutar el bloque else", context.Start);
        }
    }
}
