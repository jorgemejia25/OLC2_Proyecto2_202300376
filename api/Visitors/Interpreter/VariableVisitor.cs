using System;
using analyzer;
using api.Common;
using Symbols; // Importar el namespace de Symbols

/// <summary>
/// Visitor para manejar declaraciones de variables en el lenguaje GoLang.
/// </summary>
class VariableVisitor : GoLangBaseVisitor<ValueWrapper>
{
    private readonly Environment _environment;
    private readonly ExpressionVisitor _expressionVisitor;
    private readonly TypeVisitor _typeVisitor;

    /// <summary>
    /// Constructor de la clase VariableVisitor.
    /// </summary>
    /// <param name="environment">Entorno compartido de variables.</param>
    /// <param name="expressionVisitor">Visitor de expresiones.</param>
    public VariableVisitor(Environment environment, ExpressionVisitor expressionVisitor)
    {
        _environment = environment;
        _expressionVisitor = expressionVisitor;
        _typeVisitor = new TypeVisitor(environment);
    }

    /// <summary>
    /// Visita una declaración de variable.
    /// </summary>
    /// <param name="context">El contexto de la declaración de variable.</param>
    /// <returns>El valor de la variable declarada.</returns>
    public override ValueWrapper VisitVarDeclaration(GoLangParser.VarDeclarationContext context)
    {
        string varName = context.ID().GetText();
        DataType.Type varType = DataType.Type.Undefined;
        ValueWrapper value = null!;
        bool isConstant = context.GetChild(0).GetText() == "const";

        // Primero determinar el tipo si está explícito
        if (context.type() != null)
        {
            varType = _typeVisitor.Visit(context.type());
        }

        // Manejo especial para inicialización de slice
        if (context.sliceInit() != null)
        {
            // Si no hay tipo explícito pero hay inicialización de slice, tratar como error
            if (context.type() == null)
            {
                throw new SemanticError("Se requiere el tipo del slice para la inicialización con {}", context.Start);
            }

            // Verificar si el tipo es un slice
            if (!DataType.IsSlice(varType))
            {
                throw new SemanticError($"El tipo {varType} no es un slice y no se puede inicializar con {{}}", context.Start);
            }

            // Obtener información del tipo de slice
            var sliceInfo = SliceTypeRegistry.GetSliceType(context.type());

            try
            {
                // Detectar si la inicialización es para un slice 1D o 2D
                bool isNestedInit = context.sliceInit().nestedSliceInit() != null;

                // Verificar coherencia entre tipo declarado y tipo de inicialización
                if ((sliceInfo.Dimensions == 1 && isNestedInit) || (sliceInfo.Dimensions == 2 && !isNestedInit))
                {
                    throw new SemanticError($"La inicialización no coincide con el tipo declarado '{varName}'", context.Start);
                }

                // Crear el slice del tipo adecuado
                value = _expressionVisitor.CreateSliceWithType(context.sliceInit(), sliceInfo.ElementType);

                _environment.DeclareVariable(varName, new ValueWrapper(value.Value, varType) { IsConstant = isConstant }, context.Start);
                return value;
            }
            catch (SemanticError ex)
            {
                // Mejorar el mensaje de error para incluir el nombre de la variable
                throw new SemanticError($"Error en la inicialización del slice '{varName}': {ex.Message}", context.Start);
            }
        }


        // Caso 1: Hay una expresión de inicialización
        if (context.expr() != null)
        {
            // Primero evaluar la expresión
            value = _expressionVisitor.Visit(context.expr());

            if (value.IsNil)
            {
                return ValueWrapper.Nil;
            }

            // Si hay un tipo explícito, verificar la compatibilidad
            if (context.type() != null)
            {
                varType = _typeVisitor.Visit(context.type());

                // Caso especial para slices
                if (DataType.IsSlice(varType) && DataType.IsSlice(value.Type))
                {
                    // Obtener información de los slices
                    var sliceInfo = SliceTypeRegistry.GetSliceType(context.type());
                    var valueProps = DataType.GetSliceProperties(value.Value);

                    if (valueProps != null && sliceInfo.ElementType == valueProps.ElementType)
                    {
                        // Los slices son compatibles, no es necesario hacer más verificaciones
                        _environment.DeclareVariable(varName, new ValueWrapper(value.Value, varType) { IsConstant = isConstant }, context.Start);
                        return value;
                    }
                }

                // Para otros tipos, verificar compatibilidad normalmente
                if (!DataType.CheckType(value.Value, varType, context.Start))
                {
                    throw new SemanticError("Error al inferir el tipo de la variable", context.Start);
                }

                // Convertir el valor si es necesario
                value = new ValueWrapper(
                    DataType.Convert(value.Value, varType),
                    varType
                );
            }
            else
            {
                // Si no hay tipo explícito, usar el tipo del valor
                varType = value.Type;
            }
        }
        // Caso 2: No hay expresión, pero sí hay un tipo
        else if (context.type() != null)
        {
            varType = _typeVisitor.Visit(context.type());

            // Si es un slice, crear uno vacío del tipo correspondiente
            if (DataType.IsSlice(varType))
            {
                var sliceInfo = SliceTypeRegistry.GetSliceType(context.type());
                if (sliceInfo.ElementType != DataType.Type.Undefined)
                {
                    int[] dimensions = new int[sliceInfo.Dimensions];
                    object sliceValue = DataType.CreateEmptySlice(sliceInfo.ElementType, dimensions);
                    value = new ValueWrapper(sliceValue, varType);
                }
                else
                {
                    throw new SemanticError("Error al obtener información del slice", context.Start);
                }
            }
            else
            {
                // Para tipos básicos, usar valor por defecto
                value = new ValueWrapper(DataType.GetDefaultValue(varType), varType);
            }
        }
        // Caso 3: No hay expresión ni tipo - error
        else
        {
            throw new SemanticError("Error al inferir el tipo de la variable", context.Start);
        }

        value.IsConstant = isConstant;
        _environment.DeclareVariable(varName, value, context.Start);
        return value;
    }

