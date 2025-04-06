"use server";

import { SymbolInfo, getSymbols } from "@/actions/getSymbols";

import Link from "next/link";
import React from "react";

const SymbolsPage = async () => {
  const data: SymbolInfo[] = await getSymbols();

  return (
    <div className="flex flex-col items-start justify-between min-h-screen px-20 pt-28 pb-6 gap-16 font-[family-name:var(--font-geist-sans)]">
      <nav className="absolute top-0 left-0 w-full flex justify-center items-center py-5">
        <div className="bg-white p-2 pl-5 gap-6 rounded-xl flex items-center justify-center cursor-pointer">
          <p className="font-semibold mr-5">GoLight</p>
          <Link href="/" className="mr-3">
            Ejecutar
          </Link>
        </div>
      </nav>

      <main className="bg-white w-full p-10 rounded-xl">
        <h3 className="text-4xl font-bold">Tabla de simbolos</h3>

        <table className="w-full mt-12 border border-collapse border-gray-100">
          <tr className="border-b border-gray-100">
            <th className="text-left p-2">Nombre</th>
            <th className="text-left p-2">Tipo de Simbolo</th>
            <th className="text-left p-2">Tipo de Dato</th>
            <th className="text-left p-2">Ambito</th>
            <th className="text-left p-2">Linea</th>
            <th className="text-left p-2">Columna</th>
          </tr>
          {data.map((symbol, index) => (
            <tr key={index} className="border-b border-gray-100">
              <td className="p-2">{symbol.id}</td>
              <td className="p-2">{symbol.tipoSimbolo}</td>
              <td className="p-2">{symbol.tipoDato}</td>
              <td className="p-2">{symbol.entorno}</td>
              <td className="p-2">{symbol.linea}</td>
              <td className="p-2">{symbol.columna}</td>
            </tr>
          ))}
        </table>
      </main>
    </div>
  );
};

export default SymbolsPage;
