// Generated from /home/jorgis/Documents/USAC/Compi2/OLC2_Proyecto2_202300376/api/Grammar/GoLang.g4 by ANTLR 4.13.1
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast", "CheckReturnValue"})
public class GoLangParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.13.1", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, T__7=8, T__8=9, 
		T__9=10, T__10=11, T__11=12, T__12=13, T__13=14, T__14=15, T__15=16, T__16=17, 
		T__17=18, T__18=19, T__19=20, T__20=21, T__21=22, T__22=23, T__23=24, 
		T__24=25, T__25=26, T__26=27, T__27=28, T__28=29, T__29=30, T__30=31, 
		T__31=32, T__32=33, T__33=34, T__34=35, T__35=36, T__36=37, T__37=38, 
		T__38=39, T__39=40, T__40=41, T__41=42, T__42=43, T__43=44, T__44=45, 
		T__45=46, T__46=47, T__47=48, T__48=49, T__49=50, T__50=51, T__51=52, 
		T__52=53, T__53=54, T__54=55, T__55=56, T__56=57, T__57=58, INT=59, FLOAT=60, 
		STRING=61, RUNE=62, BOOL=63, ID=64, SEMICOLON=65, WS=66, SINGLE_LINE_COMMENT=67, 
		MULTI_LINE_COMMENT=68;
	public static final int
		RULE_program = 0, RULE_statement = 1, RULE_simpleStatement = 2, RULE_varDeclaration = 3, 
		RULE_funcDeclaration = 4, RULE_funcParams = 5, RULE_funcParam = 6, RULE_invoke = 7, 
		RULE_invokeParams = 8, RULE_invokeMethod = 9, RULE_implicitDeclaration = 10, 
		RULE_assignment = 11, RULE_compoundAssignment = 12, RULE_incDecStatement = 13, 
		RULE_exprStatement = 14, RULE_ifStatement = 15, RULE_whileStatement = 16, 
		RULE_breakStatement = 17, RULE_continueStatement = 18, RULE_switchStatement = 19, 
		RULE_forStatement = 20, RULE_forCondition = 21, RULE_forClause = 22, RULE_forRange = 23, 
		RULE_initStmt = 24, RULE_postStmt = 25, RULE_caseStatement = 26, RULE_defaultCase = 27, 
		RULE_block = 28, RULE_elseBlock = 29, RULE_expr = 30, RULE_sliceInit = 31, 
		RULE_nestedSliceInit = 32, RULE_printStatement = 33, RULE_returnStatement = 34, 
		RULE_type = 35, RULE_baseType = 36, RULE_arrayType = 37, RULE_exprList = 38;
	private static String[] makeRuleNames() {
		return new String[] {
			"program", "statement", "simpleStatement", "varDeclaration", "funcDeclaration", 
			"funcParams", "funcParam", "invoke", "invokeParams", "invokeMethod", 
			"implicitDeclaration", "assignment", "compoundAssignment", "incDecStatement", 
			"exprStatement", "ifStatement", "whileStatement", "breakStatement", "continueStatement", 
			"switchStatement", "forStatement", "forCondition", "forClause", "forRange", 
			"initStmt", "postStmt", "caseStatement", "defaultCase", "block", "elseBlock", 
			"expr", "sliceInit", "nestedSliceInit", "printStatement", "returnStatement", 
			"type", "baseType", "arrayType", "exprList"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'var'", "'const'", "'='", "':='", "'func'", "'('", "')'", "','", 
			"'.'", "'['", "']'", "'+='", "'-='", "'++'", "'--'", "'if'", "'else'", 
			"'while'", "'break'", "'continue'", "'switch'", "'{'", "'}'", "'for'", 
			"'range'", "'case'", "':'", "'default'", "'*'", "'/'", "'%'", "'+'", 
			"'-'", "'=='", "'!='", "'>'", "'<'", "'>='", "'<='", "'!'", "'len'", 
			"'append'", "'strings.Join'", "'slices.Index'", "'strconv.Atoi'", "'strconv.ParseFloat'", 
			"'reflect.TypeOf'", "'&&'", "'||'", "'nil'", "'fmt.Println'", "'return'", 
			"'int'", "'float64'", "'string'", "'bool'", "'rune'", "'[]'", null, null, 
			null, null, null, null, "';'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, "INT", 
			"FLOAT", "STRING", "RUNE", "BOOL", "ID", "SEMICOLON", "WS", "SINGLE_LINE_COMMENT", 
			"MULTI_LINE_COMMENT"
		};
	}
	private static final String[] _SYMBOLIC_NAMES = makeSymbolicNames();
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}

	@Override
	public String getGrammarFileName() { return "GoLang.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public GoLangParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@SuppressWarnings("CheckReturnValue")
	public static class ProgramContext extends ParserRuleContext {
		public List<StatementContext> statement() {
			return getRuleContexts(StatementContext.class);
		}
		public StatementContext statement(int i) {
			return getRuleContext(StatementContext.class,i);
		}
		public ProgramContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_program; }
	}

	public final ProgramContext program() throws RecognitionException {
		ProgramContext _localctx = new ProgramContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_program);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(79); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				{
				setState(78);
				statement();
				}
				}
				setState(81); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( ((((_la - 1)) & ~0x3f) == 0 && ((1L << (_la - 1)) & -140034346364010445L) != 0) );
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class StatementContext extends ParserRuleContext {
		public VarDeclarationContext varDeclaration() {
			return getRuleContext(VarDeclarationContext.class,0);
		}
		public TerminalNode SEMICOLON() { return getToken(GoLangParser.SEMICOLON, 0); }
		public ImplicitDeclarationContext implicitDeclaration() {
			return getRuleContext(ImplicitDeclarationContext.class,0);
		}
		public FuncDeclarationContext funcDeclaration() {
			return getRuleContext(FuncDeclarationContext.class,0);
		}
		public SimpleStatementContext simpleStatement() {
			return getRuleContext(SimpleStatementContext.class,0);
		}
		public StatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_statement; }
	}

	public final StatementContext statement() throws RecognitionException {
		StatementContext _localctx = new StatementContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_statement);
		int _la;
		try {
			setState(93);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,3,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(83);
				varDeclaration();
				setState(85);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==SEMICOLON) {
					{
					setState(84);
					match(SEMICOLON);
					}
				}

				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(87);
				implicitDeclaration();
				setState(89);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==SEMICOLON) {
					{
					setState(88);
					match(SEMICOLON);
					}
				}

				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(91);
				funcDeclaration();
				}
				break;
			case 4:
				enterOuterAlt(_localctx, 4);
				{
				setState(92);
				simpleStatement();
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class SimpleStatementContext extends ParserRuleContext {
		public ExprStatementContext exprStatement() {
			return getRuleContext(ExprStatementContext.class,0);
		}
		public TerminalNode SEMICOLON() { return getToken(GoLangParser.SEMICOLON, 0); }
		public AssignmentContext assignment() {
			return getRuleContext(AssignmentContext.class,0);
		}
		public CompoundAssignmentContext compoundAssignment() {
			return getRuleContext(CompoundAssignmentContext.class,0);
		}
		public IncDecStatementContext incDecStatement() {
			return getRuleContext(IncDecStatementContext.class,0);
		}
		public PrintStatementContext printStatement() {
			return getRuleContext(PrintStatementContext.class,0);
		}
		public IfStatementContext ifStatement() {
			return getRuleContext(IfStatementContext.class,0);
		}
		public WhileStatementContext whileStatement() {
			return getRuleContext(WhileStatementContext.class,0);
		}
		public BreakStatementContext breakStatement() {
			return getRuleContext(BreakStatementContext.class,0);
		}
		public ContinueStatementContext continueStatement() {
			return getRuleContext(ContinueStatementContext.class,0);
		}
		public SwitchStatementContext switchStatement() {
			return getRuleContext(SwitchStatementContext.class,0);
		}
		public ReturnStatementContext returnStatement() {
			return getRuleContext(ReturnStatementContext.class,0);
		}
		public InvokeContext invoke() {
			return getRuleContext(InvokeContext.class,0);
		}
		public InvokeMethodContext invokeMethod() {
			return getRuleContext(InvokeMethodContext.class,0);
		}
		public ForStatementContext forStatement() {
			return getRuleContext(ForStatementContext.class,0);
		}
		public SimpleStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_simpleStatement; }
	}

	public final SimpleStatementContext simpleStatement() throws RecognitionException {
		SimpleStatementContext _localctx = new SimpleStatementContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_simpleStatement);
		int _la;
		try {
			setState(130);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,11,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(95);
				exprStatement();
				setState(97);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==SEMICOLON) {
					{
					setState(96);
					match(SEMICOLON);
					}
				}

				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(99);
				assignment();
				setState(101);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==SEMICOLON) {
					{
					setState(100);
					match(SEMICOLON);
					}
				}

				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(103);
				compoundAssignment();
				setState(105);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==SEMICOLON) {
					{
					setState(104);
					match(SEMICOLON);
					}
				}

				}
				break;
			case 4:
				enterOuterAlt(_localctx, 4);
				{
				setState(107);
				incDecStatement();
				setState(109);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==SEMICOLON) {
					{
					setState(108);
					match(SEMICOLON);
					}
				}

				}
				break;
			case 5:
				enterOuterAlt(_localctx, 5);
				{
				setState(111);
				printStatement();
				setState(113);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==SEMICOLON) {
					{
					setState(112);
					match(SEMICOLON);
					}
				}

				}
				break;
			case 6:
				enterOuterAlt(_localctx, 6);
				{
				setState(115);
				ifStatement();
				}
				break;
			case 7:
				enterOuterAlt(_localctx, 7);
				{
				setState(116);
				whileStatement();
				}
				break;
			case 8:
				enterOuterAlt(_localctx, 8);
				{
				setState(117);
				breakStatement();
				}
				break;
			case 9:
				enterOuterAlt(_localctx, 9);
				{
				setState(118);
				continueStatement();
				}
				break;
			case 10:
				enterOuterAlt(_localctx, 10);
				{
				setState(119);
				switchStatement();
				}
				break;
			case 11:
				enterOuterAlt(_localctx, 11);
				{
				setState(120);
				returnStatement();
				}
				break;
			case 12:
				enterOuterAlt(_localctx, 12);
				{
				setState(121);
				invoke();
				setState(123);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==SEMICOLON) {
					{
					setState(122);
					match(SEMICOLON);
					}
				}

				}
				break;
			case 13:
				enterOuterAlt(_localctx, 13);
				{
				setState(125);
				invokeMethod();
				setState(127);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==SEMICOLON) {
					{
					setState(126);
					match(SEMICOLON);
					}
				}

				}
				break;
			case 14:
				enterOuterAlt(_localctx, 14);
				{
				setState(129);
				forStatement();
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class VarDeclarationContext extends ParserRuleContext {
		public TerminalNode ID() { return getToken(GoLangParser.ID, 0); }
		public TypeContext type() {
			return getRuleContext(TypeContext.class,0);
		}
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public SliceInitContext sliceInit() {
			return getRuleContext(SliceInitContext.class,0);
		}
		public VarDeclarationContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_varDeclaration; }
	}

	public final VarDeclarationContext varDeclaration() throws RecognitionException {
		VarDeclarationContext _localctx = new VarDeclarationContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_varDeclaration);
		int _la;
		try {
			setState(149);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__0:
			case T__1:
				enterOuterAlt(_localctx, 1);
				{
				setState(132);
				_la = _input.LA(1);
				if ( !(_la==T__0 || _la==T__1) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(133);
				match(ID);
				setState(135);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,12,_ctx) ) {
				case 1:
					{
					setState(134);
					type();
					}
					break;
				}
				setState(142);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==T__2) {
					{
					setState(137);
					match(T__2);
					setState(140);
					_errHandler.sync(this);
					switch (_input.LA(1)) {
					case T__5:
					case T__32:
					case T__39:
					case T__40:
					case T__41:
					case T__42:
					case T__43:
					case T__44:
					case T__45:
					case T__46:
					case T__49:
					case T__57:
					case INT:
					case FLOAT:
					case STRING:
					case RUNE:
					case BOOL:
					case ID:
						{
						setState(138);
						expr(0);
						}
						break;
					case T__21:
						{
						setState(139);
						sliceInit();
						}
						break;
					default:
						throw new NoViableAltException(this);
					}
					}
				}

				}
				break;
			case ID:
				enterOuterAlt(_localctx, 2);
				{
				setState(144);
				match(ID);
				setState(145);
				match(T__3);
				{
				setState(146);
				type();
				}
				{
				setState(147);
				sliceInit();
				}
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class FuncDeclarationContext extends ParserRuleContext {
		public TerminalNode ID() { return getToken(GoLangParser.ID, 0); }
		public BlockContext block() {
			return getRuleContext(BlockContext.class,0);
		}
		public FuncParamsContext funcParams() {
			return getRuleContext(FuncParamsContext.class,0);
		}
		public TypeContext type() {
			return getRuleContext(TypeContext.class,0);
		}
		public FuncDeclarationContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_funcDeclaration; }
	}

	public final FuncDeclarationContext funcDeclaration() throws RecognitionException {
		FuncDeclarationContext _localctx = new FuncDeclarationContext(_ctx, getState());
		enterRule(_localctx, 8, RULE_funcDeclaration);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(151);
			match(T__4);
			setState(152);
			match(ID);
			setState(153);
			match(T__5);
			setState(155);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==ID) {
				{
				setState(154);
				funcParams();
				}
			}

			setState(157);
			match(T__6);
			setState(159);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (((((_la - 53)) & ~0x3f) == 0 && ((1L << (_la - 53)) & 2111L) != 0)) {
				{
				setState(158);
				type();
				}
			}

			setState(161);
			block();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class FuncParamsContext extends ParserRuleContext {
		public List<FuncParamContext> funcParam() {
			return getRuleContexts(FuncParamContext.class);
		}
		public FuncParamContext funcParam(int i) {
			return getRuleContext(FuncParamContext.class,i);
		}
		public FuncParamsContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_funcParams; }
	}

	public final FuncParamsContext funcParams() throws RecognitionException {
		FuncParamsContext _localctx = new FuncParamsContext(_ctx, getState());
		enterRule(_localctx, 10, RULE_funcParams);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(163);
			funcParam();
			setState(168);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__7) {
				{
				{
				setState(164);
				match(T__7);
				setState(165);
				funcParam();
				}
				}
				setState(170);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class FuncParamContext extends ParserRuleContext {
		public TerminalNode ID() { return getToken(GoLangParser.ID, 0); }
		public TypeContext type() {
			return getRuleContext(TypeContext.class,0);
		}
		public FuncParamContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_funcParam; }
	}

	public final FuncParamContext funcParam() throws RecognitionException {
		FuncParamContext _localctx = new FuncParamContext(_ctx, getState());
		enterRule(_localctx, 12, RULE_funcParam);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(171);
			match(ID);
			setState(172);
			type();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class InvokeContext extends ParserRuleContext {
		public TerminalNode ID() { return getToken(GoLangParser.ID, 0); }
		public InvokeParamsContext invokeParams() {
			return getRuleContext(InvokeParamsContext.class,0);
		}
		public InvokeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_invoke; }
	}

	public final InvokeContext invoke() throws RecognitionException {
		InvokeContext _localctx = new InvokeContext(_ctx, getState());
		enterRule(_localctx, 14, RULE_invoke);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(174);
			match(ID);
			setState(175);
			match(T__5);
			setState(177);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (((((_la - 6)) & ~0x3f) == 0 && ((1L << (_la - 6)) & 571979125862957057L) != 0)) {
				{
				setState(176);
				invokeParams();
				}
			}

			setState(179);
			match(T__6);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class InvokeParamsContext extends ParserRuleContext {
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public InvokeParamsContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_invokeParams; }
	}

	public final InvokeParamsContext invokeParams() throws RecognitionException {
		InvokeParamsContext _localctx = new InvokeParamsContext(_ctx, getState());
		enterRule(_localctx, 16, RULE_invokeParams);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(181);
			expr(0);
			setState(186);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__7) {
				{
				{
				setState(182);
				match(T__7);
				setState(183);
				expr(0);
				}
				}
				setState(188);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class InvokeMethodContext extends ParserRuleContext {
		public List<TerminalNode> ID() { return getTokens(GoLangParser.ID); }
		public TerminalNode ID(int i) {
			return getToken(GoLangParser.ID, i);
		}
		public InvokeParamsContext invokeParams() {
			return getRuleContext(InvokeParamsContext.class,0);
		}
		public InvokeMethodContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_invokeMethod; }
	}

	public final InvokeMethodContext invokeMethod() throws RecognitionException {
		InvokeMethodContext _localctx = new InvokeMethodContext(_ctx, getState());
		enterRule(_localctx, 18, RULE_invokeMethod);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(189);
			match(ID);
			setState(190);
			match(T__8);
			setState(191);
			match(ID);
			setState(192);
			match(T__5);
			setState(194);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (((((_la - 6)) & ~0x3f) == 0 && ((1L << (_la - 6)) & 571979125862957057L) != 0)) {
				{
				setState(193);
				invokeParams();
				}
			}

			setState(196);
			match(T__6);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class ImplicitDeclarationContext extends ParserRuleContext {
		public TerminalNode ID() { return getToken(GoLangParser.ID, 0); }
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public SliceInitContext sliceInit() {
			return getRuleContext(SliceInitContext.class,0);
		}
		public ImplicitDeclarationContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_implicitDeclaration; }
	}

	public final ImplicitDeclarationContext implicitDeclaration() throws RecognitionException {
		ImplicitDeclarationContext _localctx = new ImplicitDeclarationContext(_ctx, getState());
		enterRule(_localctx, 20, RULE_implicitDeclaration);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(198);
			match(ID);
			setState(199);
			match(T__3);
			setState(202);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__5:
			case T__32:
			case T__39:
			case T__40:
			case T__41:
			case T__42:
			case T__43:
			case T__44:
			case T__45:
			case T__46:
			case T__49:
			case T__57:
			case INT:
			case FLOAT:
			case STRING:
			case RUNE:
			case BOOL:
			case ID:
				{
				setState(200);
				expr(0);
				}
				break;
			case T__21:
				{
				setState(201);
				sliceInit();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class AssignmentContext extends ParserRuleContext {
		public TerminalNode ID() { return getToken(GoLangParser.ID, 0); }
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public SliceInitContext sliceInit() {
			return getRuleContext(SliceInitContext.class,0);
		}
		public AssignmentContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_assignment; }
	}

	public final AssignmentContext assignment() throws RecognitionException {
		AssignmentContext _localctx = new AssignmentContext(_ctx, getState());
		enterRule(_localctx, 22, RULE_assignment);
		try {
			setState(217);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,24,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(204);
				match(ID);
				setState(205);
				match(T__2);
				setState(208);
				_errHandler.sync(this);
				switch (_input.LA(1)) {
				case T__5:
				case T__32:
				case T__39:
				case T__40:
				case T__41:
				case T__42:
				case T__43:
				case T__44:
				case T__45:
				case T__46:
				case T__49:
				case T__57:
				case INT:
				case FLOAT:
				case STRING:
				case RUNE:
				case BOOL:
				case ID:
					{
					setState(206);
					expr(0);
					}
					break;
				case T__21:
					{
					setState(207);
					sliceInit();
					}
					break;
				default:
					throw new NoViableAltException(this);
				}
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(210);
				expr(0);
				setState(211);
				match(T__9);
				setState(212);
				expr(0);
				setState(213);
				match(T__10);
				setState(214);
				match(T__2);
				setState(215);
				expr(0);
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class CompoundAssignmentContext extends ParserRuleContext {
		public Token op;
		public TerminalNode ID() { return getToken(GoLangParser.ID, 0); }
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public CompoundAssignmentContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_compoundAssignment; }
	}

	public final CompoundAssignmentContext compoundAssignment() throws RecognitionException {
		CompoundAssignmentContext _localctx = new CompoundAssignmentContext(_ctx, getState());
		enterRule(_localctx, 24, RULE_compoundAssignment);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(219);
			match(ID);
			setState(220);
			((CompoundAssignmentContext)_localctx).op = _input.LT(1);
			_la = _input.LA(1);
			if ( !(_la==T__11 || _la==T__12) ) {
				((CompoundAssignmentContext)_localctx).op = (Token)_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			setState(221);
			expr(0);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class IncDecStatementContext extends ParserRuleContext {
		public Token op;
		public TerminalNode ID() { return getToken(GoLangParser.ID, 0); }
		public IncDecStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_incDecStatement; }
	}

	public final IncDecStatementContext incDecStatement() throws RecognitionException {
		IncDecStatementContext _localctx = new IncDecStatementContext(_ctx, getState());
		enterRule(_localctx, 26, RULE_incDecStatement);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(223);
			match(ID);
			setState(224);
			((IncDecStatementContext)_localctx).op = _input.LT(1);
			_la = _input.LA(1);
			if ( !(_la==T__13 || _la==T__14) ) {
				((IncDecStatementContext)_localctx).op = (Token)_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class ExprStatementContext extends ParserRuleContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public ExprStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_exprStatement; }
	}

	public final ExprStatementContext exprStatement() throws RecognitionException {
		ExprStatementContext _localctx = new ExprStatementContext(_ctx, getState());
		enterRule(_localctx, 28, RULE_exprStatement);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(226);
			expr(0);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class IfStatementContext extends ParserRuleContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public BlockContext block() {
			return getRuleContext(BlockContext.class,0);
		}
		public SimpleStatementContext simpleStatement() {
			return getRuleContext(SimpleStatementContext.class,0);
		}
		public ElseBlockContext elseBlock() {
			return getRuleContext(ElseBlockContext.class,0);
		}
		public IfStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_ifStatement; }
	}

	public final IfStatementContext ifStatement() throws RecognitionException {
		IfStatementContext _localctx = new IfStatementContext(_ctx, getState());
		enterRule(_localctx, 30, RULE_ifStatement);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(228);
			match(T__15);
			setState(229);
			expr(0);
			setState(232);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__21:
				{
				setState(230);
				block();
				}
				break;
			case T__5:
			case T__15:
			case T__17:
			case T__18:
			case T__19:
			case T__20:
			case T__23:
			case T__32:
			case T__39:
			case T__40:
			case T__41:
			case T__42:
			case T__43:
			case T__44:
			case T__45:
			case T__46:
			case T__49:
			case T__50:
			case T__51:
			case T__57:
			case INT:
			case FLOAT:
			case STRING:
			case RUNE:
			case BOOL:
			case ID:
				{
				setState(231);
				simpleStatement();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			setState(236);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,26,_ctx) ) {
			case 1:
				{
				setState(234);
				match(T__16);
				setState(235);
				elseBlock();
				}
				break;
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class WhileStatementContext extends ParserRuleContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public BlockContext block() {
			return getRuleContext(BlockContext.class,0);
		}
		public SimpleStatementContext simpleStatement() {
			return getRuleContext(SimpleStatementContext.class,0);
		}
		public WhileStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_whileStatement; }
	}

	public final WhileStatementContext whileStatement() throws RecognitionException {
		WhileStatementContext _localctx = new WhileStatementContext(_ctx, getState());
		enterRule(_localctx, 32, RULE_whileStatement);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(238);
			match(T__17);
			setState(239);
			expr(0);
			setState(242);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__21:
				{
				setState(240);
				block();
				}
				break;
			case T__5:
			case T__15:
			case T__17:
			case T__18:
			case T__19:
			case T__20:
			case T__23:
			case T__32:
			case T__39:
			case T__40:
			case T__41:
			case T__42:
			case T__43:
			case T__44:
			case T__45:
			case T__46:
			case T__49:
			case T__50:
			case T__51:
			case T__57:
			case INT:
			case FLOAT:
			case STRING:
			case RUNE:
			case BOOL:
			case ID:
				{
				setState(241);
				simpleStatement();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class BreakStatementContext extends ParserRuleContext {
		public TerminalNode SEMICOLON() { return getToken(GoLangParser.SEMICOLON, 0); }
		public BreakStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_breakStatement; }
	}

	public final BreakStatementContext breakStatement() throws RecognitionException {
		BreakStatementContext _localctx = new BreakStatementContext(_ctx, getState());
		enterRule(_localctx, 34, RULE_breakStatement);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(244);
			match(T__18);
			setState(246);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==SEMICOLON) {
				{
				setState(245);
				match(SEMICOLON);
				}
			}

			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class ContinueStatementContext extends ParserRuleContext {
		public TerminalNode SEMICOLON() { return getToken(GoLangParser.SEMICOLON, 0); }
		public ContinueStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_continueStatement; }
	}

	public final ContinueStatementContext continueStatement() throws RecognitionException {
		ContinueStatementContext _localctx = new ContinueStatementContext(_ctx, getState());
		enterRule(_localctx, 36, RULE_continueStatement);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(248);
			match(T__19);
			setState(250);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==SEMICOLON) {
				{
				setState(249);
				match(SEMICOLON);
				}
			}

			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class SwitchStatementContext extends ParserRuleContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public List<CaseStatementContext> caseStatement() {
			return getRuleContexts(CaseStatementContext.class);
		}
		public CaseStatementContext caseStatement(int i) {
			return getRuleContext(CaseStatementContext.class,i);
		}
		public DefaultCaseContext defaultCase() {
			return getRuleContext(DefaultCaseContext.class,0);
		}
		public SwitchStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_switchStatement; }
	}

	public final SwitchStatementContext switchStatement() throws RecognitionException {
		SwitchStatementContext _localctx = new SwitchStatementContext(_ctx, getState());
		enterRule(_localctx, 38, RULE_switchStatement);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(252);
			match(T__20);
			setState(253);
			expr(0);
			setState(254);
			match(T__21);
			setState(258);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__25) {
				{
				{
				setState(255);
				caseStatement();
				}
				}
				setState(260);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(262);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==T__27) {
				{
				setState(261);
				defaultCase();
				}
			}

			setState(264);
			match(T__22);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class ForStatementContext extends ParserRuleContext {
		public BlockContext block() {
			return getRuleContext(BlockContext.class,0);
		}
		public ForConditionContext forCondition() {
			return getRuleContext(ForConditionContext.class,0);
		}
		public ForClauseContext forClause() {
			return getRuleContext(ForClauseContext.class,0);
		}
		public ForRangeContext forRange() {
			return getRuleContext(ForRangeContext.class,0);
		}
		public ForStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_forStatement; }
	}

	public final ForStatementContext forStatement() throws RecognitionException {
		ForStatementContext _localctx = new ForStatementContext(_ctx, getState());
		enterRule(_localctx, 40, RULE_forStatement);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(266);
			match(T__23);
			setState(270);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,32,_ctx) ) {
			case 1:
				{
				setState(267);
				forCondition();
				}
				break;
			case 2:
				{
				setState(268);
				forClause();
				}
				break;
			case 3:
				{
				setState(269);
				forRange();
				}
				break;
			}
			setState(272);
			block();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class ForConditionContext extends ParserRuleContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public ForConditionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_forCondition; }
	}

	public final ForConditionContext forCondition() throws RecognitionException {
		ForConditionContext _localctx = new ForConditionContext(_ctx, getState());
		enterRule(_localctx, 42, RULE_forCondition);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(274);
			expr(0);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class ForClauseContext extends ParserRuleContext {
		public List<TerminalNode> SEMICOLON() { return getTokens(GoLangParser.SEMICOLON); }
		public TerminalNode SEMICOLON(int i) {
			return getToken(GoLangParser.SEMICOLON, i);
		}
		public InitStmtContext initStmt() {
			return getRuleContext(InitStmtContext.class,0);
		}
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public PostStmtContext postStmt() {
			return getRuleContext(PostStmtContext.class,0);
		}
		public ForClauseContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_forClause; }
	}

	public final ForClauseContext forClause() throws RecognitionException {
		ForClauseContext _localctx = new ForClauseContext(_ctx, getState());
		enterRule(_localctx, 44, RULE_forClause);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(279);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,33,_ctx) ) {
			case 1:
				{
				setState(276);
				initStmt();
				setState(277);
				match(SEMICOLON);
				}
				break;
			}
			setState(282);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (((((_la - 6)) & ~0x3f) == 0 && ((1L << (_la - 6)) & 571979125862957057L) != 0)) {
				{
				setState(281);
				expr(0);
				}
			}

			setState(284);
			match(SEMICOLON);
			setState(289);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (((((_la - 6)) & ~0x3f) == 0 && ((1L << (_la - 6)) & 571979125862957057L) != 0)) {
				{
				setState(285);
				postStmt();
				setState(287);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==SEMICOLON) {
					{
					setState(286);
					match(SEMICOLON);
					}
				}

				}
			}

			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class ForRangeContext extends ParserRuleContext {
		public List<TerminalNode> ID() { return getTokens(GoLangParser.ID); }
		public TerminalNode ID(int i) {
			return getToken(GoLangParser.ID, i);
		}
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public ForRangeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_forRange; }
	}

	public final ForRangeContext forRange() throws RecognitionException {
		ForRangeContext _localctx = new ForRangeContext(_ctx, getState());
		enterRule(_localctx, 46, RULE_forRange);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(291);
			match(ID);
			setState(294);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==T__7) {
				{
				setState(292);
				match(T__7);
				setState(293);
				match(ID);
				}
			}

			setState(296);
			match(T__3);
			setState(297);
			match(T__24);
			setState(298);
			expr(0);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class InitStmtContext extends ParserRuleContext {
		public VarDeclarationContext varDeclaration() {
			return getRuleContext(VarDeclarationContext.class,0);
		}
		public ImplicitDeclarationContext implicitDeclaration() {
			return getRuleContext(ImplicitDeclarationContext.class,0);
		}
		public AssignmentContext assignment() {
			return getRuleContext(AssignmentContext.class,0);
		}
		public CompoundAssignmentContext compoundAssignment() {
			return getRuleContext(CompoundAssignmentContext.class,0);
		}
		public InitStmtContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_initStmt; }
	}

	public final InitStmtContext initStmt() throws RecognitionException {
		InitStmtContext _localctx = new InitStmtContext(_ctx, getState());
		enterRule(_localctx, 48, RULE_initStmt);
		try {
			setState(304);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,38,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(300);
				varDeclaration();
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(301);
				implicitDeclaration();
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(302);
				assignment();
				}
				break;
			case 4:
				enterOuterAlt(_localctx, 4);
				{
				setState(303);
				compoundAssignment();
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class PostStmtContext extends ParserRuleContext {
		public AssignmentContext assignment() {
			return getRuleContext(AssignmentContext.class,0);
		}
		public CompoundAssignmentContext compoundAssignment() {
			return getRuleContext(CompoundAssignmentContext.class,0);
		}
		public IncDecStatementContext incDecStatement() {
			return getRuleContext(IncDecStatementContext.class,0);
		}
		public PostStmtContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_postStmt; }
	}

	public final PostStmtContext postStmt() throws RecognitionException {
		PostStmtContext _localctx = new PostStmtContext(_ctx, getState());
		enterRule(_localctx, 50, RULE_postStmt);
		try {
			setState(309);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,39,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(306);
				assignment();
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(307);
				compoundAssignment();
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(308);
				incDecStatement();
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class CaseStatementContext extends ParserRuleContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public List<StatementContext> statement() {
			return getRuleContexts(StatementContext.class);
		}
		public StatementContext statement(int i) {
			return getRuleContext(StatementContext.class,i);
		}
		public CaseStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_caseStatement; }
	}

	public final CaseStatementContext caseStatement() throws RecognitionException {
		CaseStatementContext _localctx = new CaseStatementContext(_ctx, getState());
		enterRule(_localctx, 52, RULE_caseStatement);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(311);
			match(T__25);
			setState(312);
			expr(0);
			setState(313);
			match(T__26);
			setState(317);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (((((_la - 1)) & ~0x3f) == 0 && ((1L << (_la - 1)) & -140034346364010445L) != 0)) {
				{
				{
				setState(314);
				statement();
				}
				}
				setState(319);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class DefaultCaseContext extends ParserRuleContext {
		public List<StatementContext> statement() {
			return getRuleContexts(StatementContext.class);
		}
		public StatementContext statement(int i) {
			return getRuleContext(StatementContext.class,i);
		}
		public DefaultCaseContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_defaultCase; }
	}

	public final DefaultCaseContext defaultCase() throws RecognitionException {
		DefaultCaseContext _localctx = new DefaultCaseContext(_ctx, getState());
		enterRule(_localctx, 54, RULE_defaultCase);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(320);
			match(T__27);
			setState(321);
			match(T__26);
			setState(325);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (((((_la - 1)) & ~0x3f) == 0 && ((1L << (_la - 1)) & -140034346364010445L) != 0)) {
				{
				{
				setState(322);
				statement();
				}
				}
				setState(327);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class BlockContext extends ParserRuleContext {
		public List<StatementContext> statement() {
			return getRuleContexts(StatementContext.class);
		}
		public StatementContext statement(int i) {
			return getRuleContext(StatementContext.class,i);
		}
		public BlockContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_block; }
	}

	public final BlockContext block() throws RecognitionException {
		BlockContext _localctx = new BlockContext(_ctx, getState());
		enterRule(_localctx, 56, RULE_block);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(328);
			match(T__21);
			setState(332);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (((((_la - 1)) & ~0x3f) == 0 && ((1L << (_la - 1)) & -140034346364010445L) != 0)) {
				{
				{
				setState(329);
				statement();
				}
				}
				setState(334);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(335);
			match(T__22);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class ElseBlockContext extends ParserRuleContext {
		public IfStatementContext ifStatement() {
			return getRuleContext(IfStatementContext.class,0);
		}
		public BlockContext block() {
			return getRuleContext(BlockContext.class,0);
		}
		public SimpleStatementContext simpleStatement() {
			return getRuleContext(SimpleStatementContext.class,0);
		}
		public ElseBlockContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_elseBlock; }
	}

	public final ElseBlockContext elseBlock() throws RecognitionException {
		ElseBlockContext _localctx = new ElseBlockContext(_ctx, getState());
		enterRule(_localctx, 58, RULE_elseBlock);
		try {
			setState(340);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,43,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(337);
				ifStatement();
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(338);
				block();
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(339);
				simpleStatement();
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class ExprContext extends ParserRuleContext {
		public ExprContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_expr; }
	 
		public ExprContext() { }
		public void copyFrom(ExprContext ctx) {
			super.copyFrom(ctx);
		}
	}
	@SuppressWarnings("CheckReturnValue")
	public static class SlicesIndexContext extends ExprContext {
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public SlicesIndexContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class VariableContext extends ExprContext {
		public TerminalNode ID() { return getToken(GoLangParser.ID, 0); }
		public VariableContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class OrContext extends ExprContext {
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public OrContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class MulDivContext extends ExprContext {
		public Token op;
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public MulDivContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class StringsJoinContext extends ExprContext {
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public StringsJoinContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class ParensContext extends ExprContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public ParensContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class InvokeLiteralContext extends ExprContext {
		public InvokeContext invoke() {
			return getRuleContext(InvokeContext.class,0);
		}
		public InvokeLiteralContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class StringContext extends ExprContext {
		public TerminalNode STRING() { return getToken(GoLangParser.STRING, 0); }
		public StringContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class TypedSliceInitContext extends ExprContext {
		public ArrayTypeContext arrayType() {
			return getRuleContext(ArrayTypeContext.class,0);
		}
		public SliceInitContext sliceInit() {
			return getRuleContext(SliceInitContext.class,0);
		}
		public TypedSliceInitContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class StrconvAtoiContext extends ExprContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public StrconvAtoiContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class NumberContext extends ExprContext {
		public TerminalNode INT() { return getToken(GoLangParser.INT, 0); }
		public NumberContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class ComparisonContext extends ExprContext {
		public Token op;
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public ComparisonContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class EqualityContext extends ExprContext {
		public Token op;
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public EqualityContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class BooleanContext extends ExprContext {
		public TerminalNode BOOL() { return getToken(GoLangParser.BOOL, 0); }
		public BooleanContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class StrconvParseFloatContext extends ExprContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public StrconvParseFloatContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class InvokeMethodLiteralContext extends ExprContext {
		public InvokeMethodContext invokeMethod() {
			return getRuleContext(InvokeMethodContext.class,0);
		}
		public InvokeMethodLiteralContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class AddSubContext extends ExprContext {
		public Token op;
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public AddSubContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class IndexAccessContext extends ExprContext {
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public IndexAccessContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class ReflectTypeOfContext extends ExprContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public ReflectTypeOfContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class NilContext extends ExprContext {
		public NilContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class NegContext extends ExprContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public NegContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class FloatContext extends ExprContext {
		public TerminalNode FLOAT() { return getToken(GoLangParser.FLOAT, 0); }
		public FloatContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class NotContext extends ExprContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public NotContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class AppendContext extends ExprContext {
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public SliceInitContext sliceInit() {
			return getRuleContext(SliceInitContext.class,0);
		}
		public AppendContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class LenContext extends ExprContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public LenContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class AndContext extends ExprContext {
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public AndContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class FieldAccessContext extends ExprContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public TerminalNode ID() { return getToken(GoLangParser.ID, 0); }
		public FieldAccessContext(ExprContext ctx) { copyFrom(ctx); }
	}
	@SuppressWarnings("CheckReturnValue")
	public static class RuneContext extends ExprContext {
		public TerminalNode RUNE() { return getToken(GoLangParser.RUNE, 0); }
		public RuneContext(ExprContext ctx) { copyFrom(ctx); }
	}

	public final ExprContext expr() throws RecognitionException {
		return expr(0);
	}

	private ExprContext expr(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		ExprContext _localctx = new ExprContext(_ctx, _parentState);
		ExprContext _prevctx = _localctx;
		int _startState = 60;
		enterRecursionRule(_localctx, 60, RULE_expr, _p);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(407);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,45,_ctx) ) {
			case 1:
				{
				_localctx = new NotContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;

				setState(343);
				match(T__39);
				setState(344);
				expr(23);
				}
				break;
			case 2:
				{
				_localctx = new NegContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(345);
				match(T__32);
				setState(346);
				expr(22);
				}
				break;
			case 3:
				{
				_localctx = new LenContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(347);
				match(T__40);
				setState(348);
				match(T__5);
				setState(349);
				expr(0);
				setState(350);
				match(T__6);
				}
				break;
			case 4:
				{
				_localctx = new AppendContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(352);
				match(T__41);
				setState(353);
				match(T__5);
				setState(354);
				expr(0);
				setState(355);
				match(T__7);
				setState(358);
				_errHandler.sync(this);
				switch (_input.LA(1)) {
				case T__5:
				case T__32:
				case T__39:
				case T__40:
				case T__41:
				case T__42:
				case T__43:
				case T__44:
				case T__45:
				case T__46:
				case T__49:
				case T__57:
				case INT:
				case FLOAT:
				case STRING:
				case RUNE:
				case BOOL:
				case ID:
					{
					setState(356);
					expr(0);
					}
					break;
				case T__21:
					{
					setState(357);
					sliceInit();
					}
					break;
				default:
					throw new NoViableAltException(this);
				}
				setState(360);
				match(T__6);
				}
				break;
			case 5:
				{
				_localctx = new StringsJoinContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(362);
				match(T__42);
				setState(363);
				match(T__5);
				setState(364);
				expr(0);
				setState(365);
				match(T__7);
				setState(366);
				expr(0);
				setState(367);
				match(T__6);
				}
				break;
			case 6:
				{
				_localctx = new SlicesIndexContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(369);
				match(T__43);
				setState(370);
				match(T__5);
				setState(371);
				expr(0);
				setState(372);
				match(T__7);
				setState(373);
				expr(0);
				setState(374);
				match(T__6);
				}
				break;
			case 7:
				{
				_localctx = new StrconvAtoiContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(376);
				match(T__44);
				setState(377);
				match(T__5);
				setState(378);
				expr(0);
				setState(379);
				match(T__6);
				}
				break;
			case 8:
				{
				_localctx = new StrconvParseFloatContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(381);
				match(T__45);
				setState(382);
				match(T__5);
				setState(383);
				expr(0);
				setState(384);
				match(T__6);
				}
				break;
			case 9:
				{
				_localctx = new ReflectTypeOfContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(386);
				match(T__46);
				setState(387);
				match(T__5);
				setState(388);
				expr(0);
				setState(389);
				match(T__6);
				}
				break;
			case 10:
				{
				_localctx = new NumberContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(391);
				match(INT);
				}
				break;
			case 11:
				{
				_localctx = new FloatContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(392);
				match(FLOAT);
				}
				break;
			case 12:
				{
				_localctx = new StringContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(393);
				match(STRING);
				}
				break;
			case 13:
				{
				_localctx = new RuneContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(394);
				match(RUNE);
				}
				break;
			case 14:
				{
				_localctx = new InvokeLiteralContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(395);
				invoke();
				}
				break;
			case 15:
				{
				_localctx = new InvokeMethodLiteralContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(396);
				invokeMethod();
				}
				break;
			case 16:
				{
				_localctx = new BooleanContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(397);
				match(BOOL);
				}
				break;
			case 17:
				{
				_localctx = new NilContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(398);
				match(T__49);
				}
				break;
			case 18:
				{
				_localctx = new VariableContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(399);
				match(ID);
				}
				break;
			case 19:
				{
				_localctx = new ParensContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(400);
				match(T__5);
				setState(401);
				expr(0);
				setState(402);
				match(T__6);
				}
				break;
			case 20:
				{
				_localctx = new TypedSliceInitContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(404);
				arrayType();
				setState(405);
				sliceInit();
				}
				break;
			}
			_ctx.stop = _input.LT(-1);
			setState(437);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,47,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					setState(435);
					_errHandler.sync(this);
					switch ( getInterpreter().adaptivePredict(_input,46,_ctx) ) {
					case 1:
						{
						_localctx = new MulDivContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(409);
						if (!(precpred(_ctx, 27))) throw new FailedPredicateException(this, "precpred(_ctx, 27)");
						setState(410);
						((MulDivContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & 3758096384L) != 0)) ) {
							((MulDivContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(411);
						expr(28);
						}
						break;
					case 2:
						{
						_localctx = new AddSubContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(412);
						if (!(precpred(_ctx, 26))) throw new FailedPredicateException(this, "precpred(_ctx, 26)");
						setState(413);
						((AddSubContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !(_la==T__31 || _la==T__32) ) {
							((AddSubContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(414);
						expr(27);
						}
						break;
					case 3:
						{
						_localctx = new EqualityContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(415);
						if (!(precpred(_ctx, 25))) throw new FailedPredicateException(this, "precpred(_ctx, 25)");
						setState(416);
						((EqualityContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !(_la==T__33 || _la==T__34) ) {
							((EqualityContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(417);
						expr(26);
						}
						break;
					case 4:
						{
						_localctx = new ComparisonContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(418);
						if (!(precpred(_ctx, 24))) throw new FailedPredicateException(this, "precpred(_ctx, 24)");
						setState(419);
						((ComparisonContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & 1030792151040L) != 0)) ) {
							((ComparisonContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(420);
						expr(25);
						}
						break;
					case 5:
						{
						_localctx = new AndContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(421);
						if (!(precpred(_ctx, 13))) throw new FailedPredicateException(this, "precpred(_ctx, 13)");
						setState(422);
						match(T__47);
						setState(423);
						expr(14);
						}
						break;
					case 6:
						{
						_localctx = new OrContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(424);
						if (!(precpred(_ctx, 12))) throw new FailedPredicateException(this, "precpred(_ctx, 12)");
						setState(425);
						match(T__48);
						setState(426);
						expr(13);
						}
						break;
					case 7:
						{
						_localctx = new FieldAccessContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(427);
						if (!(precpred(_ctx, 28))) throw new FailedPredicateException(this, "precpred(_ctx, 28)");
						setState(428);
						match(T__8);
						setState(429);
						match(ID);
						}
						break;
					case 8:
						{
						_localctx = new IndexAccessContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(430);
						if (!(precpred(_ctx, 14))) throw new FailedPredicateException(this, "precpred(_ctx, 14)");
						setState(431);
						match(T__9);
						setState(432);
						expr(0);
						setState(433);
						match(T__10);
						}
						break;
					}
					} 
				}
				setState(439);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,47,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class SliceInitContext extends ParserRuleContext {
		public ExprListContext exprList() {
			return getRuleContext(ExprListContext.class,0);
		}
		public NestedSliceInitContext nestedSliceInit() {
			return getRuleContext(NestedSliceInitContext.class,0);
		}
		public SliceInitContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_sliceInit; }
	}

	public final SliceInitContext sliceInit() throws RecognitionException {
		SliceInitContext _localctx = new SliceInitContext(_ctx, getState());
		enterRule(_localctx, 62, RULE_sliceInit);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(440);
			match(T__21);
			setState(443);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__5:
			case T__32:
			case T__39:
			case T__40:
			case T__41:
			case T__42:
			case T__43:
			case T__44:
			case T__45:
			case T__46:
			case T__49:
			case T__57:
			case INT:
			case FLOAT:
			case STRING:
			case RUNE:
			case BOOL:
			case ID:
				{
				setState(441);
				exprList();
				}
				break;
			case T__21:
				{
				setState(442);
				nestedSliceInit();
				}
				break;
			case T__22:
				break;
			default:
				break;
			}
			setState(445);
			match(T__22);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class NestedSliceInitContext extends ParserRuleContext {
		public List<SliceInitContext> sliceInit() {
			return getRuleContexts(SliceInitContext.class);
		}
		public SliceInitContext sliceInit(int i) {
			return getRuleContext(SliceInitContext.class,i);
		}
		public NestedSliceInitContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_nestedSliceInit; }
	}

	public final NestedSliceInitContext nestedSliceInit() throws RecognitionException {
		NestedSliceInitContext _localctx = new NestedSliceInitContext(_ctx, getState());
		enterRule(_localctx, 64, RULE_nestedSliceInit);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(447);
			sliceInit();
			setState(452);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,49,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					{
					{
					setState(448);
					match(T__7);
					setState(449);
					sliceInit();
					}
					} 
				}
				setState(454);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,49,_ctx);
			}
			setState(456);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==T__7) {
				{
				setState(455);
				match(T__7);
				}
			}

			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class PrintStatementContext extends ParserRuleContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public PrintStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_printStatement; }
	}

	public final PrintStatementContext printStatement() throws RecognitionException {
		PrintStatementContext _localctx = new PrintStatementContext(_ctx, getState());
		enterRule(_localctx, 66, RULE_printStatement);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(458);
			match(T__50);
			setState(459);
			match(T__5);
			setState(460);
			expr(0);
			setState(461);
			match(T__6);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class ReturnStatementContext extends ParserRuleContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public TerminalNode SEMICOLON() { return getToken(GoLangParser.SEMICOLON, 0); }
		public ReturnStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_returnStatement; }
	}

	public final ReturnStatementContext returnStatement() throws RecognitionException {
		ReturnStatementContext _localctx = new ReturnStatementContext(_ctx, getState());
		enterRule(_localctx, 68, RULE_returnStatement);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(463);
			match(T__51);
			setState(465);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,51,_ctx) ) {
			case 1:
				{
				setState(464);
				expr(0);
				}
				break;
			}
			setState(468);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==SEMICOLON) {
				{
				setState(467);
				match(SEMICOLON);
				}
			}

			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class TypeContext extends ParserRuleContext {
		public BaseTypeContext baseType() {
			return getRuleContext(BaseTypeContext.class,0);
		}
		public ArrayTypeContext arrayType() {
			return getRuleContext(ArrayTypeContext.class,0);
		}
		public TypeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_type; }
	}

	public final TypeContext type() throws RecognitionException {
		TypeContext _localctx = new TypeContext(_ctx, getState());
		enterRule(_localctx, 70, RULE_type);
		try {
			setState(472);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__52:
			case T__53:
			case T__54:
			case T__55:
			case T__56:
			case ID:
				enterOuterAlt(_localctx, 1);
				{
				setState(470);
				baseType();
				}
				break;
			case T__57:
				enterOuterAlt(_localctx, 2);
				{
				setState(471);
				arrayType();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class BaseTypeContext extends ParserRuleContext {
		public TerminalNode ID() { return getToken(GoLangParser.ID, 0); }
		public BaseTypeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_baseType; }
	}

	public final BaseTypeContext baseType() throws RecognitionException {
		BaseTypeContext _localctx = new BaseTypeContext(_ctx, getState());
		enterRule(_localctx, 72, RULE_baseType);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(474);
			_la = _input.LA(1);
			if ( !(((((_la - 53)) & ~0x3f) == 0 && ((1L << (_la - 53)) & 2079L) != 0)) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class ArrayTypeContext extends ParserRuleContext {
		public ArrayTypeContext arrayType() {
			return getRuleContext(ArrayTypeContext.class,0);
		}
		public BaseTypeContext baseType() {
			return getRuleContext(BaseTypeContext.class,0);
		}
		public ArrayTypeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_arrayType; }
	}

	public final ArrayTypeContext arrayType() throws RecognitionException {
		ArrayTypeContext _localctx = new ArrayTypeContext(_ctx, getState());
		enterRule(_localctx, 74, RULE_arrayType);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(476);
			match(T__57);
			setState(479);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__57:
				{
				setState(477);
				arrayType();
				}
				break;
			case T__52:
			case T__53:
			case T__54:
			case T__55:
			case T__56:
			case ID:
				{
				setState(478);
				baseType();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class ExprListContext extends ParserRuleContext {
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public ExprListContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_exprList; }
	}

	public final ExprListContext exprList() throws RecognitionException {
		ExprListContext _localctx = new ExprListContext(_ctx, getState());
		enterRule(_localctx, 76, RULE_exprList);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(481);
			expr(0);
			setState(486);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,55,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					{
					{
					setState(482);
					match(T__7);
					setState(483);
					expr(0);
					}
					} 
				}
				setState(488);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,55,_ctx);
			}
			setState(490);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==T__7) {
				{
				setState(489);
				match(T__7);
				}
			}

			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public boolean sempred(RuleContext _localctx, int ruleIndex, int predIndex) {
		switch (ruleIndex) {
		case 30:
			return expr_sempred((ExprContext)_localctx, predIndex);
		}
		return true;
	}
	private boolean expr_sempred(ExprContext _localctx, int predIndex) {
		switch (predIndex) {
		case 0:
			return precpred(_ctx, 27);
		case 1:
			return precpred(_ctx, 26);
		case 2:
			return precpred(_ctx, 25);
		case 3:
			return precpred(_ctx, 24);
		case 4:
			return precpred(_ctx, 13);
		case 5:
			return precpred(_ctx, 12);
		case 6:
			return precpred(_ctx, 28);
		case 7:
			return precpred(_ctx, 14);
		}
		return true;
	}

	public static final String _serializedATN =
		"\u0004\u0001D\u01ed\u0002\u0000\u0007\u0000\u0002\u0001\u0007\u0001\u0002"+
		"\u0002\u0007\u0002\u0002\u0003\u0007\u0003\u0002\u0004\u0007\u0004\u0002"+
		"\u0005\u0007\u0005\u0002\u0006\u0007\u0006\u0002\u0007\u0007\u0007\u0002"+
		"\b\u0007\b\u0002\t\u0007\t\u0002\n\u0007\n\u0002\u000b\u0007\u000b\u0002"+
		"\f\u0007\f\u0002\r\u0007\r\u0002\u000e\u0007\u000e\u0002\u000f\u0007\u000f"+
		"\u0002\u0010\u0007\u0010\u0002\u0011\u0007\u0011\u0002\u0012\u0007\u0012"+
		"\u0002\u0013\u0007\u0013\u0002\u0014\u0007\u0014\u0002\u0015\u0007\u0015"+
		"\u0002\u0016\u0007\u0016\u0002\u0017\u0007\u0017\u0002\u0018\u0007\u0018"+
		"\u0002\u0019\u0007\u0019\u0002\u001a\u0007\u001a\u0002\u001b\u0007\u001b"+
		"\u0002\u001c\u0007\u001c\u0002\u001d\u0007\u001d\u0002\u001e\u0007\u001e"+
		"\u0002\u001f\u0007\u001f\u0002 \u0007 \u0002!\u0007!\u0002\"\u0007\"\u0002"+
		"#\u0007#\u0002$\u0007$\u0002%\u0007%\u0002&\u0007&\u0001\u0000\u0004\u0000"+
		"P\b\u0000\u000b\u0000\f\u0000Q\u0001\u0001\u0001\u0001\u0003\u0001V\b"+
		"\u0001\u0001\u0001\u0001\u0001\u0003\u0001Z\b\u0001\u0001\u0001\u0001"+
		"\u0001\u0003\u0001^\b\u0001\u0001\u0002\u0001\u0002\u0003\u0002b\b\u0002"+
		"\u0001\u0002\u0001\u0002\u0003\u0002f\b\u0002\u0001\u0002\u0001\u0002"+
		"\u0003\u0002j\b\u0002\u0001\u0002\u0001\u0002\u0003\u0002n\b\u0002\u0001"+
		"\u0002\u0001\u0002\u0003\u0002r\b\u0002\u0001\u0002\u0001\u0002\u0001"+
		"\u0002\u0001\u0002\u0001\u0002\u0001\u0002\u0001\u0002\u0001\u0002\u0003"+
		"\u0002|\b\u0002\u0001\u0002\u0001\u0002\u0003\u0002\u0080\b\u0002\u0001"+
		"\u0002\u0003\u0002\u0083\b\u0002\u0001\u0003\u0001\u0003\u0001\u0003\u0003"+
		"\u0003\u0088\b\u0003\u0001\u0003\u0001\u0003\u0001\u0003\u0003\u0003\u008d"+
		"\b\u0003\u0003\u0003\u008f\b\u0003\u0001\u0003\u0001\u0003\u0001\u0003"+
		"\u0001\u0003\u0001\u0003\u0003\u0003\u0096\b\u0003\u0001\u0004\u0001\u0004"+
		"\u0001\u0004\u0001\u0004\u0003\u0004\u009c\b\u0004\u0001\u0004\u0001\u0004"+
		"\u0003\u0004\u00a0\b\u0004\u0001\u0004\u0001\u0004\u0001\u0005\u0001\u0005"+
		"\u0001\u0005\u0005\u0005\u00a7\b\u0005\n\u0005\f\u0005\u00aa\t\u0005\u0001"+
		"\u0006\u0001\u0006\u0001\u0006\u0001\u0007\u0001\u0007\u0001\u0007\u0003"+
		"\u0007\u00b2\b\u0007\u0001\u0007\u0001\u0007\u0001\b\u0001\b\u0001\b\u0005"+
		"\b\u00b9\b\b\n\b\f\b\u00bc\t\b\u0001\t\u0001\t\u0001\t\u0001\t\u0001\t"+
		"\u0003\t\u00c3\b\t\u0001\t\u0001\t\u0001\n\u0001\n\u0001\n\u0001\n\u0003"+
		"\n\u00cb\b\n\u0001\u000b\u0001\u000b\u0001\u000b\u0001\u000b\u0003\u000b"+
		"\u00d1\b\u000b\u0001\u000b\u0001\u000b\u0001\u000b\u0001\u000b\u0001\u000b"+
		"\u0001\u000b\u0001\u000b\u0003\u000b\u00da\b\u000b\u0001\f\u0001\f\u0001"+
		"\f\u0001\f\u0001\r\u0001\r\u0001\r\u0001\u000e\u0001\u000e\u0001\u000f"+
		"\u0001\u000f\u0001\u000f\u0001\u000f\u0003\u000f\u00e9\b\u000f\u0001\u000f"+
		"\u0001\u000f\u0003\u000f\u00ed\b\u000f\u0001\u0010\u0001\u0010\u0001\u0010"+
		"\u0001\u0010\u0003\u0010\u00f3\b\u0010\u0001\u0011\u0001\u0011\u0003\u0011"+
		"\u00f7\b\u0011\u0001\u0012\u0001\u0012\u0003\u0012\u00fb\b\u0012\u0001"+
		"\u0013\u0001\u0013\u0001\u0013\u0001\u0013\u0005\u0013\u0101\b\u0013\n"+
		"\u0013\f\u0013\u0104\t\u0013\u0001\u0013\u0003\u0013\u0107\b\u0013\u0001"+
		"\u0013\u0001\u0013\u0001\u0014\u0001\u0014\u0001\u0014\u0001\u0014\u0003"+
		"\u0014\u010f\b\u0014\u0001\u0014\u0001\u0014\u0001\u0015\u0001\u0015\u0001"+
		"\u0016\u0001\u0016\u0001\u0016\u0003\u0016\u0118\b\u0016\u0001\u0016\u0003"+
		"\u0016\u011b\b\u0016\u0001\u0016\u0001\u0016\u0001\u0016\u0003\u0016\u0120"+
		"\b\u0016\u0003\u0016\u0122\b\u0016\u0001\u0017\u0001\u0017\u0001\u0017"+
		"\u0003\u0017\u0127\b\u0017\u0001\u0017\u0001\u0017\u0001\u0017\u0001\u0017"+
		"\u0001\u0018\u0001\u0018\u0001\u0018\u0001\u0018\u0003\u0018\u0131\b\u0018"+
		"\u0001\u0019\u0001\u0019\u0001\u0019\u0003\u0019\u0136\b\u0019\u0001\u001a"+
		"\u0001\u001a\u0001\u001a\u0001\u001a\u0005\u001a\u013c\b\u001a\n\u001a"+
		"\f\u001a\u013f\t\u001a\u0001\u001b\u0001\u001b\u0001\u001b\u0005\u001b"+
		"\u0144\b\u001b\n\u001b\f\u001b\u0147\t\u001b\u0001\u001c\u0001\u001c\u0005"+
		"\u001c\u014b\b\u001c\n\u001c\f\u001c\u014e\t\u001c\u0001\u001c\u0001\u001c"+
		"\u0001\u001d\u0001\u001d\u0001\u001d\u0003\u001d\u0155\b\u001d\u0001\u001e"+
		"\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e"+
		"\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e"+
		"\u0001\u001e\u0001\u001e\u0001\u001e\u0003\u001e\u0167\b\u001e\u0001\u001e"+
		"\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e"+
		"\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e"+
		"\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e"+
		"\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e"+
		"\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e"+
		"\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e"+
		"\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e"+
		"\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0003\u001e\u0198\b\u001e"+
		"\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e"+
		"\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e"+
		"\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e"+
		"\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e"+
		"\u0001\u001e\u0001\u001e\u0005\u001e\u01b4\b\u001e\n\u001e\f\u001e\u01b7"+
		"\t\u001e\u0001\u001f\u0001\u001f\u0001\u001f\u0003\u001f\u01bc\b\u001f"+
		"\u0001\u001f\u0001\u001f\u0001 \u0001 \u0001 \u0005 \u01c3\b \n \f \u01c6"+
		"\t \u0001 \u0003 \u01c9\b \u0001!\u0001!\u0001!\u0001!\u0001!\u0001\""+
		"\u0001\"\u0003\"\u01d2\b\"\u0001\"\u0003\"\u01d5\b\"\u0001#\u0001#\u0003"+
		"#\u01d9\b#\u0001$\u0001$\u0001%\u0001%\u0001%\u0003%\u01e0\b%\u0001&\u0001"+
		"&\u0001&\u0005&\u01e5\b&\n&\f&\u01e8\t&\u0001&\u0003&\u01eb\b&\u0001&"+
		"\u0000\u0001<\'\u0000\u0002\u0004\u0006\b\n\f\u000e\u0010\u0012\u0014"+
		"\u0016\u0018\u001a\u001c\u001e \"$&(*,.02468:<>@BDFHJL\u0000\b\u0001\u0000"+
		"\u0001\u0002\u0001\u0000\f\r\u0001\u0000\u000e\u000f\u0001\u0000\u001d"+
		"\u001f\u0001\u0000 !\u0001\u0000\"#\u0001\u0000$\'\u0002\u000059@@\u022a"+
		"\u0000O\u0001\u0000\u0000\u0000\u0002]\u0001\u0000\u0000\u0000\u0004\u0082"+
		"\u0001\u0000\u0000\u0000\u0006\u0095\u0001\u0000\u0000\u0000\b\u0097\u0001"+
		"\u0000\u0000\u0000\n\u00a3\u0001\u0000\u0000\u0000\f\u00ab\u0001\u0000"+
		"\u0000\u0000\u000e\u00ae\u0001\u0000\u0000\u0000\u0010\u00b5\u0001\u0000"+
		"\u0000\u0000\u0012\u00bd\u0001\u0000\u0000\u0000\u0014\u00c6\u0001\u0000"+
		"\u0000\u0000\u0016\u00d9\u0001\u0000\u0000\u0000\u0018\u00db\u0001\u0000"+
		"\u0000\u0000\u001a\u00df\u0001\u0000\u0000\u0000\u001c\u00e2\u0001\u0000"+
		"\u0000\u0000\u001e\u00e4\u0001\u0000\u0000\u0000 \u00ee\u0001\u0000\u0000"+
		"\u0000\"\u00f4\u0001\u0000\u0000\u0000$\u00f8\u0001\u0000\u0000\u0000"+
		"&\u00fc\u0001\u0000\u0000\u0000(\u010a\u0001\u0000\u0000\u0000*\u0112"+
		"\u0001\u0000\u0000\u0000,\u0117\u0001\u0000\u0000\u0000.\u0123\u0001\u0000"+
		"\u0000\u00000\u0130\u0001\u0000\u0000\u00002\u0135\u0001\u0000\u0000\u0000"+
		"4\u0137\u0001\u0000\u0000\u00006\u0140\u0001\u0000\u0000\u00008\u0148"+
		"\u0001\u0000\u0000\u0000:\u0154\u0001\u0000\u0000\u0000<\u0197\u0001\u0000"+
		"\u0000\u0000>\u01b8\u0001\u0000\u0000\u0000@\u01bf\u0001\u0000\u0000\u0000"+
		"B\u01ca\u0001\u0000\u0000\u0000D\u01cf\u0001\u0000\u0000\u0000F\u01d8"+
		"\u0001\u0000\u0000\u0000H\u01da\u0001\u0000\u0000\u0000J\u01dc\u0001\u0000"+
		"\u0000\u0000L\u01e1\u0001\u0000\u0000\u0000NP\u0003\u0002\u0001\u0000"+
		"ON\u0001\u0000\u0000\u0000PQ\u0001\u0000\u0000\u0000QO\u0001\u0000\u0000"+
		"\u0000QR\u0001\u0000\u0000\u0000R\u0001\u0001\u0000\u0000\u0000SU\u0003"+
		"\u0006\u0003\u0000TV\u0005A\u0000\u0000UT\u0001\u0000\u0000\u0000UV\u0001"+
		"\u0000\u0000\u0000V^\u0001\u0000\u0000\u0000WY\u0003\u0014\n\u0000XZ\u0005"+
		"A\u0000\u0000YX\u0001\u0000\u0000\u0000YZ\u0001\u0000\u0000\u0000Z^\u0001"+
		"\u0000\u0000\u0000[^\u0003\b\u0004\u0000\\^\u0003\u0004\u0002\u0000]S"+
		"\u0001\u0000\u0000\u0000]W\u0001\u0000\u0000\u0000][\u0001\u0000\u0000"+
		"\u0000]\\\u0001\u0000\u0000\u0000^\u0003\u0001\u0000\u0000\u0000_a\u0003"+
		"\u001c\u000e\u0000`b\u0005A\u0000\u0000a`\u0001\u0000\u0000\u0000ab\u0001"+
		"\u0000\u0000\u0000b\u0083\u0001\u0000\u0000\u0000ce\u0003\u0016\u000b"+
		"\u0000df\u0005A\u0000\u0000ed\u0001\u0000\u0000\u0000ef\u0001\u0000\u0000"+
		"\u0000f\u0083\u0001\u0000\u0000\u0000gi\u0003\u0018\f\u0000hj\u0005A\u0000"+
		"\u0000ih\u0001\u0000\u0000\u0000ij\u0001\u0000\u0000\u0000j\u0083\u0001"+
		"\u0000\u0000\u0000km\u0003\u001a\r\u0000ln\u0005A\u0000\u0000ml\u0001"+
		"\u0000\u0000\u0000mn\u0001\u0000\u0000\u0000n\u0083\u0001\u0000\u0000"+
		"\u0000oq\u0003B!\u0000pr\u0005A\u0000\u0000qp\u0001\u0000\u0000\u0000"+
		"qr\u0001\u0000\u0000\u0000r\u0083\u0001\u0000\u0000\u0000s\u0083\u0003"+
		"\u001e\u000f\u0000t\u0083\u0003 \u0010\u0000u\u0083\u0003\"\u0011\u0000"+
		"v\u0083\u0003$\u0012\u0000w\u0083\u0003&\u0013\u0000x\u0083\u0003D\"\u0000"+
		"y{\u0003\u000e\u0007\u0000z|\u0005A\u0000\u0000{z\u0001\u0000\u0000\u0000"+
		"{|\u0001\u0000\u0000\u0000|\u0083\u0001\u0000\u0000\u0000}\u007f\u0003"+
		"\u0012\t\u0000~\u0080\u0005A\u0000\u0000\u007f~\u0001\u0000\u0000\u0000"+
		"\u007f\u0080\u0001\u0000\u0000\u0000\u0080\u0083\u0001\u0000\u0000\u0000"+
		"\u0081\u0083\u0003(\u0014\u0000\u0082_\u0001\u0000\u0000\u0000\u0082c"+
		"\u0001\u0000\u0000\u0000\u0082g\u0001\u0000\u0000\u0000\u0082k\u0001\u0000"+
		"\u0000\u0000\u0082o\u0001\u0000\u0000\u0000\u0082s\u0001\u0000\u0000\u0000"+
		"\u0082t\u0001\u0000\u0000\u0000\u0082u\u0001\u0000\u0000\u0000\u0082v"+
		"\u0001\u0000\u0000\u0000\u0082w\u0001\u0000\u0000\u0000\u0082x\u0001\u0000"+
		"\u0000\u0000\u0082y\u0001\u0000\u0000\u0000\u0082}\u0001\u0000\u0000\u0000"+
		"\u0082\u0081\u0001\u0000\u0000\u0000\u0083\u0005\u0001\u0000\u0000\u0000"+
		"\u0084\u0085\u0007\u0000\u0000\u0000\u0085\u0087\u0005@\u0000\u0000\u0086"+
		"\u0088\u0003F#\u0000\u0087\u0086\u0001\u0000\u0000\u0000\u0087\u0088\u0001"+
		"\u0000\u0000\u0000\u0088\u008e\u0001\u0000\u0000\u0000\u0089\u008c\u0005"+
		"\u0003\u0000\u0000\u008a\u008d\u0003<\u001e\u0000\u008b\u008d\u0003>\u001f"+
		"\u0000\u008c\u008a\u0001\u0000\u0000\u0000\u008c\u008b\u0001\u0000\u0000"+
		"\u0000\u008d\u008f\u0001\u0000\u0000\u0000\u008e\u0089\u0001\u0000\u0000"+
		"\u0000\u008e\u008f\u0001\u0000\u0000\u0000\u008f\u0096\u0001\u0000\u0000"+
		"\u0000\u0090\u0091\u0005@\u0000\u0000\u0091\u0092\u0005\u0004\u0000\u0000"+
		"\u0092\u0093\u0003F#\u0000\u0093\u0094\u0003>\u001f\u0000\u0094\u0096"+
		"\u0001\u0000\u0000\u0000\u0095\u0084\u0001\u0000\u0000\u0000\u0095\u0090"+
		"\u0001\u0000\u0000\u0000\u0096\u0007\u0001\u0000\u0000\u0000\u0097\u0098"+
		"\u0005\u0005\u0000\u0000\u0098\u0099\u0005@\u0000\u0000\u0099\u009b\u0005"+
		"\u0006\u0000\u0000\u009a\u009c\u0003\n\u0005\u0000\u009b\u009a\u0001\u0000"+
		"\u0000\u0000\u009b\u009c\u0001\u0000\u0000\u0000\u009c\u009d\u0001\u0000"+
		"\u0000\u0000\u009d\u009f\u0005\u0007\u0000\u0000\u009e\u00a0\u0003F#\u0000"+
		"\u009f\u009e\u0001\u0000\u0000\u0000\u009f\u00a0\u0001\u0000\u0000\u0000"+
		"\u00a0\u00a1\u0001\u0000\u0000\u0000\u00a1\u00a2\u00038\u001c\u0000\u00a2"+
		"\t\u0001\u0000\u0000\u0000\u00a3\u00a8\u0003\f\u0006\u0000\u00a4\u00a5"+
		"\u0005\b\u0000\u0000\u00a5\u00a7\u0003\f\u0006\u0000\u00a6\u00a4\u0001"+
		"\u0000\u0000\u0000\u00a7\u00aa\u0001\u0000\u0000\u0000\u00a8\u00a6\u0001"+
		"\u0000\u0000\u0000\u00a8\u00a9\u0001\u0000\u0000\u0000\u00a9\u000b\u0001"+
		"\u0000\u0000\u0000\u00aa\u00a8\u0001\u0000\u0000\u0000\u00ab\u00ac\u0005"+
		"@\u0000\u0000\u00ac\u00ad\u0003F#\u0000\u00ad\r\u0001\u0000\u0000\u0000"+
		"\u00ae\u00af\u0005@\u0000\u0000\u00af\u00b1\u0005\u0006\u0000\u0000\u00b0"+
		"\u00b2\u0003\u0010\b\u0000\u00b1\u00b0\u0001\u0000\u0000\u0000\u00b1\u00b2"+
		"\u0001\u0000\u0000\u0000\u00b2\u00b3\u0001\u0000\u0000\u0000\u00b3\u00b4"+
		"\u0005\u0007\u0000\u0000\u00b4\u000f\u0001\u0000\u0000\u0000\u00b5\u00ba"+
		"\u0003<\u001e\u0000\u00b6\u00b7\u0005\b\u0000\u0000\u00b7\u00b9\u0003"+
		"<\u001e\u0000\u00b8\u00b6\u0001\u0000\u0000\u0000\u00b9\u00bc\u0001\u0000"+
		"\u0000\u0000\u00ba\u00b8\u0001\u0000\u0000\u0000\u00ba\u00bb\u0001\u0000"+
		"\u0000\u0000\u00bb\u0011\u0001\u0000\u0000\u0000\u00bc\u00ba\u0001\u0000"+
		"\u0000\u0000\u00bd\u00be\u0005@\u0000\u0000\u00be\u00bf\u0005\t\u0000"+
		"\u0000\u00bf\u00c0\u0005@\u0000\u0000\u00c0\u00c2\u0005\u0006\u0000\u0000"+
		"\u00c1\u00c3\u0003\u0010\b\u0000\u00c2\u00c1\u0001\u0000\u0000\u0000\u00c2"+
		"\u00c3\u0001\u0000\u0000\u0000\u00c3\u00c4\u0001\u0000\u0000\u0000\u00c4"+
		"\u00c5\u0005\u0007\u0000\u0000\u00c5\u0013\u0001\u0000\u0000\u0000\u00c6"+
		"\u00c7\u0005@\u0000\u0000\u00c7\u00ca\u0005\u0004\u0000\u0000\u00c8\u00cb"+
		"\u0003<\u001e\u0000\u00c9\u00cb\u0003>\u001f\u0000\u00ca\u00c8\u0001\u0000"+
		"\u0000\u0000\u00ca\u00c9\u0001\u0000\u0000\u0000\u00cb\u0015\u0001\u0000"+
		"\u0000\u0000\u00cc\u00cd\u0005@\u0000\u0000\u00cd\u00d0\u0005\u0003\u0000"+
		"\u0000\u00ce\u00d1\u0003<\u001e\u0000\u00cf\u00d1\u0003>\u001f\u0000\u00d0"+
		"\u00ce\u0001\u0000\u0000\u0000\u00d0\u00cf\u0001\u0000\u0000\u0000\u00d1"+
		"\u00da\u0001\u0000\u0000\u0000\u00d2\u00d3\u0003<\u001e\u0000\u00d3\u00d4"+
		"\u0005\n\u0000\u0000\u00d4\u00d5\u0003<\u001e\u0000\u00d5\u00d6\u0005"+
		"\u000b\u0000\u0000\u00d6\u00d7\u0005\u0003\u0000\u0000\u00d7\u00d8\u0003"+
		"<\u001e\u0000\u00d8\u00da\u0001\u0000\u0000\u0000\u00d9\u00cc\u0001\u0000"+
		"\u0000\u0000\u00d9\u00d2\u0001\u0000\u0000\u0000\u00da\u0017\u0001\u0000"+
		"\u0000\u0000\u00db\u00dc\u0005@\u0000\u0000\u00dc\u00dd\u0007\u0001\u0000"+
		"\u0000\u00dd\u00de\u0003<\u001e\u0000\u00de\u0019\u0001\u0000\u0000\u0000"+
		"\u00df\u00e0\u0005@\u0000\u0000\u00e0\u00e1\u0007\u0002\u0000\u0000\u00e1"+
		"\u001b\u0001\u0000\u0000\u0000\u00e2\u00e3\u0003<\u001e\u0000\u00e3\u001d"+
		"\u0001\u0000\u0000\u0000\u00e4\u00e5\u0005\u0010\u0000\u0000\u00e5\u00e8"+
		"\u0003<\u001e\u0000\u00e6\u00e9\u00038\u001c\u0000\u00e7\u00e9\u0003\u0004"+
		"\u0002\u0000\u00e8\u00e6\u0001\u0000\u0000\u0000\u00e8\u00e7\u0001\u0000"+
		"\u0000\u0000\u00e9\u00ec\u0001\u0000\u0000\u0000\u00ea\u00eb\u0005\u0011"+
		"\u0000\u0000\u00eb\u00ed\u0003:\u001d\u0000\u00ec\u00ea\u0001\u0000\u0000"+
		"\u0000\u00ec\u00ed\u0001\u0000\u0000\u0000\u00ed\u001f\u0001\u0000\u0000"+
		"\u0000\u00ee\u00ef\u0005\u0012\u0000\u0000\u00ef\u00f2\u0003<\u001e\u0000"+
		"\u00f0\u00f3\u00038\u001c\u0000\u00f1\u00f3\u0003\u0004\u0002\u0000\u00f2"+
		"\u00f0\u0001\u0000\u0000\u0000\u00f2\u00f1\u0001\u0000\u0000\u0000\u00f3"+
		"!\u0001\u0000\u0000\u0000\u00f4\u00f6\u0005\u0013\u0000\u0000\u00f5\u00f7"+
		"\u0005A\u0000\u0000\u00f6\u00f5\u0001\u0000\u0000\u0000\u00f6\u00f7\u0001"+
		"\u0000\u0000\u0000\u00f7#\u0001\u0000\u0000\u0000\u00f8\u00fa\u0005\u0014"+
		"\u0000\u0000\u00f9\u00fb\u0005A\u0000\u0000\u00fa\u00f9\u0001\u0000\u0000"+
		"\u0000\u00fa\u00fb\u0001\u0000\u0000\u0000\u00fb%\u0001\u0000\u0000\u0000"+
		"\u00fc\u00fd\u0005\u0015\u0000\u0000\u00fd\u00fe\u0003<\u001e\u0000\u00fe"+
		"\u0102\u0005\u0016\u0000\u0000\u00ff\u0101\u00034\u001a\u0000\u0100\u00ff"+
		"\u0001\u0000\u0000\u0000\u0101\u0104\u0001\u0000\u0000\u0000\u0102\u0100"+
		"\u0001\u0000\u0000\u0000\u0102\u0103\u0001\u0000\u0000\u0000\u0103\u0106"+
		"\u0001\u0000\u0000\u0000\u0104\u0102\u0001\u0000\u0000\u0000\u0105\u0107"+
		"\u00036\u001b\u0000\u0106\u0105\u0001\u0000\u0000\u0000\u0106\u0107\u0001"+
		"\u0000\u0000\u0000\u0107\u0108\u0001\u0000\u0000\u0000\u0108\u0109\u0005"+
		"\u0017\u0000\u0000\u0109\'\u0001\u0000\u0000\u0000\u010a\u010e\u0005\u0018"+
		"\u0000\u0000\u010b\u010f\u0003*\u0015\u0000\u010c\u010f\u0003,\u0016\u0000"+
		"\u010d\u010f\u0003.\u0017\u0000\u010e\u010b\u0001\u0000\u0000\u0000\u010e"+
		"\u010c\u0001\u0000\u0000\u0000\u010e\u010d\u0001\u0000\u0000\u0000\u010f"+
		"\u0110\u0001\u0000\u0000\u0000\u0110\u0111\u00038\u001c\u0000\u0111)\u0001"+
		"\u0000\u0000\u0000\u0112\u0113\u0003<\u001e\u0000\u0113+\u0001\u0000\u0000"+
		"\u0000\u0114\u0115\u00030\u0018\u0000\u0115\u0116\u0005A\u0000\u0000\u0116"+
		"\u0118\u0001\u0000\u0000\u0000\u0117\u0114\u0001\u0000\u0000\u0000\u0117"+
		"\u0118\u0001\u0000\u0000\u0000\u0118\u011a\u0001\u0000\u0000\u0000\u0119"+
		"\u011b\u0003<\u001e\u0000\u011a\u0119\u0001\u0000\u0000\u0000\u011a\u011b"+
		"\u0001\u0000\u0000\u0000\u011b\u011c\u0001\u0000\u0000\u0000\u011c\u0121"+
		"\u0005A\u0000\u0000\u011d\u011f\u00032\u0019\u0000\u011e\u0120\u0005A"+
		"\u0000\u0000\u011f\u011e\u0001\u0000\u0000\u0000\u011f\u0120\u0001\u0000"+
		"\u0000\u0000\u0120\u0122\u0001\u0000\u0000\u0000\u0121\u011d\u0001\u0000"+
		"\u0000\u0000\u0121\u0122\u0001\u0000\u0000\u0000\u0122-\u0001\u0000\u0000"+
		"\u0000\u0123\u0126\u0005@\u0000\u0000\u0124\u0125\u0005\b\u0000\u0000"+
		"\u0125\u0127\u0005@\u0000\u0000\u0126\u0124\u0001\u0000\u0000\u0000\u0126"+
		"\u0127\u0001\u0000\u0000\u0000\u0127\u0128\u0001\u0000\u0000\u0000\u0128"+
		"\u0129\u0005\u0004\u0000\u0000\u0129\u012a\u0005\u0019\u0000\u0000\u012a"+
		"\u012b\u0003<\u001e\u0000\u012b/\u0001\u0000\u0000\u0000\u012c\u0131\u0003"+
		"\u0006\u0003\u0000\u012d\u0131\u0003\u0014\n\u0000\u012e\u0131\u0003\u0016"+
		"\u000b\u0000\u012f\u0131\u0003\u0018\f\u0000\u0130\u012c\u0001\u0000\u0000"+
		"\u0000\u0130\u012d\u0001\u0000\u0000\u0000\u0130\u012e\u0001\u0000\u0000"+
		"\u0000\u0130\u012f\u0001\u0000\u0000\u0000\u01311\u0001\u0000\u0000\u0000"+
		"\u0132\u0136\u0003\u0016\u000b\u0000\u0133\u0136\u0003\u0018\f\u0000\u0134"+
		"\u0136\u0003\u001a\r\u0000\u0135\u0132\u0001\u0000\u0000\u0000\u0135\u0133"+
		"\u0001\u0000\u0000\u0000\u0135\u0134\u0001\u0000\u0000\u0000\u01363\u0001"+
		"\u0000\u0000\u0000\u0137\u0138\u0005\u001a\u0000\u0000\u0138\u0139\u0003"+
		"<\u001e\u0000\u0139\u013d\u0005\u001b\u0000\u0000\u013a\u013c\u0003\u0002"+
		"\u0001\u0000\u013b\u013a\u0001\u0000\u0000\u0000\u013c\u013f\u0001\u0000"+
		"\u0000\u0000\u013d\u013b\u0001\u0000\u0000\u0000\u013d\u013e\u0001\u0000"+
		"\u0000\u0000\u013e5\u0001\u0000\u0000\u0000\u013f\u013d\u0001\u0000\u0000"+
		"\u0000\u0140\u0141\u0005\u001c\u0000\u0000\u0141\u0145\u0005\u001b\u0000"+
		"\u0000\u0142\u0144\u0003\u0002\u0001\u0000\u0143\u0142\u0001\u0000\u0000"+
		"\u0000\u0144\u0147\u0001\u0000\u0000\u0000\u0145\u0143\u0001\u0000\u0000"+
		"\u0000\u0145\u0146\u0001\u0000\u0000\u0000\u01467\u0001\u0000\u0000\u0000"+
		"\u0147\u0145\u0001\u0000\u0000\u0000\u0148\u014c\u0005\u0016\u0000\u0000"+
		"\u0149\u014b\u0003\u0002\u0001\u0000\u014a\u0149\u0001\u0000\u0000\u0000"+
		"\u014b\u014e\u0001\u0000\u0000\u0000\u014c\u014a\u0001\u0000\u0000\u0000"+
		"\u014c\u014d\u0001\u0000\u0000\u0000\u014d\u014f\u0001\u0000\u0000\u0000"+
		"\u014e\u014c\u0001\u0000\u0000\u0000\u014f\u0150\u0005\u0017\u0000\u0000"+
		"\u01509\u0001\u0000\u0000\u0000\u0151\u0155\u0003\u001e\u000f\u0000\u0152"+
		"\u0155\u00038\u001c\u0000\u0153\u0155\u0003\u0004\u0002\u0000\u0154\u0151"+
		"\u0001\u0000\u0000\u0000\u0154\u0152\u0001\u0000\u0000\u0000\u0154\u0153"+
		"\u0001\u0000\u0000\u0000\u0155;\u0001\u0000\u0000\u0000\u0156\u0157\u0006"+
		"\u001e\uffff\uffff\u0000\u0157\u0158\u0005(\u0000\u0000\u0158\u0198\u0003"+
		"<\u001e\u0017\u0159\u015a\u0005!\u0000\u0000\u015a\u0198\u0003<\u001e"+
		"\u0016\u015b\u015c\u0005)\u0000\u0000\u015c\u015d\u0005\u0006\u0000\u0000"+
		"\u015d\u015e\u0003<\u001e\u0000\u015e\u015f\u0005\u0007\u0000\u0000\u015f"+
		"\u0198\u0001\u0000\u0000\u0000\u0160\u0161\u0005*\u0000\u0000\u0161\u0162"+
		"\u0005\u0006\u0000\u0000\u0162\u0163\u0003<\u001e\u0000\u0163\u0166\u0005"+
		"\b\u0000\u0000\u0164\u0167\u0003<\u001e\u0000\u0165\u0167\u0003>\u001f"+
		"\u0000\u0166\u0164\u0001\u0000\u0000\u0000\u0166\u0165\u0001\u0000\u0000"+
		"\u0000\u0167\u0168\u0001\u0000\u0000\u0000\u0168\u0169\u0005\u0007\u0000"+
		"\u0000\u0169\u0198\u0001\u0000\u0000\u0000\u016a\u016b\u0005+\u0000\u0000"+
		"\u016b\u016c\u0005\u0006\u0000\u0000\u016c\u016d\u0003<\u001e\u0000\u016d"+
		"\u016e\u0005\b\u0000\u0000\u016e\u016f\u0003<\u001e\u0000\u016f\u0170"+
		"\u0005\u0007\u0000\u0000\u0170\u0198\u0001\u0000\u0000\u0000\u0171\u0172"+
		"\u0005,\u0000\u0000\u0172\u0173\u0005\u0006\u0000\u0000\u0173\u0174\u0003"+
		"<\u001e\u0000\u0174\u0175\u0005\b\u0000\u0000\u0175\u0176\u0003<\u001e"+
		"\u0000\u0176\u0177\u0005\u0007\u0000\u0000\u0177\u0198\u0001\u0000\u0000"+
		"\u0000\u0178\u0179\u0005-\u0000\u0000\u0179\u017a\u0005\u0006\u0000\u0000"+
		"\u017a\u017b\u0003<\u001e\u0000\u017b\u017c\u0005\u0007\u0000\u0000\u017c"+
		"\u0198\u0001\u0000\u0000\u0000\u017d\u017e\u0005.\u0000\u0000\u017e\u017f"+
		"\u0005\u0006\u0000\u0000\u017f\u0180\u0003<\u001e\u0000\u0180\u0181\u0005"+
		"\u0007\u0000\u0000\u0181\u0198\u0001\u0000\u0000\u0000\u0182\u0183\u0005"+
		"/\u0000\u0000\u0183\u0184\u0005\u0006\u0000\u0000\u0184\u0185\u0003<\u001e"+
		"\u0000\u0185\u0186\u0005\u0007\u0000\u0000\u0186\u0198\u0001\u0000\u0000"+
		"\u0000\u0187\u0198\u0005;\u0000\u0000\u0188\u0198\u0005<\u0000\u0000\u0189"+
		"\u0198\u0005=\u0000\u0000\u018a\u0198\u0005>\u0000\u0000\u018b\u0198\u0003"+
		"\u000e\u0007\u0000\u018c\u0198\u0003\u0012\t\u0000\u018d\u0198\u0005?"+
		"\u0000\u0000\u018e\u0198\u00052\u0000\u0000\u018f\u0198\u0005@\u0000\u0000"+
		"\u0190\u0191\u0005\u0006\u0000\u0000\u0191\u0192\u0003<\u001e\u0000\u0192"+
		"\u0193\u0005\u0007\u0000\u0000\u0193\u0198\u0001\u0000\u0000\u0000\u0194"+
		"\u0195\u0003J%\u0000\u0195\u0196\u0003>\u001f\u0000\u0196\u0198\u0001"+
		"\u0000\u0000\u0000\u0197\u0156\u0001\u0000\u0000\u0000\u0197\u0159\u0001"+
		"\u0000\u0000\u0000\u0197\u015b\u0001\u0000\u0000\u0000\u0197\u0160\u0001"+
		"\u0000\u0000\u0000\u0197\u016a\u0001\u0000\u0000\u0000\u0197\u0171\u0001"+
		"\u0000\u0000\u0000\u0197\u0178\u0001\u0000\u0000\u0000\u0197\u017d\u0001"+
		"\u0000\u0000\u0000\u0197\u0182\u0001\u0000\u0000\u0000\u0197\u0187\u0001"+
		"\u0000\u0000\u0000\u0197\u0188\u0001\u0000\u0000\u0000\u0197\u0189\u0001"+
		"\u0000\u0000\u0000\u0197\u018a\u0001\u0000\u0000\u0000\u0197\u018b\u0001"+
		"\u0000\u0000\u0000\u0197\u018c\u0001\u0000\u0000\u0000\u0197\u018d\u0001"+
		"\u0000\u0000\u0000\u0197\u018e\u0001\u0000\u0000\u0000\u0197\u018f\u0001"+
		"\u0000\u0000\u0000\u0197\u0190\u0001\u0000\u0000\u0000\u0197\u0194\u0001"+
		"\u0000\u0000\u0000\u0198\u01b5\u0001\u0000\u0000\u0000\u0199\u019a\n\u001b"+
		"\u0000\u0000\u019a\u019b\u0007\u0003\u0000\u0000\u019b\u01b4\u0003<\u001e"+
		"\u001c\u019c\u019d\n\u001a\u0000\u0000\u019d\u019e\u0007\u0004\u0000\u0000"+
		"\u019e\u01b4\u0003<\u001e\u001b\u019f\u01a0\n\u0019\u0000\u0000\u01a0"+
		"\u01a1\u0007\u0005\u0000\u0000\u01a1\u01b4\u0003<\u001e\u001a\u01a2\u01a3"+
		"\n\u0018\u0000\u0000\u01a3\u01a4\u0007\u0006\u0000\u0000\u01a4\u01b4\u0003"+
		"<\u001e\u0019\u01a5\u01a6\n\r\u0000\u0000\u01a6\u01a7\u00050\u0000\u0000"+
		"\u01a7\u01b4\u0003<\u001e\u000e\u01a8\u01a9\n\f\u0000\u0000\u01a9\u01aa"+
		"\u00051\u0000\u0000\u01aa\u01b4\u0003<\u001e\r\u01ab\u01ac\n\u001c\u0000"+
		"\u0000\u01ac\u01ad\u0005\t\u0000\u0000\u01ad\u01b4\u0005@\u0000\u0000"+
		"\u01ae\u01af\n\u000e\u0000\u0000\u01af\u01b0\u0005\n\u0000\u0000\u01b0"+
		"\u01b1\u0003<\u001e\u0000\u01b1\u01b2\u0005\u000b\u0000\u0000\u01b2\u01b4"+
		"\u0001\u0000\u0000\u0000\u01b3\u0199\u0001\u0000\u0000\u0000\u01b3\u019c"+
		"\u0001\u0000\u0000\u0000\u01b3\u019f\u0001\u0000\u0000\u0000\u01b3\u01a2"+
		"\u0001\u0000\u0000\u0000\u01b3\u01a5\u0001\u0000\u0000\u0000\u01b3\u01a8"+
		"\u0001\u0000\u0000\u0000\u01b3\u01ab\u0001\u0000\u0000\u0000\u01b3\u01ae"+
		"\u0001\u0000\u0000\u0000\u01b4\u01b7\u0001\u0000\u0000\u0000\u01b5\u01b3"+
		"\u0001\u0000\u0000\u0000\u01b5\u01b6\u0001\u0000\u0000\u0000\u01b6=\u0001"+
		"\u0000\u0000\u0000\u01b7\u01b5\u0001\u0000\u0000\u0000\u01b8\u01bb\u0005"+
		"\u0016\u0000\u0000\u01b9\u01bc\u0003L&\u0000\u01ba\u01bc\u0003@ \u0000"+
		"\u01bb\u01b9\u0001\u0000\u0000\u0000\u01bb\u01ba\u0001\u0000\u0000\u0000"+
		"\u01bb\u01bc\u0001\u0000\u0000\u0000\u01bc\u01bd\u0001\u0000\u0000\u0000"+
		"\u01bd\u01be\u0005\u0017\u0000\u0000\u01be?\u0001\u0000\u0000\u0000\u01bf"+
		"\u01c4\u0003>\u001f\u0000\u01c0\u01c1\u0005\b\u0000\u0000\u01c1\u01c3"+
		"\u0003>\u001f\u0000\u01c2\u01c0\u0001\u0000\u0000\u0000\u01c3\u01c6\u0001"+
		"\u0000\u0000\u0000\u01c4\u01c2\u0001\u0000\u0000\u0000\u01c4\u01c5\u0001"+
		"\u0000\u0000\u0000\u01c5\u01c8\u0001\u0000\u0000\u0000\u01c6\u01c4\u0001"+
		"\u0000\u0000\u0000\u01c7\u01c9\u0005\b\u0000\u0000\u01c8\u01c7\u0001\u0000"+
		"\u0000\u0000\u01c8\u01c9\u0001\u0000\u0000\u0000\u01c9A\u0001\u0000\u0000"+
		"\u0000\u01ca\u01cb\u00053\u0000\u0000\u01cb\u01cc\u0005\u0006\u0000\u0000"+
		"\u01cc\u01cd\u0003<\u001e\u0000\u01cd\u01ce\u0005\u0007\u0000\u0000\u01ce"+
		"C\u0001\u0000\u0000\u0000\u01cf\u01d1\u00054\u0000\u0000\u01d0\u01d2\u0003"+
		"<\u001e\u0000\u01d1\u01d0\u0001\u0000\u0000\u0000\u01d1\u01d2\u0001\u0000"+
		"\u0000\u0000\u01d2\u01d4\u0001\u0000\u0000\u0000\u01d3\u01d5\u0005A\u0000"+
		"\u0000\u01d4\u01d3\u0001\u0000\u0000\u0000\u01d4\u01d5\u0001\u0000\u0000"+
		"\u0000\u01d5E\u0001\u0000\u0000\u0000\u01d6\u01d9\u0003H$\u0000\u01d7"+
		"\u01d9\u0003J%\u0000\u01d8\u01d6\u0001\u0000\u0000\u0000\u01d8\u01d7\u0001"+
		"\u0000\u0000\u0000\u01d9G\u0001\u0000\u0000\u0000\u01da\u01db\u0007\u0007"+
		"\u0000\u0000\u01dbI\u0001\u0000\u0000\u0000\u01dc\u01df\u0005:\u0000\u0000"+
		"\u01dd\u01e0\u0003J%\u0000\u01de\u01e0\u0003H$\u0000\u01df\u01dd\u0001"+
		"\u0000\u0000\u0000\u01df\u01de\u0001\u0000\u0000\u0000\u01e0K\u0001\u0000"+
		"\u0000\u0000\u01e1\u01e6\u0003<\u001e\u0000\u01e2\u01e3\u0005\b\u0000"+
		"\u0000\u01e3\u01e5\u0003<\u001e\u0000\u01e4\u01e2\u0001\u0000\u0000\u0000"+
		"\u01e5\u01e8\u0001\u0000\u0000\u0000\u01e6\u01e4\u0001\u0000\u0000\u0000"+
		"\u01e6\u01e7\u0001\u0000\u0000\u0000\u01e7\u01ea\u0001\u0000\u0000\u0000"+
		"\u01e8\u01e6\u0001\u0000\u0000\u0000\u01e9\u01eb\u0005\b\u0000\u0000\u01ea"+
		"\u01e9\u0001\u0000\u0000\u0000\u01ea\u01eb\u0001\u0000\u0000\u0000\u01eb"+
		"M\u0001\u0000\u0000\u00009QUY]aeimq{\u007f\u0082\u0087\u008c\u008e\u0095"+
		"\u009b\u009f\u00a8\u00b1\u00ba\u00c2\u00ca\u00d0\u00d9\u00e8\u00ec\u00f2"+
		"\u00f6\u00fa\u0102\u0106\u010e\u0117\u011a\u011f\u0121\u0126\u0130\u0135"+
		"\u013d\u0145\u014c\u0154\u0166\u0197\u01b3\u01b5\u01bb\u01c4\u01c8\u01d1"+
		"\u01d4\u01d8\u01df\u01e6\u01ea";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}