    private DataType.Type GetElementType(GoLangParser.TypeContext context)
    {
        string typeText = context.GetText();
        if (!typeText.StartsWith("[]"))
            return GetBaseType(typeText);

        // Para slices multidimensionales, procesar recursivamente
        if (typeText.StartsWith("[][]"))
        {
            // Retornar el tipo del elemento más interno
            return GetBaseType(typeText.Substring(4));
        }

        // Para una dimensión, retornar el tipo base
        return GetBaseType(typeText.Substring(2));
    }

    private DataType.Type GetBaseType(string type)
    {
        return type switch
        {
            "int" => DataType.Type.Int,
            "float64" => DataType.Type.Float,
            "string" => DataType.Type.String,
            "bool" => DataType.Type.Bool,
            "rune" => DataType.Type.Rune,
            _ => DataType.Type.Undefined
        };
    }

    /// <summary>
    /// Visita una declaración implícita de variable (usando :=)
    /// </summary>
    /// <param name="context">El contexto de la declaración implícita.</param>
    /// <returns>El valor de la variable declarada.</returns>
    public override ValueWrapper VisitImplicitDeclaration(GoLangParser.ImplicitDeclarationContext context)
    {
        string varName = context.ID().GetText();

        // Verificar si ya existe la variable en el scope actual
        if (_environment.IsVariableInCurrentScope(varName))
        {
            throw new SemanticError($"La variable '{varName}' ya está definida en este scope", context.Start);
        }

        ValueWrapper value;

        // Determinar si la declaración es con expresión o con inicialización de slice
        if (context.expr() != null)
        {
            value = _expressionVisitor.Visit(context.expr());
        }
        else if (context.sliceInit() != null)
        {
            value = _expressionVisitor.Visit(context.sliceInit());
        }
        else
        {
            throw new SemanticError("Error en la declaración implícita", context.Start);
        }

        if (value.IsNil)
        {
            throw new SemanticError("Error al evaluar la expresión de la declaración implícita", context.Start);
        }

        _environment.DeclareVariable(varName, value, context.Start);
        return value;
    }

