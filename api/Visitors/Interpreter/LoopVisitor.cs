using analyzer;
using Symbols;
using api.Common;

/// <summary>
/// Clase LoopVisitor que maneja la visita de estructuras de bucles en GoLang.
/// </summary>
class LoopVisitor : GoLangBaseVisitor<ValueWrapper>
{
    private readonly Environment _environment;
    private readonly ExpressionVisitor _expressionVisitor;
    private readonly SemanticVisitor _mainVisitor;
    private readonly ControlFlow _controlFlow;

    /// <summary>
    /// Constructor de LoopVisitor.
    /// </summary>
    /// <param name="environment">El entorno de ejecución.</param>
    /// <param name="expressionVisitor">El visitor de expresiones.</param>
    /// <param name="mainVisitor">El visitor principal.</param>
    /// <param name="controlFlow">El controlador de flujo.</param>
    public LoopVisitor(Environment environment, ExpressionVisitor expressionVisitor, SemanticVisitor mainVisitor, ControlFlow controlFlow)
    {
        _environment = environment;
        _expressionVisitor = expressionVisitor;
        _mainVisitor = mainVisitor;
        _controlFlow = controlFlow;
    }

    /// <summary>
    /// Visita una declaración de bucle while.
    /// </summary>
    /// <param name="context">El contexto del bucle while.</param>
    /// <returns>Un ValueWrapper que representa el resultado de la visita.</returns>
    public override ValueWrapper VisitWhileStatement(GoLangParser.WhileStatementContext context)
    {
        while (true)
        {
            var conditionValue = _expressionVisitor.Visit(context.expr());
            if (conditionValue.Type != DataType.Type.Bool || !(bool)conditionValue.Value)
            {
                break;
            }

            _environment.EnterLoop();
            try
            {
                _environment.PushScope("while");
                if (context.block() != null)
                {
                    _mainVisitor.Visit(context.block());
                }
                else if (context.simpleStatement() != null)
                {
                    _mainVisitor.Visit(context.simpleStatement());
                }
            }
            finally
            {
                _environment.PopScope();
                _environment.ExitLoop();
            }
        }
        return ValueWrapper.Nil;
    }

    /// <summary>
    /// Visita una declaración de bucle for.
    /// </summary>
    /// <param name="context">El contexto del bucle for.</param>
    /// <returns>Un ValueWrapper que representa el resultado de la visita.</returns>
    public override ValueWrapper VisitForStatement(GoLangParser.ForStatementContext context)
    {
        _environment.EnterLoop();
        _controlFlow.Reset();

        try
        {
            if (context.forCondition() != null)
            {
                // Manejar for con solo condición (tipo while)
                return HandleSimpleFor(context.forCondition(), context.block());
            }
            else if (context.forClause() != null)
            {
                // Manejar for completo (init; condition; post)
                return HandleTraditionalFor(context.forClause(), context.block());
            }
            else if (context.forRange() != null)
            {
                // Manejar for range (nueva implementación)
                return HandleRangeFor(context.forRange(), context.block());
            }
        }
        finally
        {
            _environment.ExitLoop();
        }

        return ValueWrapper.Nil;
    }

    /// <summary>
    /// Maneja un bucle for con solo una condición (similar a while).
    /// </summary>
    /// <param name="condition">La condición del bucle.</param>
    /// <param name="block">El bloque de código a ejecutar.</param>
    /// <returns>Un ValueWrapper que representa el resultado de la visita.</returns>
    private ValueWrapper HandleSimpleFor(GoLangParser.ForConditionContext condition, GoLangParser.BlockContext block)
    {
        while (true)
        {
            var conditionValue = _expressionVisitor.Visit(condition.expr());

            if (conditionValue == null || conditionValue.IsNil)
            {
                throw new SemanticError("Error al evaluar la condición del for", condition.Start);
            }

            if (conditionValue.Type != DataType.Type.Bool)
            {
                throw new SemanticError("La condición del for debe ser de tipo booleano", condition.Start);
            }

            if (!(bool)conditionValue.Value)
            {
                break;
            }

            _environment.PushScope("for");
            _mainVisitor.Visit(block);
            _environment.PopScope();

            // Verificar si se debe salir del bucle
            if (_controlFlow.ShouldBreak)
            {
                _controlFlow.ShouldBreak = false;  // Resetear solo el flag de break
                break;
            }

            // Si hay continue, resetear solo el flag de continue y seguir con la siguiente iteración
            if (_controlFlow.ShouldContinue)
            {
                _controlFlow.ShouldContinue = false;  // Resetear solo el flag de continue
                continue;
            }

            // Verificar si hay return
            if (_controlFlow.ShouldReturn)
            {
                return _controlFlow.ReturnValue;
            }
        }

        return ValueWrapper.Nil;
    }

