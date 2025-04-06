import Link from "next/link";
import React from "react";
import { VscVmRunning } from "react-icons/vsc";

interface NavbarProps {
  onExecute: () => void;
  onClear: () => void;
  onImport: (fileContent: string) => void;
  onAST: () => void;
}

const Navbar: React.FC<NavbarProps> = ({ onExecute, onImport, onAST }) => {
  const handleFileImport = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file) return;
    const reader = new FileReader();
    reader.onload = (ev) => {
      const content = ev.target?.result as string;
      onImport(content);
    };
    reader.readAsText(file);
  };

  return (
    <nav className="absolute top-0 left-0 w-full flex justify-center items-center py-5">
      <div className="bg-white p-2 pl-5 gap-6 rounded-xl flex items-center justify-center cursor-pointer">
        <p className="font-semibold mr-5">GoLight</p>
        <p onClick={() => document.getElementById("fileInput")?.click()}>
          Importar
        </p>
        <input
          id="fileInput"
          type="file"
          accept=".glt"
          className="hidden"
          onChange={handleFileImport}
          aria-label="Importar"
        />
        <Link href="/symbols">Símbolos</Link>
        <button
          className="bg-gray-200  p-2 px-3 rounded-lg flex items-center justify-center"
          type="button"
          onClick={onAST}
        >
          AST
        </button>
        <button
          type="button"
          className="bg-black text-white p-2 px-3 rounded-lg flex items-center justify-center"
          onClick={onExecute}
        >
          Ejecutar
          <VscVmRunning className="inline ml-2" />
        </button>
      </div>
    </nav>
  );
};

export default Navbar;
