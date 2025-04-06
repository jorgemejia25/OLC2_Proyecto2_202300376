import { Error, sendCommand } from "@/actions/sendCommand";

import { useState } from "react";

export const useCodeEditor = () => {
  const [code, setCode] = useState("");
  const [errors, setErrors] = useState<Error[]>([]);
  const [output, setOutput] = useState("// Salida del código aquí...");
  const [isExecuting, setIsExecuting] = useState(false);

  const handleCodeChange = (newCode: string) => {
    setCode(newCode);
  };

  const handleExecute = async () => {
    try {
      setIsExecuting(true);
      setErrors([]); // Limpiar errores anteriores

      const result = await sendCommand(code);

      setOutput(result.output || "// No hay salida");
      setErrors(result.errors || []);
    } catch (error) {
      console.error("Error al ejecutar el código:", error);
      setErrors([
        {
          type: "error",
          message: "Error interno al ejecutar el código",
          line: 0,
          column: 0,
        },
      ]);
    } finally {
      setIsExecuting(false);
    }
  };

  const handleClear = () => {
    setCode("");
    setOutput("// Salida del código aquí...");
    setErrors([]);
  };

  return {
    code,
    errors,
    output,
    isExecuting,
    handleCodeChange,
    handleExecute,
    handleClear,
  };
};
