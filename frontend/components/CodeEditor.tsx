"use client";

import Editor, { useMonaco } from "@monaco-editor/react";
import React, { useEffect, useState } from "react";

import { Error } from "@/actions/sendCommand";
import { FC } from "react";
import { Ubuntu } from "next/font/google";

const ubuntu = Ubuntu({
  subsets: ["latin"],
  weight: ["400", "500", "700"],
});

interface CodeEditorProps {
  output: string;
  code?: string;
  errors?: Error[];
  onCodeChange: (code: string) => void;
  isAST?: boolean;
  astSVG?: string;
}

const CodeEditor: FC<CodeEditorProps> = ({
  output,
  onCodeChange,
  code = "",
  errors = [],
  isAST = false,
  astSVG = "",
}) => {
  const monaco = useMonaco();
  const [copied, setCopied] = useState(false);

  useEffect(() => {
    if (!monaco) return;
    // No se necesita configuración adicional ya que Go viene incluido en Monaco
  }, [monaco]);

  // Función para copiar al portapapeles
  const copyToClipboard = () => {
    navigator.clipboard.writeText(output).then(() => {
      setCopied(true);
      setTimeout(() => setCopied(false), 2000); // Resetear después de 2 segundos
    });
  };

  // Configuración de marcadores de error para Monaco Editor
  const getErrorMarkers = () => {
    return errors.map((error) => ({
      startLineNumber: error.line || 1,
      startColumn: error.column || 1,
      endLineNumber: error.line || 1,
      endColumn: (error.column || 1) + 1,
      message: error.message,
      severity: 8, // Error
    }));
  };

  return (
    <div className="grid grid-cols-2 gap-5 w-full h-[60vh]">
      <div className="rounded-xl overflow-hidden w-full h-full">
        <Editor
          height="100%"
          defaultLanguage="go"
          defaultValue={code}
          value={code}
          onChange={(value) => onCodeChange(value || "")}
          theme="vs-dark"
          options={{
            minimap: { enabled: false },
            fontSize: 16,
            padding: { top: 20 },
            formatOnType: true,
            formatOnPaste: true,
            scrollBeyondLastLine: false,
          }}
          onMount={(editor, monaco) => {
            // Configurar marcadores de error cuando se monta el editor
            if (errors.length > 0) {
              monaco.editor.setModelMarkers(
                editor.getModel()!,
                "owner",
                getErrorMarkers()
              );
            }
          }}
        />
      </div>
      {isAST ? (
        <div className="w-full h-full p-8 pt-4 pb-10 rounded-xl overflow-auto bg-gray-100 text-zinc-500">
          <div className="mb-5 uppercase text-xs pb-2 border-b border-b-zinc-800">
            AST (Árbol Sintáctico)
          </div>
          <div
            className="w-full h-full"
            dangerouslySetInnerHTML={{ __html: astSVG }}
          />
        </div>
      ) : (
        <div
          className={`w-full h-full p-8 pt-4 pb-10 rounded-xl overflow-auto cursor-default bg-zinc-900 text-gray-300 ${ubuntu.className}`}
        >
          <div className="mb-5 uppercase text-xs pb-2 border-b border-b-zinc-800">
            <button
              onClick={copyToClipboard}
              className="hover:text-white transition-colors cursor-pointer flex items-center"
            >
              {copied ? "¡Copiado!" : "Copiar salida"}
            </button>
          </div>
          <pre className="whitespace-pre-wrap text-sm">{output}</pre>
        </div>
      )}
    </div>
  );
};

export default CodeEditor;