    /// <summary>
    /// Visita una asignación de variable.
    /// </summary>
    /// <param name="context">El contexto de la asignación.</param>
    /// <returns>El valor asignado.</returns>
    public override ValueWrapper VisitAssignment(GoLangParser.AssignmentContext context)
    {
        // Caso 1: Asignación simple a una variable (var = expr o var = {valores})
        if (context.ID() != null)
        {
            string varName = context.ID().GetText();
            var variable = _environment.GetVariable(varName);

            if (variable == null)
            {
                throw new SemanticError($"Variable '{varName}' no está definida", context.Start);
            }

            if (variable.IsConstant)
            {
                throw new SemanticError($"No se puede reasignar una constante", context.Start);
            }

            // Verificar si hay una inicialización de slice en el lado derecho
            if (context.sliceInit() != null)
            {
                // Obtener el nuevo slice de la inicialización
                var newSliceValue = _expressionVisitor.Visit(context.sliceInit());

                // Caso especial: Si la variable actual es un slice sin tipo o vacío
                if (variable.Type == DataType.Type.UntypedSlice)
                {
                    // Actualizar el tipo de la variable según el nuevo slice
                    if (newSliceValue.Type == DataType.Type.Slice1D || newSliceValue.Type == DataType.Type.Slice2D)
                    {
                        // Obtener propiedades del nuevo slice
                        var newProps = DataType.GetSliceProperties(newSliceValue.Value);
                        if (newProps != null)
                        {
                            // Actualizar variable con nuevo slice y su tipo
                            variable.Value = newSliceValue.Value;
                            variable.Type = newSliceValue.Type;

                            return newSliceValue;
                        }
                    }
                }

                // Verificar si la variable es un slice
                if (!DataType.IsSlice(variable.Type))
                {
                    throw new SemanticError($"No se puede asignar un slice a una variable de tipo {variable.Type}", context.Start);
                }

                // Obtener las propiedades del slice de destino
                var props = DataType.GetSliceProperties(variable.Value);
                if (props == null)
                {
                    throw new SemanticError("Error al obtener propiedades del slice", context.Start);
                }

                try
                {
                    // Verificar si la inicialización es para 1D o 2D
                    bool isNestedInit = context.sliceInit().nestedSliceInit() != null;

                    // Caso especial para asignación de slices 2D
                    if (variable.Type == DataType.Type.Slice2D && isNestedInit)
                    {
                        // Crear el nuevo slice 2D preservando el tipo de elemento del slice original
                        ValueWrapper newSlice = _expressionVisitor.Create2DSliceWithType(context.sliceInit(), props.ElementType);

                        // Asignar el nuevo slice a la variable
                        variable.Value = newSlice.Value;
                        return newSlice;
                    }
                    // Caso para slice 1D o error de dimensiones
                    else if ((props.Dimensions == 1 && isNestedInit) || (props.Dimensions == 2 && !isNestedInit))
                    {
                        throw new SemanticError("La inicialización del slice no coincide con las dimensiones de la variable", context.Start);
                    }
                    else
                    {
                        // Crear el nuevo slice con el tipo de elementos correcto
                        ValueWrapper newSlice = _expressionVisitor.CreateSliceWithType(context.sliceInit(), props.ElementType);

                        // Asignar el nuevo slice a la variable
                        variable.Value = newSlice.Value;
                        return newSlice;
                    }
                }
                catch (SemanticError ex)
                {
                    throw new SemanticError($"Error al asignar slice a '{varName}': {ex.Message}", context.Start);
                }
            }



            // Caso normal: Asignación de expresión
            if (context.expr().Length > 0)
            {
                var newValue = _expressionVisitor.Visit(context.expr(0));
                if (newValue == null || newValue.IsNil)
                {
                    return ValueWrapper.Nil;
                }

                // Validar la compatibilidad de tipos
                if (!DataType.CheckType(newValue.Value, variable.Type, context.Start))
                {
                    return ValueWrapper.Nil;
                }

                // Convertir el valor si es necesario
                var convertedValue = DataType.Convert(newValue.Value, variable.Type);
                variable.Value = convertedValue;
                return new ValueWrapper(convertedValue, variable.Type);
            }
        }
        // Caso 2: Asignación a elemento de slice 2D
        else if (context.expr().Length >= 3)
        {
            var arrayExpr = _expressionVisitor.Visit(context.expr(0));
            var indexExpr = _expressionVisitor.Visit(context.expr(1));
            var valueExpr = _expressionVisitor.Visit(context.expr(2));

            if (arrayExpr.Value is ExpressionVisitor.SliceRowWrapper rowWrapper)
            {
                // Add column index extraction before using it
                if (!(indexExpr.Value is int) && !int.TryParse(indexExpr.Value.ToString(), out _))
                {
                    throw new SemanticError("El índice debe ser un entero", context.expr(1).Start);
                }

                int column = Convert.ToInt32(indexExpr.Value);

                if (column < 0 || column >= rowWrapper.Length)
                {
                    throw new SemanticError("Índice fuera de rango", context.expr(1).Start);
                }

                // Obtener propiedades del slice padre (2D)
                var parentProps = DataType.GetSliceProperties(rowWrapper.ParentArray);
                if (parentProps == null)
                {
                    throw new SemanticError("Error al obtener propiedades del slice padre", context.Start);
                }

                // Add type compatibility check
                if (!DataType.CheckType(valueExpr.Value, parentProps.ElementType, context.expr(2).Start))
                {
                    throw new SemanticError($"Tipo incorrecto para asignación. Esperado: {parentProps.ElementType}, Recibido: {valueExpr.Type}",
                        context.expr(2).Start);
                }

                object convertedValue = DataType.Convert(valueExpr.Value, parentProps.ElementType);
                rowWrapper.SetValue(convertedValue, column);
                return new ValueWrapper(convertedValue, parentProps.ElementType);
            }
            // Add this block to handle 1D slices
            else if (arrayExpr.Type == DataType.Type.Slice1D && arrayExpr.Value is Array arr1D)
            {
                if (!(indexExpr.Value is int) && !int.TryParse(indexExpr.Value.ToString(), out _))
                {
                    throw new SemanticError("El índice debe ser un entero", context.expr(1).Start);
                }

                int index = Convert.ToInt32(indexExpr.Value);

                if (index < 0 || index >= arr1D.Length)
                {
                    throw new SemanticError("Índice fuera de rango", context.expr(1).Start);
                }

                var props = DataType.GetSliceProperties(arr1D);
                if (props == null)
                {
                    throw new SemanticError("Error al obtener propiedades del slice", context.Start);
                }

                // Add type compatibility check
                if (!DataType.CheckType(valueExpr.Value, props.ElementType, context.expr(2).Start))
                {
                    throw new SemanticError($"Tipo incorrecto para asignación. Esperado: {props.ElementType}, Recibido: {valueExpr.Type}",
                        context.expr(2).Start);
                }

                object convertedValue = DataType.Convert(valueExpr.Value, props.ElementType);
                arr1D.SetValue(convertedValue, index);

                return new ValueWrapper(convertedValue, props.ElementType);
            }

            throw new SemanticError("Tipo de slice no soportado", context.Start);
        }

        throw new SemanticError("Formato de asignación no válido", context.Start);
    }


