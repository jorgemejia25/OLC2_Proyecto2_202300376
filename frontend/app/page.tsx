"use client";

import CodeEditor from "@/components/CodeEditor";
import Navbar from "@/components/Navbar";
import { Ubuntu } from "next/font/google";
import { postAST } from "@/actions/postAST";
import { useCodeEditor } from "@/hooks/useCodeEditor";
import { useState } from "react";

const ubuntu = Ubuntu({
  subsets: ["latin"],
  weight: ["400", "500", "700"],
});

export default function Home() {
  const { code, output, errors, handleCodeChange, handleExecute, handleClear } =
    useCodeEditor();

  const [isAST, setIsAST] = useState(false);
  const [astSVG, setAstSVG] = useState("");

  const handleImport = (fileContent: string) => {
    handleCodeChange(fileContent);
  };

  const handleAST = async () => {
    if (!isAST) {
      // Si vamos a activar AST, cargamos el SVG
      try {
        const svg = await postAST(code);
        setAstSVG(svg);
        setIsAST(true);
      } catch (error) {
        console.error("Error al obtener el AST:", error);
      }
    } else {
      // Si desactivamos AST, limpiamos el SVG
      setIsAST(false);
      setAstSVG("");
    }
  };

  const executeWithConsole = () => {
    setIsAST(false);
    setAstSVG("");
    handleExecute();
  };

  return (
    <div className="flex flex-col items-start justify-between min-h-screen px-20 pt-28 pb-6 gap-16 font-[family-name:var(--font-geist-sans)]">
      <Navbar
        onExecute={executeWithConsole}
        onClear={handleClear}
        onImport={handleImport}
        onAST={handleAST}
      />
      <main className="flex flex-col gap-5 w-full">
        <h1 className="text-6xl font-bold">Proyecto 1</h1>
        <h1 className="text-2xl text-gray-500">
          Organización de lenguajes y compiladores 2
        </h1>
        <span className="mt-5" />
        <CodeEditor
          output={output}
          onCodeChange={handleCodeChange}
          code={code}
          errors={errors}
          isAST={isAST}
          astSVG={astSVG}
        />
        {errors.length > 0 && (
          <div
            className={`w-full p-4 pt-4 pb-10 rounded-xl cursor-default bg-zinc-900 text-gray-300 ${ubuntu.className}`}
          >
            <div className="mb-5 uppercase flex gap-2 items-center text-sm pb-2 w-fit">
              Problemas
              <span className="text-xs px-3 py-0.5 bg-indigo-500 rounded-full">
                {errors.length}
              </span>
            </div>
            <div className="space-y-2">
              {errors.map((error, index) => (
                <div key={index} className="flex flex-row gap-2">
                  <p className="text-red-300">{error.type}</p>
                  <p>{error.message}</p>
                  <p className="text-gray-500 ml-2">
                    {error.line > 0
                      ? `Línea ${error.line}, columna ${error.column}`
                      : ""}
                  </p>
                </div>
              ))}
            </div>
          </div>
        )}
      </main>
      <footer className="text-center text-gray-500 w-full">
        Jorge Mejía - 202300376
      </footer>
    </div>
  );
}
