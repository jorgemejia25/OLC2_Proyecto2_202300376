using analyzer;
using api.Common;
using Symbols;
using System.Collections.Generic;
using System.Text;

/// <summary>
/// Main visitor for the GoLang parser.
/// </summary>
public class SemanticVisitor : GoLangBaseVisitor<ValueWrapper>
{
    /// <summary>
    /// Environment for storing variables and symbols.
    /// </summary>
    public Environment Environment { get; set; }


    /// <summary>
    /// Visitor for expressions.
    /// </summary>
    private readonly ExpressionVisitor _expressionVisitor;


    /// <summary>
    /// Control flow for the program.
    /// </summary>
    private readonly ControlFlow _controlFlow;

    /// <summary>
    /// Console output for the program.
    /// </summary>
    private readonly StringBuilder _consoleOutput;

    /// <summary>
    /// Visitor for functions.
    /// </summary>
    private readonly FunctionVisitor _functionVisitor;

    private readonly VariableVisitor _variableVisitor;
    private readonly PrintVisitor _printVisitor;
    private readonly FlowControlVisitor _flowControlVisitor;
    private readonly LoopVisitor _loopVisitor;  // Agregar LoopVisitor
    private readonly List<Error> _errors; // Agregar lista de errores
    private readonly SwitchVisitor _switchVisitor;  // Agregar este campo

    /// <summary>
    /// Initializes a new instance of the <see cref="SemanticVisitor"/> class.
    /// </summary>
    public SemanticVisitor()
    {
        _controlFlow = new ControlFlow();
        Environment = new Environment();
        _expressionVisitor = new ExpressionVisitor(Environment, this);
        _functionVisitor = new FunctionVisitor(Environment, _expressionVisitor, this);
        _consoleOutput = new StringBuilder();
        _printVisitor = new PrintVisitor(_expressionVisitor);
        _printVisitor.SetMainVisitor(this); // Asegurarse que PrintVisitor tenga referencia a MainVisitor
        _variableVisitor = new VariableVisitor(Environment, _expressionVisitor);
        _flowControlVisitor = new FlowControlVisitor(Environment, _expressionVisitor, this, _controlFlow);
        _loopVisitor = new LoopVisitor(Environment, _expressionVisitor, this, _controlFlow);  // Inicializar
        _switchVisitor = new SwitchVisitor(Environment, _expressionVisitor, this, _controlFlow);  // Inicializar
        _errors = new List<Error>(); // Inicializar lista de errores
    }

    /// <summary>
    /// Initializes a new instance of the <see cref="SemanticVisitor"/> class with existing environment.
    /// </summary>
    /// <param name="environment">The existing environment to use.</param>
    public SemanticVisitor(Environment environment)
    {
        Environment = environment;
        _expressionVisitor = new ExpressionVisitor(Environment, this);
        _functionVisitor = new FunctionVisitor(Environment, _expressionVisitor, this);
        _controlFlow = new ControlFlow();
        _consoleOutput = new StringBuilder();
        _printVisitor = new PrintVisitor(_expressionVisitor);
        _printVisitor.SetMainVisitor(this); // Asegurarse que PrintVisitor tenga referencia a MainVisitor
        _variableVisitor = new VariableVisitor(Environment, _expressionVisitor);
        _flowControlVisitor = new FlowControlVisitor(Environment, _expressionVisitor, this, _controlFlow);
        _loopVisitor = new LoopVisitor(Environment, _expressionVisitor, this, _controlFlow);  // Inicializar
        _switchVisitor = new SwitchVisitor(Environment, _expressionVisitor, this, _controlFlow);  // Inicializar
        _errors = new List<Error>(); // Inicializar lista de errores

        Console.WriteLine($"MainVisitor inicializado con environment. Funciones registradas: {Environment.GetFunctionCount()}");
    }

    public override ValueWrapper VisitErrorNode(Antlr4.Runtime.Tree.IErrorNode node)
    {
        var error = new Error
        {
            Type = ErrorType.Sintactico,
            Message = $"Error sintáctico en línea {node.Symbol.Line}, columna {node.Symbol.Column}: {node.GetText()}",
            Line = node.Symbol.Line,
            Column = node.Symbol.Column
        };

        _errors.Add(error);
        return ValueWrapper.Nil;
    }

    /// <summary>
    /// Visita una declaración de variable.
    /// </summary>
    /// <param name="context">El contexto de la declaración de variable.</param>
    /// <returns>El resultado de la visita.</returns>
    public override ValueWrapper VisitVarDeclaration(GoLangParser.VarDeclarationContext context)
    {
        return _variableVisitor.VisitVarDeclaration(context);
    }

    /// <summary>
    /// Visita una declaración implícita de variable.
    /// </summary>
    /// <param name="context">El contexto de la declaración implícita.</param>
    /// <returns>El resultado de la visita.</returns>
    public override ValueWrapper VisitImplicitDeclaration(GoLangParser.ImplicitDeclarationContext context)
    {
        return _variableVisitor.VisitImplicitDeclaration(context);
    }