    public override ValueWrapper VisitCompoundAssignment(GoLangParser.CompoundAssignmentContext context)
    {
        string varName = context.ID().GetText();
        var variable = _environment.GetVariable(varName);


        if (variable == null)
        {
            throw new SemanticError($"Variable '{varName}' no está definida", context.Start);
        }

        // Solo permitir += y -= en tipos numéricos
        if (variable.Type != DataType.Type.Int && variable.Type != DataType.Type.Float)
        {
            throw new SemanticError($"Operadores += y -= solo pueden usarse con tipos numéricos", context.Start);
        }

        var rightValue = _expressionVisitor.Visit(context.expr());
        if (rightValue.IsNil) return ValueWrapper.Nil;

        string op = context.op.Text;
        double currentValue = Convert.ToDouble(variable.Value);
        double rightNumber = Convert.ToDouble(rightValue.Value);

        // Realizar la operación
        double result = op == "+=" ? currentValue + rightNumber : currentValue - rightNumber;

        // Crear nuevo ValueWrapper manteniendo el tipo original
        var finalValue = new ValueWrapper(
            variable.Type == DataType.Type.Int ? (object)Convert.ToInt32(result) : result,
            variable.Type,
            variable.ScopeName
        );

        _environment.SetVariable(varName, finalValue, context.Start);
        return finalValue;
    }


    private DataType.Type ParseTypeString(string typeName)
    {
        return typeName switch
        {
            "int" => DataType.Type.Int,
            "float64" => DataType.Type.Float,
            "string" => DataType.Type.String,
            "bool" => DataType.Type.Bool,
            "rune" => DataType.Type.Rune,
            _ => DataType.Type.Undefined
        };
    }

    /// <summary>
    /// Maneja las operaciones de incremento (++) y decremento (--)
    /// </summary>
    /// <param name="context">Contexto de la operación</param>
    /// <returns>El nuevo valor de la variable</returns>
    public override ValueWrapper VisitIncDecStatement(GoLangParser.IncDecStatementContext context)
    {
        string varName = context.ID().GetText();
        string op = context.op.Text;

        // Obtener el valor actual de la variable
        var currentValue = _environment.GetVariable(varName);

        if (currentValue == null)
        {
            throw new SemanticError($"Variable '{varName}' no definida", context.Start);
        }

        // Verificar que sea un tipo numérico
        if (currentValue.Type != DataType.Type.Int && currentValue.Type != DataType.Type.Float)
        {
            throw new SemanticError($"Operador {op} no puede aplicarse a variables de tipo {currentValue.Type}", context.Start);
        }

        // Calcular el nuevo valor
        object newValue;
        if (currentValue.Type == DataType.Type.Int)
        {
            int currentInt = (int)currentValue.Value;
            newValue = op == "++" ? currentInt + 1 : currentInt - 1;
        }
        else // Float
        {
            double currentDouble = Convert.ToDouble(currentValue.Value);
            newValue = op == "++" ? currentDouble + 1 : currentDouble - 1;
        }

        // Crear un nuevo ValueWrapper con el valor actualizado
        var updatedValue = new ValueWrapper(newValue, currentValue.Type);

        // Actualizar la variable en el entorno
        _environment.SetVariable(varName, updatedValue, context.Start);

        return updatedValue;
    }
}