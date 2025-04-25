// Generated from /home/jorgis/Documents/USAC/Compi2/OLC2_Proyecto2_202300376/api/Grammar/GoLang.g4 by ANTLR 4.13.1
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link GoLangParser}.
 */
public interface GoLangListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link GoLangParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(GoLangParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(GoLangParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterStatement(GoLangParser.StatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitStatement(GoLangParser.StatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#simpleStatement}.
	 * @param ctx the parse tree
	 */
	void enterSimpleStatement(GoLangParser.SimpleStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#simpleStatement}.
	 * @param ctx the parse tree
	 */
	void exitSimpleStatement(GoLangParser.SimpleStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#varDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterVarDeclaration(GoLangParser.VarDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#varDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitVarDeclaration(GoLangParser.VarDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#funcDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterFuncDeclaration(GoLangParser.FuncDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#funcDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitFuncDeclaration(GoLangParser.FuncDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#funcParams}.
	 * @param ctx the parse tree
	 */
	void enterFuncParams(GoLangParser.FuncParamsContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#funcParams}.
	 * @param ctx the parse tree
	 */
	void exitFuncParams(GoLangParser.FuncParamsContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#funcParam}.
	 * @param ctx the parse tree
	 */
	void enterFuncParam(GoLangParser.FuncParamContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#funcParam}.
	 * @param ctx the parse tree
	 */
	void exitFuncParam(GoLangParser.FuncParamContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#invoke}.
	 * @param ctx the parse tree
	 */
	void enterInvoke(GoLangParser.InvokeContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#invoke}.
	 * @param ctx the parse tree
	 */
	void exitInvoke(GoLangParser.InvokeContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#invokeParams}.
	 * @param ctx the parse tree
	 */
	void enterInvokeParams(GoLangParser.InvokeParamsContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#invokeParams}.
	 * @param ctx the parse tree
	 */
	void exitInvokeParams(GoLangParser.InvokeParamsContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#invokeMethod}.
	 * @param ctx the parse tree
	 */
	void enterInvokeMethod(GoLangParser.InvokeMethodContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#invokeMethod}.
	 * @param ctx the parse tree
	 */
	void exitInvokeMethod(GoLangParser.InvokeMethodContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#implicitDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterImplicitDeclaration(GoLangParser.ImplicitDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#implicitDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitImplicitDeclaration(GoLangParser.ImplicitDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#assignment}.
	 * @param ctx the parse tree
	 */
	void enterAssignment(GoLangParser.AssignmentContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#assignment}.
	 * @param ctx the parse tree
	 */
	void exitAssignment(GoLangParser.AssignmentContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#compoundAssignment}.
	 * @param ctx the parse tree
	 */
	void enterCompoundAssignment(GoLangParser.CompoundAssignmentContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#compoundAssignment}.
	 * @param ctx the parse tree
	 */
	void exitCompoundAssignment(GoLangParser.CompoundAssignmentContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#incDecStatement}.
	 * @param ctx the parse tree
	 */
	void enterIncDecStatement(GoLangParser.IncDecStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#incDecStatement}.
	 * @param ctx the parse tree
	 */
	void exitIncDecStatement(GoLangParser.IncDecStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#exprStatement}.
	 * @param ctx the parse tree
	 */
	void enterExprStatement(GoLangParser.ExprStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#exprStatement}.
	 * @param ctx the parse tree
	 */
	void exitExprStatement(GoLangParser.ExprStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#ifStatement}.
	 * @param ctx the parse tree
	 */
	void enterIfStatement(GoLangParser.IfStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#ifStatement}.
	 * @param ctx the parse tree
	 */
	void exitIfStatement(GoLangParser.IfStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#whileStatement}.
	 * @param ctx the parse tree
	 */
	void enterWhileStatement(GoLangParser.WhileStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#whileStatement}.
	 * @param ctx the parse tree
	 */
	void exitWhileStatement(GoLangParser.WhileStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#breakStatement}.
	 * @param ctx the parse tree
	 */
	void enterBreakStatement(GoLangParser.BreakStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#breakStatement}.
	 * @param ctx the parse tree
	 */
	void exitBreakStatement(GoLangParser.BreakStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#continueStatement}.
	 * @param ctx the parse tree
	 */
	void enterContinueStatement(GoLangParser.ContinueStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#continueStatement}.
	 * @param ctx the parse tree
	 */
	void exitContinueStatement(GoLangParser.ContinueStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#switchStatement}.
	 * @param ctx the parse tree
	 */
	void enterSwitchStatement(GoLangParser.SwitchStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#switchStatement}.
	 * @param ctx the parse tree
	 */
	void exitSwitchStatement(GoLangParser.SwitchStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#forStatement}.
	 * @param ctx the parse tree
	 */
	void enterForStatement(GoLangParser.ForStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#forStatement}.
	 * @param ctx the parse tree
	 */
	void exitForStatement(GoLangParser.ForStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#forCondition}.
	 * @param ctx the parse tree
	 */
	void enterForCondition(GoLangParser.ForConditionContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#forCondition}.
	 * @param ctx the parse tree
	 */
	void exitForCondition(GoLangParser.ForConditionContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#forClause}.
	 * @param ctx the parse tree
	 */
	void enterForClause(GoLangParser.ForClauseContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#forClause}.
	 * @param ctx the parse tree
	 */
	void exitForClause(GoLangParser.ForClauseContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#forRange}.
	 * @param ctx the parse tree
	 */
	void enterForRange(GoLangParser.ForRangeContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#forRange}.
	 * @param ctx the parse tree
	 */
	void exitForRange(GoLangParser.ForRangeContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#initStmt}.
	 * @param ctx the parse tree
	 */
	void enterInitStmt(GoLangParser.InitStmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#initStmt}.
	 * @param ctx the parse tree
	 */
	void exitInitStmt(GoLangParser.InitStmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#postStmt}.
	 * @param ctx the parse tree
	 */
	void enterPostStmt(GoLangParser.PostStmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#postStmt}.
	 * @param ctx the parse tree
	 */
	void exitPostStmt(GoLangParser.PostStmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#caseStatement}.
	 * @param ctx the parse tree
	 */
	void enterCaseStatement(GoLangParser.CaseStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#caseStatement}.
	 * @param ctx the parse tree
	 */
	void exitCaseStatement(GoLangParser.CaseStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#defaultCase}.
	 * @param ctx the parse tree
	 */
	void enterDefaultCase(GoLangParser.DefaultCaseContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#defaultCase}.
	 * @param ctx the parse tree
	 */
	void exitDefaultCase(GoLangParser.DefaultCaseContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#block}.
	 * @param ctx the parse tree
	 */
	void enterBlock(GoLangParser.BlockContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#block}.
	 * @param ctx the parse tree
	 */
	void exitBlock(GoLangParser.BlockContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#elseBlock}.
	 * @param ctx the parse tree
	 */
	void enterElseBlock(GoLangParser.ElseBlockContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#elseBlock}.
	 * @param ctx the parse tree
	 */
	void exitElseBlock(GoLangParser.ElseBlockContext ctx);
	/**
	 * Enter a parse tree produced by the {@code SlicesIndex}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterSlicesIndex(GoLangParser.SlicesIndexContext ctx);
	/**
	 * Exit a parse tree produced by the {@code SlicesIndex}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitSlicesIndex(GoLangParser.SlicesIndexContext ctx);
	/**
	 * Enter a parse tree produced by the {@code Variable}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterVariable(GoLangParser.VariableContext ctx);
	/**
	 * Exit a parse tree produced by the {@code Variable}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitVariable(GoLangParser.VariableContext ctx);
	/**
	 * Enter a parse tree produced by the {@code Or}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterOr(GoLangParser.OrContext ctx);
	/**
	 * Exit a parse tree produced by the {@code Or}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitOr(GoLangParser.OrContext ctx);
	/**
	 * Enter a parse tree produced by the {@code MulDiv}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterMulDiv(GoLangParser.MulDivContext ctx);
	/**
	 * Exit a parse tree produced by the {@code MulDiv}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitMulDiv(GoLangParser.MulDivContext ctx);
	/**
	 * Enter a parse tree produced by the {@code StringsJoin}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterStringsJoin(GoLangParser.StringsJoinContext ctx);
	/**
	 * Exit a parse tree produced by the {@code StringsJoin}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitStringsJoin(GoLangParser.StringsJoinContext ctx);
	/**
	 * Enter a parse tree produced by the {@code Parens}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterParens(GoLangParser.ParensContext ctx);
	/**
	 * Exit a parse tree produced by the {@code Parens}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitParens(GoLangParser.ParensContext ctx);
	/**
	 * Enter a parse tree produced by the {@code InvokeLiteral}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterInvokeLiteral(GoLangParser.InvokeLiteralContext ctx);
	/**
	 * Exit a parse tree produced by the {@code InvokeLiteral}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitInvokeLiteral(GoLangParser.InvokeLiteralContext ctx);
	/**
	 * Enter a parse tree produced by the {@code String}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterString(GoLangParser.StringContext ctx);
	/**
	 * Exit a parse tree produced by the {@code String}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitString(GoLangParser.StringContext ctx);
	/**
	 * Enter a parse tree produced by the {@code TypedSliceInit}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterTypedSliceInit(GoLangParser.TypedSliceInitContext ctx);
	/**
	 * Exit a parse tree produced by the {@code TypedSliceInit}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitTypedSliceInit(GoLangParser.TypedSliceInitContext ctx);
	/**
	 * Enter a parse tree produced by the {@code StrconvAtoi}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterStrconvAtoi(GoLangParser.StrconvAtoiContext ctx);
	/**
	 * Exit a parse tree produced by the {@code StrconvAtoi}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitStrconvAtoi(GoLangParser.StrconvAtoiContext ctx);
	/**
	 * Enter a parse tree produced by the {@code Number}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterNumber(GoLangParser.NumberContext ctx);
	/**
	 * Exit a parse tree produced by the {@code Number}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitNumber(GoLangParser.NumberContext ctx);
	/**
	 * Enter a parse tree produced by the {@code Comparison}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterComparison(GoLangParser.ComparisonContext ctx);
	/**
	 * Exit a parse tree produced by the {@code Comparison}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitComparison(GoLangParser.ComparisonContext ctx);
	/**
	 * Enter a parse tree produced by the {@code Equality}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterEquality(GoLangParser.EqualityContext ctx);
	/**
	 * Exit a parse tree produced by the {@code Equality}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitEquality(GoLangParser.EqualityContext ctx);
	/**
	 * Enter a parse tree produced by the {@code Boolean}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterBoolean(GoLangParser.BooleanContext ctx);
	/**
	 * Exit a parse tree produced by the {@code Boolean}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitBoolean(GoLangParser.BooleanContext ctx);
	/**
	 * Enter a parse tree produced by the {@code StrconvParseFloat}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterStrconvParseFloat(GoLangParser.StrconvParseFloatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code StrconvParseFloat}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitStrconvParseFloat(GoLangParser.StrconvParseFloatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code InvokeMethodLiteral}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterInvokeMethodLiteral(GoLangParser.InvokeMethodLiteralContext ctx);
	/**
	 * Exit a parse tree produced by the {@code InvokeMethodLiteral}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitInvokeMethodLiteral(GoLangParser.InvokeMethodLiteralContext ctx);
	/**
	 * Enter a parse tree produced by the {@code AddSub}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterAddSub(GoLangParser.AddSubContext ctx);
	/**
	 * Exit a parse tree produced by the {@code AddSub}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitAddSub(GoLangParser.AddSubContext ctx);
	/**
	 * Enter a parse tree produced by the {@code IndexAccess}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterIndexAccess(GoLangParser.IndexAccessContext ctx);
	/**
	 * Exit a parse tree produced by the {@code IndexAccess}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitIndexAccess(GoLangParser.IndexAccessContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ReflectTypeOf}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterReflectTypeOf(GoLangParser.ReflectTypeOfContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ReflectTypeOf}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitReflectTypeOf(GoLangParser.ReflectTypeOfContext ctx);
	/**
	 * Enter a parse tree produced by the {@code Nil}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterNil(GoLangParser.NilContext ctx);
	/**
	 * Exit a parse tree produced by the {@code Nil}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitNil(GoLangParser.NilContext ctx);
	/**
	 * Enter a parse tree produced by the {@code Neg}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterNeg(GoLangParser.NegContext ctx);
	/**
	 * Exit a parse tree produced by the {@code Neg}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitNeg(GoLangParser.NegContext ctx);
	/**
	 * Enter a parse tree produced by the {@code Float}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterFloat(GoLangParser.FloatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code Float}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitFloat(GoLangParser.FloatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code Not}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterNot(GoLangParser.NotContext ctx);
	/**
	 * Exit a parse tree produced by the {@code Not}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitNot(GoLangParser.NotContext ctx);
	/**
	 * Enter a parse tree produced by the {@code Append}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterAppend(GoLangParser.AppendContext ctx);
	/**
	 * Exit a parse tree produced by the {@code Append}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitAppend(GoLangParser.AppendContext ctx);
	/**
	 * Enter a parse tree produced by the {@code Len}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterLen(GoLangParser.LenContext ctx);
	/**
	 * Exit a parse tree produced by the {@code Len}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitLen(GoLangParser.LenContext ctx);
	/**
	 * Enter a parse tree produced by the {@code And}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterAnd(GoLangParser.AndContext ctx);
	/**
	 * Exit a parse tree produced by the {@code And}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitAnd(GoLangParser.AndContext ctx);
	/**
	 * Enter a parse tree produced by the {@code FieldAccess}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterFieldAccess(GoLangParser.FieldAccessContext ctx);
	/**
	 * Exit a parse tree produced by the {@code FieldAccess}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitFieldAccess(GoLangParser.FieldAccessContext ctx);
	/**
	 * Enter a parse tree produced by the {@code Rune}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterRune(GoLangParser.RuneContext ctx);
	/**
	 * Exit a parse tree produced by the {@code Rune}
	 * labeled alternative in {@link GoLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitRune(GoLangParser.RuneContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#sliceInit}.
	 * @param ctx the parse tree
	 */
	void enterSliceInit(GoLangParser.SliceInitContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#sliceInit}.
	 * @param ctx the parse tree
	 */
	void exitSliceInit(GoLangParser.SliceInitContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#nestedSliceInit}.
	 * @param ctx the parse tree
	 */
	void enterNestedSliceInit(GoLangParser.NestedSliceInitContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#nestedSliceInit}.
	 * @param ctx the parse tree
	 */
	void exitNestedSliceInit(GoLangParser.NestedSliceInitContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#printStatement}.
	 * @param ctx the parse tree
	 */
	void enterPrintStatement(GoLangParser.PrintStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#printStatement}.
	 * @param ctx the parse tree
	 */
	void exitPrintStatement(GoLangParser.PrintStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#returnStatement}.
	 * @param ctx the parse tree
	 */
	void enterReturnStatement(GoLangParser.ReturnStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#returnStatement}.
	 * @param ctx the parse tree
	 */
	void exitReturnStatement(GoLangParser.ReturnStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#type}.
	 * @param ctx the parse tree
	 */
	void enterType(GoLangParser.TypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#type}.
	 * @param ctx the parse tree
	 */
	void exitType(GoLangParser.TypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#baseType}.
	 * @param ctx the parse tree
	 */
	void enterBaseType(GoLangParser.BaseTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#baseType}.
	 * @param ctx the parse tree
	 */
	void exitBaseType(GoLangParser.BaseTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#arrayType}.
	 * @param ctx the parse tree
	 */
	void enterArrayType(GoLangParser.ArrayTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#arrayType}.
	 * @param ctx the parse tree
	 */
	void exitArrayType(GoLangParser.ArrayTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link GoLangParser#exprList}.
	 * @param ctx the parse tree
	 */
	void enterExprList(GoLangParser.ExprListContext ctx);
	/**
	 * Exit a parse tree produced by {@link GoLangParser#exprList}.
	 * @param ctx the parse tree
	 */
	void exitExprList(GoLangParser.ExprListContext ctx);
}