using analyzer;
using api.Common;
using Symbols;

/// <summary>
/// Visitor específico para la fase de declaración que solo procesa declaraciones de structs y funciones.
/// </summary>
public class DeclarationVisitor : GoLangBaseVisitor<ValueWrapper>
{
    /// <summary>
    /// El entorno compartido para almacenar las declaraciones.
    /// </summary>
    public Environment Environment { get; set; }


    /// <summary>
    /// Visitor para procesar declaraciones de funciones.
    /// </summary>
    private readonly FunctionVisitor _functionVisitor;

    /// <summary>
    /// Visitor para procesar expresiones.
    /// </summary>
    private readonly ExpressionVisitor _expressionVisitor;

    /// <summary>
    /// Visitor para acceso al main
    /// </summary>
    private readonly SemanticVisitor _mainVisitor;

    /// <summary>
    /// Constructor del DeclarationVisitor que comparte el mismo environment con MainVisitor.
    /// </summary>
    /// <param name="environment">Environment compartido.</param>
    /// <param name="mainVisitor">MainVisitor compartido.</param>
    public DeclarationVisitor(Environment environment, SemanticVisitor mainVisitor)
    {
        Environment = environment;
        _mainVisitor = mainVisitor;

        _expressionVisitor = new ExpressionVisitor(Environment, _mainVisitor);
        _functionVisitor = new FunctionVisitor(Environment, _expressionVisitor, _mainVisitor);
    }

    /// <summary>
    /// Visita cada statement y procesa solo las declaraciones relevantes.
    /// </summary>
    public override ValueWrapper VisitStatement(GoLangParser.StatementContext context)
    {
        // Procesar solo declaraciones de structs y funciones
        if (context.funcDeclaration() != null)
        {
            return _functionVisitor.Visit(context.funcDeclaration());
        }

        // Ignorar el resto de statements durante la fase de declaración
        return ValueWrapper.Nil;
    }

    /// <summary>
    /// Proporciona acceso al flujo de control para la ejecución.
    /// </summary>
    public ControlFlow GetControlFlow()
    {
        return new ControlFlow();
    }

    /// <summary>
    /// Método vacío para obtener la salida de consola durante la fase de declaración.
    /// </summary>
    public string GetConsoleOutput()
    {
        return string.Empty;
    }
}