    /// <summary>
    /// Visita una asignación de variable.
    /// </summary>
    /// <param name="context">El contexto de la asignación.</param>
    /// <returns>El resultado de la visita.</returns>
    public override ValueWrapper VisitAssignment(GoLangParser.AssignmentContext context)
    {
        return _variableVisitor.VisitAssignment(context);
    }

    public override ValueWrapper VisitCompoundAssignment(GoLangParser.CompoundAssignmentContext context)
    {
        return _variableVisitor.VisitCompoundAssignment(context);
    }

    /// <summary>
    /// Visita una operación de incremento/decremento.
    /// </summary>
    public override ValueWrapper VisitIncDecStatement(GoLangParser.IncDecStatementContext context)
    {
        return _variableVisitor.VisitIncDecStatement(context);
    }

    /// <summary>
    /// Visita una declaración de impresión.
    /// </summary>
    /// <param name="context">El contexto de la declaración de impresión.</param>
    /// <returns>El resultado de la visita.</returns>
    public override ValueWrapper VisitPrintStatement(GoLangParser.PrintStatementContext context)
    {
        return _printVisitor.VisitPrintStatement(context);
    }

    public override ValueWrapper VisitIfStatement(GoLangParser.IfStatementContext context)
    {
        return _flowControlVisitor.VisitIfStatement(context);
    }

    public override ValueWrapper VisitBlock(GoLangParser.BlockContext context)
    {
        ValueWrapper result = ValueWrapper.Nil;

        foreach (var statement in context.statement())
        {
            result = Visit(statement);

            // Si hay un return, break o continue, detener la ejecución del bloque inmediatamente
            if (_controlFlow.ShouldReturn || _controlFlow.ShouldBreak || _controlFlow.ShouldContinue)
            {
                // No reseteamos los flags aquí, para que se propaguen hacia arriba
                return result;
            }
        }

        return result;
    }

    // Agregar método para while
    public override ValueWrapper VisitWhileStatement(GoLangParser.WhileStatementContext context)
    {
        return _loopVisitor.VisitWhileStatement(context);
    }

    public override ValueWrapper VisitBreakStatement(GoLangParser.BreakStatementContext context)
    {
        return _loopVisitor.VisitBreakStatement(context);
    }

    public override ValueWrapper VisitContinueStatement(GoLangParser.ContinueStatementContext context)
    {
        return _loopVisitor.VisitContinueStatement(context);
    }

    // Agregar el método para manejar switch
    public override ValueWrapper VisitSwitchStatement(GoLangParser.SwitchStatementContext context)
    {
        return _switchVisitor.VisitSwitchStatement(context);
    }

    public override ValueWrapper VisitForStatement(GoLangParser.ForStatementContext context)
    {
        return _loopVisitor.VisitForStatement(context);
    }


    public override ValueWrapper VisitFuncDeclaration(GoLangParser.FuncDeclarationContext context)
    {
        return _functionVisitor.VisitFuncDeclaration(context);
    }

    public override ValueWrapper VisitInvoke(GoLangParser.InvokeContext context)
    {
        return _functionVisitor.VisitInvoke(context);
    }

    public override ValueWrapper VisitInvokeLiteral(GoLangParser.InvokeLiteralContext context)
    {
        return _functionVisitor.VisitInvokeLiteral(context);
    }

    public override ValueWrapper VisitInvokeMethodLiteral(GoLangParser.InvokeMethodLiteralContext context)
    {
        return _functionVisitor.VisitInvokeMethodLiteral(context);
    }

    public override ValueWrapper VisitInvokeMethod(GoLangParser.InvokeMethodContext context)
    {
        return _functionVisitor.VisitInvokeMethod(context);
    }


    public override ValueWrapper VisitReturnStatement(GoLangParser.ReturnStatementContext context)
    {
        ValueWrapper returnValue;

        if (context.expr() != null)
        {
            // Si hay una expresión explícita, evalúala
            returnValue = _expressionVisitor.Visit(context.expr());
        }
        else
        {
            // Si es un return vacío, usa Nil
            returnValue = ValueWrapper.Nil;
        }

        // Marca que debemos retornar y guarda el valor
        _controlFlow.ShouldReturn = true;
        _controlFlow.ReturnValue = returnValue;

        return returnValue;
    }

    /// <summary>
    /// Obtiene el entorno de variables.
    /// </summary>
    /// <returns>El entorno de variables.</returns>
    public Environment GetEnvironment()
    {
        return Environment;
    }

    /// <summary>
    /// Obtiene la salida de la consola.
    /// </summary>
    /// <returns>La salida de la consola.</returns>
    public string GetConsoleOutput()
    {
        string output = _consoleOutput.ToString();
        Console.WriteLine($"MainVisitor getConsoleOutput: '{output.Replace("\n", "\\n")}'"); // Log para depuración
        return output;
    }

    public ControlFlow GetControlFlow()
    {
        return _controlFlow;
    }

    /// <summary>
    /// Appends to the console output.
    /// </summary>
    /// <param name="value">The value to append.</param>
    public void AppendToConsoleOutput(string value)
    {
        _consoleOutput.Append(value);
        Console.WriteLine($"MainVisitor append: '{value.Replace("\n", "\\n")}'"); // Log para depuración
    }
}