    /// <summary>
    /// Maneja un bucle for tradicional (init; condition; post).
    /// </summary>
    /// <param name="clause">La cláusula del bucle for.</param>
    /// <param name="block">El bloque de código a ejecutar.</param>
    /// <returns>Un ValueWrapper que representa el resultado de la visita.</returns>
    private ValueWrapper HandleTraditionalFor(GoLangParser.ForClauseContext clause, GoLangParser.BlockContext block)
    {
        _environment.PushScope("for");

        try
        {
            // Inicialización
            if (clause.initStmt() != null)
            {
                _mainVisitor.Visit(clause.initStmt());
            }

            while (true)
            {
                // Condición (si no hay condición, se asume true)
                if (clause.expr() != null)
                {
                    var condition = _expressionVisitor.Visit(clause.expr());
                    if (condition == null || condition.IsNil || condition.Type != DataType.Type.Bool || !(bool)condition.Value)
                    {
                        break;
                    }
                }

                // Ejecutar bloque
                _mainVisitor.Visit(block);

                // Verificar si se debe salir del bucle
                if (_controlFlow.ShouldBreak)
                {
                    _controlFlow.ShouldBreak = false;  // Resetear solo el flag de break
                    break;
                }

                // Si hay continue, resetear solo el flag de continue y continuar con la siguiente iteración
                if (_controlFlow.ShouldContinue)
                {
                    _controlFlow.ShouldContinue = false;  // Resetear solo el flag de continue
                }
                else if (_controlFlow.ShouldReturn)
                {
                    // Si hay return, salir del bucle manteniendo la señal de return
                    return _controlFlow.ReturnValue;
                }

                // Post-statement (puede ser increment, decrement, asignación, etc.)
                if (clause.postStmt() != null)
                {
                    _mainVisitor.Visit(clause.postStmt());
                }
            }
        }
        finally
        {
            _environment.PopScope();
        }

        return ValueWrapper.Nil;
    }

