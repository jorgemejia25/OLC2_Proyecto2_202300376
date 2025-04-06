using analyzer;
using api.Common;
using Symbols;

/// <summary>
/// Visitor para manejar instrucciones switch en el lenguaje GoLang.
/// </summary>
class SwitchVisitor : GoLangBaseVisitor<ValueWrapper>
{
    private readonly Environment _environment;
    private readonly ExpressionVisitor _expressionVisitor;
    private readonly SemanticVisitor _mainVisitor;
    private readonly ControlFlow _controlFlow;

    /// <summary>
    /// Constructor del SwitchVisitor.
    /// </summary>
    /// <param name="environment">Entorno compartido.</param>
    /// <param name="expressionVisitor">Visitor para evaluar expresiones.</param>
    /// <param name="mainVisitor">Visitor principal.</param>
    /// <param name="controlFlow">Control de flujo del programa.</param>
    public SwitchVisitor(Environment environment, ExpressionVisitor expressionVisitor, SemanticVisitor mainVisitor, ControlFlow controlFlow)
    {
        _environment = environment;
        _expressionVisitor = expressionVisitor;
        _mainVisitor = mainVisitor;
        _controlFlow = controlFlow;
    }

    /// <summary>
    /// Visita una instrucción switch y evalúa los casos correspondientes.
    /// </summary>
    public override ValueWrapper VisitSwitchStatement(GoLangParser.SwitchStatementContext context)
    {
        ValueWrapper switchValue = _expressionVisitor.Visit(context.expr());
        bool switchExecuted = false;

        // Manejar entrada a switch para rastrear el contexto
        _environment.EnterSwitch();

        try
        {
            _environment.PushScope("switch");

            // Evaluar los casos
            foreach (var caseStmt in context.caseStatement())
            {
                ValueWrapper caseValue = _expressionVisitor.Visit(caseStmt.expr());

                // Comparar valores
                bool isMatch = CompareValues(switchValue, caseValue);

                if (isMatch)
                {
                    // Ejecutar el caso
                    ExecuteCase(caseStmt);
                    switchExecuted = true;

                    // Si se encontró un break, salir del switch
                    if (_controlFlow.ShouldBreak)
                    {
                        _controlFlow.Reset(); // Resetear para no afectar el flujo exterior
                        break;
                    }
                }
            }

            // Si ningún caso coincidió y hay un default
            if (!switchExecuted && context.defaultCase() != null)
            {
                ExecuteDefaultCase(context.defaultCase());

                // Si se encontró un break en el default, simplemente lo reseteamos
                if (_controlFlow.ShouldBreak)
                {
                    _controlFlow.Reset();
                }
            }
        }
        finally
        {
            _environment.PopScope();
            _environment.ExitSwitch();
        }

        return ValueWrapper.Nil;
    }

    /// <summary>
    /// Ejecuta las instrucciones dentro de un caso de switch.
    /// </summary>
    private void ExecuteCase(GoLangParser.CaseStatementContext caseContext)
    {
        foreach (var stmt in caseContext.statement())
        {
            _mainVisitor.Visit(stmt);

            // Si se encontró un break, interrumpir ejecución del caso
            if (_controlFlow.ShouldBreak || _controlFlow.ShouldReturn)
            {
                break;
            }
        }
    }

    /// <summary>
    /// Ejecuta las instrucciones del caso default.
    /// </summary>
    private void ExecuteDefaultCase(GoLangParser.DefaultCaseContext defaultContext)
    {
        foreach (var stmt in defaultContext.statement())
        {
            _mainVisitor.Visit(stmt);

            // Si se encontró un break, interrumpir ejecución del caso default
            if (_controlFlow.ShouldBreak || _controlFlow.ShouldReturn)
            {
                break;
            }
        }
    }

    /// <summary>
    /// Compara dos valores para determinar si coinciden para un caso de switch.
    /// </summary>
    private bool CompareValues(ValueWrapper switchValue, ValueWrapper caseValue)
    {
        // Si alguno es nulo, no hay coincidencia
        if (switchValue.IsNil || caseValue.IsNil)
            return false;

        // Si los tipos son diferentes, verificar posibles conversiones numéricas
        if (switchValue.Type != caseValue.Type)
        {
            // Permitir comparaciones entre enteros y flotantes
            if ((switchValue.Type == DataType.Type.Int && caseValue.Type == DataType.Type.Float) ||
                (switchValue.Type == DataType.Type.Float && caseValue.Type == DataType.Type.Int))
            {
                double switchNum = Convert.ToDouble(switchValue.Value);
                double caseNum = Convert.ToDouble(caseValue.Value);
                return Math.Abs(switchNum - caseNum) < 0.000001;
            }

            return false;
        }

        // Para tipos numéricos
        if (switchValue.Value is int || switchValue.Value is double || switchValue.Value is float)
        {
            double switchNum = Convert.ToDouble(switchValue.Value);
            double caseNum = Convert.ToDouble(caseValue.Value);
            return Math.Abs(switchNum - caseNum) < 0.000001;
        }

        // Para strings y otros tipos de referencia
        return switchValue.Value.Equals(caseValue.Value);
    }
}
