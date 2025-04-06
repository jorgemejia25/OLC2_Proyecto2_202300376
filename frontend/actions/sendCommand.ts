"use server";

export interface Error {
  type: string;
  message: string;
  line: number;
  column: number;
}

interface CommandResponse {
  output: string;
  errors: Error[];
}

export const sendCommand = async (code: string): Promise<CommandResponse> => {
  try {
    const response = await fetch("http://localhost:5023/compile", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ code }),
    });

    // Ahora todos los errores vienen en la respuesta con código 200
    const data = await response.json();

    // Normalizar la estructura de errores (convertir propiedades a minúsculas)
    const normalizedData: CommandResponse = {
      output: data.output || "",
      errors: Array.isArray(data.errors)
        ? data.errors.map((err) => ({
            type: err.Type?.toLowerCase() || err.type || "desconocido",
            message: err.Message || err.message || "Error desconocido",
            line: err.Line || err.line || 0,
            column: err.Column || err.column || 0,
          }))
        : [],
    };

    return normalizedData;
  } catch (error) {
    console.error("Error al enviar el código:", error);
    // Error de comunicación con el servidor
    return {
      output: "",
      errors: [
        {
          type: "error",
          message: "Error de comunicación con el servidor",
          line: 0,
          column: 0,
        },
      ],
    };
  }
};