    /// <summary>
    /// Maneja un bucle for-range.
    /// </summary>
    /// <param name="context">El contexto del bucle for-range.</param>
    /// <param name="block">El bloque de código a ejecutar.</param>
    /// <returns>Un ValueWrapper que representa el resultado de la visita.</returns>
    private ValueWrapper HandleRangeFor(GoLangParser.ForRangeContext context, GoLangParser.BlockContext block)
    {
        // Obtener la colección a iterar (slice, string, etc.)
        ValueWrapper collection = _expressionVisitor.Visit(context.expr());

        if (collection.IsNil)
        {
            throw new SemanticError("No se puede iterar sobre un valor nulo", context.Start);
        }

        if (!DataType.IsSlice(collection.Type) && collection.Type != DataType.Type.String)
        {
            throw new SemanticError("Solo se puede usar 'range' con slices o strings", context.Start);
        }

        // Obtener nombres de variables para índice y valor
        string indexVar = context.ID(0).GetText();
        string valueVar = context.ID().Length > 1 ? context.ID(1).GetText() : null!;

        _environment.PushScope("for-range");

        try
        {
            if (collection.Type == DataType.Type.Slice1D && collection.Value is Array arr1D)
            {
                // Iterar sobre slice 1D
                for (int i = 0; i < arr1D.Length; i++)
                {
                    // Declarar/actualizar variable de índice
                    DeclareOrUpdateVariable(indexVar, new ValueWrapper(i, DataType.Type.Int));

                    if (valueVar != null)
                    {
                        // Declarar/actualizar variable de valor
                        var sliceProps = DataType.GetSliceProperties(arr1D);
                        object value = arr1D.GetValue(i)!;
                        DeclareOrUpdateVariable(valueVar, new ValueWrapper(value, sliceProps.ElementType));
                    }

                    // Ejecutar el bloque del bucle
                    _mainVisitor.Visit(block);

                    // Manejar break/continue
                    if (_controlFlow.ShouldBreak)
                    {
                        _controlFlow.ShouldBreak = false;  // Resetear solo el flag de break
                        break;
                    }
                    if (_controlFlow.ShouldContinue)
                    {
                        _controlFlow.ShouldContinue = false;  // Resetear solo el flag de continue
                        continue;
                    }
                    if (_controlFlow.ShouldReturn)
                    {
                        // Si hay return, salir del bucle manteniendo la señal de return
                        return _controlFlow.ReturnValue;
                    }
                }
            }
            else if (collection.Type == DataType.Type.String)
            {
                // Iterar sobre string
                string str = (string)collection.Value;
                for (int i = 0; i < str.Length; i++)
                {
                    DeclareOrUpdateVariable(indexVar, new ValueWrapper(i, DataType.Type.Int));
                    if (valueVar != null)
                    {
                        DeclareOrUpdateVariable(valueVar, new ValueWrapper(str[i], DataType.Type.Rune));
                    }

                    _mainVisitor.Visit(block);

                    if (_controlFlow.ShouldBreak)
                    {
                        _controlFlow.ShouldBreak = false;  // Resetear solo el flag de break
                        break;
                    }
                    if (_controlFlow.ShouldContinue)
                    {
                        _controlFlow.ShouldContinue = false;  // Resetear solo el flag de continue
                        continue;
                    }
                    if (_controlFlow.ShouldReturn)
                    {
                        return _controlFlow.ReturnValue;
                    }
                }
            }
            else if (collection.Type == DataType.Type.Slice2D && collection.Value is Array arr2D)
            {
                // Iterar sobre slice 2D
                int rows = arr2D.GetLength(0);
                for (int i = 0; i < rows; i++)
                {
                    DeclareOrUpdateVariable(indexVar, new ValueWrapper(i, DataType.Type.Int));

                    if (valueVar != null)
                    {
                        // Crear un slice 1D para la fila actual
                        var sliceProps = DataType.GetSliceProperties(arr2D);
                        int cols = arr2D.GetLength(1);
                        Array rowArray = Array.CreateInstance(DataType.GetSystemType(sliceProps.ElementType), cols);

                        for (int j = 0; j < cols; j++)
                        {
                            rowArray.SetValue(arr2D.GetValue(i, j), j);
                        }

                        // Registrar el slice como fila
                        DataType.SliceProperties rowProps = new DataType.SliceProperties(sliceProps.ElementType, 1);
                        rowProps.Lengths[0] = cols;
                        DataType.RegisterSlice(rowArray, rowProps);

                        DeclareOrUpdateVariable(valueVar, new ValueWrapper(rowArray, DataType.Type.Slice1D));
                    }

                    _mainVisitor.Visit(block);

                    if (_controlFlow.ShouldBreak)
                    {
                        _controlFlow.ShouldBreak = false;  // Resetear solo el flag de break
                        break;
                    }
                    if (_controlFlow.ShouldContinue)
                    {
                        _controlFlow.ShouldContinue = false;  // Resetear solo el flag de continue
                        continue;
                    }
                    if (_controlFlow.ShouldReturn)
                    {
                        return _controlFlow.ReturnValue;
                    }
                }
            }
        }
        finally
        {
            _environment.PopScope();
        }

        return ValueWrapper.Nil;
    }

    /// <summary>
    /// Declara o actualiza una variable en el entorno.
    /// </summary>
    /// <param name="name">El nombre de la variable.</param>
    /// <param name="value">El valor de la variable.</param>
    private void DeclareOrUpdateVariable(string name, ValueWrapper value)
    {
        if (_environment.IsVariableInCurrentScope(name))
        {
            _environment.SetVariable(name, value, null!);
        }
        else
        {
            _environment.DeclareVariable(name, value, null!);
        }
    }

    /// <summary>
    /// Visita una declaración de break.
    /// </summary>
    /// <param name="context">El contexto de la declaración de break.</param>
    /// <returns>Un ValueWrapper que representa el resultado de la visita.</returns>
    public override ValueWrapper VisitBreakStatement(GoLangParser.BreakStatementContext context)
    {
        // Verificar si estamos en un ciclo o en un switch
        if (!_environment.IsInsideLoop() && !_environment.IsInsideSwitch())
        {
            throw new SemanticError("Break solo puede usarse dentro de un ciclo o un switch", context.Start);
        }

        _controlFlow.Break();
        return ValueWrapper.Nil;
    }

    /// <summary>
    /// Visita una declaración de continue.
    /// </summary>
    /// <param name="context">El contexto de la declaración de continue.</param>
    /// <returns>Un ValueWrapper que representa el resultado de la visita.</returns>
    public override ValueWrapper VisitContinueStatement(GoLangParser.ContinueStatementContext context)
    {
        if (!_environment.IsInsideLoop())
        {
            throw new SemanticError("Continue solo puede usarse dentro de un ciclo", context.Start);
        }

        // Activar la señal de continue
        _controlFlow.Continue();

        // Retornar inmediatamente sin procesar nada más
        return ValueWrapper.Nil;
    }
}
