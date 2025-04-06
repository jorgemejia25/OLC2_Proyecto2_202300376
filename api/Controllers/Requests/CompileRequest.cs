using System.ComponentModel.DataAnnotations;

public class CompileRequest
{
    [Required]
    public required string Code { get; set; }
}