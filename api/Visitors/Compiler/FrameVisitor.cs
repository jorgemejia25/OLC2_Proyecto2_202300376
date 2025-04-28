using analyzer;
using Antlr4.Runtime.Misc;

public class FrameElement
{

    public string Name { get; set; }
    public int Offset { get; set; }

    public FrameElement(string name, int offset)
    {
        Name = name;
        Offset = offset;
    }
}

public class FrameVisitor : GoLangBaseVisitor<Object?>
{
    public List<FrameElement> Frame;

    public int LocalOffset;

    public int BaseOffset;

    public FrameVisitor(
        int baseOffset
    )
    {
        Frame = new List<FrameElement>();
        LocalOffset = 0;
        BaseOffset = baseOffset;
    }

    public override Object? VisitVarDeclaration(GoLangParser.VarDeclarationContext context)
    {
        string name = context.ID().GetText();

        Frame.Add(new FrameElement(name, BaseOffset + LocalOffset));
        LocalOffset += 1;

        return null;
    }

    public override Object? VisitBlock(GoLangParser.BlockContext context)
    {
        foreach (var stmt in context.statement())
        {
            Visit(stmt);
        }

        return null;
    }





}