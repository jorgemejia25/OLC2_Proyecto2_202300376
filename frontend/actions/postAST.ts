"use server";

export const postAST = async (code: string): Promise<string> => {
  try {
    const response = await fetch("http://localhost:5023/compile/ast", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ code }),
    });
    return await response.text();
  } catch (error) {
    console.error("Error al obtener el AST:", error);
    return "";
  }
};
