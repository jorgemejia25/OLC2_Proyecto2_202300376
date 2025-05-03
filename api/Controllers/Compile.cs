using analyzer;
using Antlr4.Runtime;
using Microsoft.AspNetCore.Mvc;
using api.Common;
using System.Linq;
using Antlr4.Runtime.Misc;
using Symbols;
using System.Text.Json;
using System.Text;

namespace api.Controllers
{
    /// <summary>
    /// Controlador que compila código Go simplificado.
    /// </summary>
    [ApiController]
    [Route("[controller]")]
    public class CompileController : ControllerBase
    {
        private readonly ILogger<CompileController> _logger;

        /// <summary>
        /// Constructor que inyecta el logger.
        /// </summary>
        public CompileController(ILogger<CompileController> logger)
        {
            _logger = logger;
        }

        /// <summary>
        /// Endpoint POST que compila el código recibido.
        /// </summary>
        [HttpPost]
        public IActionResult Compile([FromBody] CompileRequest request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            _logger.LogInformation("Compiling code: {0}", request.Code);

            var inputStream = new AntlrInputStream(request.Code);

            var lexer = new GoLangLexer(inputStream);
            lexer.RemoveErrorListeners();
            lexer.AddErrorListener(new DescriptiveErrorListener());

            var tokenStream = new CommonTokenStream(lexer);
            var parser = new GoLangParser(tokenStream);

            parser.RemoveErrorListeners();
            parser.AddErrorListener(new SyntaxErrorListener());

            try
            {
                var tree = parser.program();

                // Crear un environment compartido
                var sharedEnvironment = new Environment();

                // Crear el visitor principal con el environment compartido
                var mainVisitor = new SemanticVisitor(sharedEnvironment);

                // Crear un visitor específico para la fase de declaración con el mismo environment
                var declarationVisitor = new DeclarationVisitor(sharedEnvironment, mainVisitor);

                _logger.LogInformation("Procesando declaraciones de structs y funciones...");

                // Primera fase: Procesar solo declaraciones de structs y funciones
                declarationVisitor.Visit(tree);

                _logger.LogInformation($"Declaraciones procesadas. Funciones encontradas: {sharedEnvironment.GetFunctionCount()}");

                // Validar que existe la función main
                if (sharedEnvironment.MainFunction == null)
                {
                    throw new SemanticError("El programa debe tener una función 'main'", null!);
                }

                _logger.LogInformation("Ejecutando función main...");

                // Obtener la función main del environment compartido
                var mainFunction = sharedEnvironment.MainFunction;

                // Crear un entorno específico para la ejecución de main
                sharedEnvironment.PushScope("main");

                try
                {
                    // Ejecutar el cuerpo de la función main
                    mainVisitor.Visit(mainFunction.Body);
                }
                finally
                {
                    // Limpiar el entorno después de la ejecución
                    sharedEnvironment.PopScope();
                }

                // Ejecutar el CompilerVisitor
                var compilerVisitor = new CompilerVisitor();

                compilerVisitor.Visit(tree);

                // Guardar informacion en /home/jorgis/Documents/USAC/Compi2/OLC2_Proyecto2_202300376/run/program.s
                var outputPath = Path.Combine(Directory.GetCurrentDirectory(), "run", "program.s");

                // Limpiar el archivo de salida
                if (System.IO.File.Exists(outputPath))
                {
                    System.IO.File.Delete(outputPath);
                }

                // Crear el directorio si no existe
                var directoryPath = Path.GetDirectoryName(outputPath);

                if (!string.IsNullOrEmpty(directoryPath) && !System.IO.Directory.Exists(directoryPath))
                {
                    System.IO.Directory.CreateDirectory(directoryPath);
                }

                // Escribir el código generado en el archivo
                System.IO.File.WriteAllText(outputPath, compilerVisitor.c.ToString());



                // Crear una estructura de respuesta
                var output = new
                {
                    output = "Código guardado en program.s", // Código generado
                    errors = new List<Error>()
                };

                return Ok(output); // Devolvemos código 200 con la salida
            }
            catch (SemanticError e)
            {
                // Crear una estructura de respuesta para el error semántico
                var output = new
                {
                    output = "", // No hay salida cuando hay error
                    errors = new[]
                    {
                        new Error
                        {
                            Type = "Semántico",
                            Message = e.GetMessage(),
                        }
                    }
                };

                return Ok(output); // Devolvemos código 200 pero con el error en el cuerpo
            }
            catch (ParseCanceledException e)
            {
                // Crear una estructura de respuesta para el error léxico
                var output = new
                {
                    output = "", // No hay salida cuando hay error
                    errors = new[]
                    {
                        new Error
                        {
                            Type = "Léxico/Sintáctico",
                            Message = e.Message,
                        }
                    }
                };

                return Ok(output); // Devolvemos código 200 pero con el error en el cuerpo
            }
            catch (Exception ex)
            {
                // Para otros tipos de excepciones no esperadas
                _logger.LogError(ex, "Error no controlado durante la compilación");
                var output = new
                {
                    output = "",
                    errors = new[]
                    {
                        new Error
                        {
                            Type = "Error",
                            Message = ex.Message,
                        }
                    }
                };

                return Ok(output);
            }
        }

        [HttpGet("symbols")]
        public IActionResult GetSymbols()
        {
            var symbols = SymbolTableReport.Instance.GetSymbols();
            return Ok(symbols);
        }

        [HttpPost("ast")]
        public async Task<IActionResult> GetAst([FromBody] CompileRequest request)
        {
            if (!ModelState.IsValid) { return BadRequest(ModelState); }
            _logger.LogInformation("Compiling code: {0}", request.Code);

            string grammarPath = Path.Combine(Directory.GetCurrentDirectory(), "Grammar", "GoLang.g4");

            var grammar = "";

            using (StreamReader sr = new StreamReader(grammarPath))
            {
                grammar = await sr.ReadToEndAsync();
            }

            var payload = new
            {
                grammar = grammar,
                input = request.Code,
                lexgrammar = "",
                start = "program"
            };

            var jsonPayload = JsonSerializer.Serialize(payload);

            var context = new StringContent(jsonPayload, Encoding.UTF8, "application/json");

            var client = new HttpClient();

            HttpResponseMessage response = await client.PostAsync("http://lab.antlr.org/parse/", context);
            response.EnsureSuccessStatusCode();

            string result = await response.Content.ReadAsStringAsync();

            using var doc = JsonDocument.Parse(result);

            var root = doc.RootElement;

            if (root.TryGetProperty("result", out JsonElement resultElement) && resultElement.TryGetProperty("svgtree", out JsonElement svgTreeElement))
            {
                string svgTree = svgTreeElement.GetString() ?? string.Empty;
                return Content(svgTree, "image/svg+xml");
            }

            return BadRequest("No se pudo obtener el árbol sintáctico");

        }
    }

    // Clase para formatear los errores
    public class Error
    {
        public required string Type { get; set; }
        public required string Message { get; set; }
    }
}