export interface SymbolInfo {
  id: string;
  tipoSimbolo: string;
  tipoDato: string;
  entorno: string;
  linea: number;
  columna: number;
}

export async function getSymbols(): Promise<SymbolInfo[]> {
  const response = await fetch("http://localhost:5023/compile/symbols");
  const data = await response.json();
  return data as SymbolInfo[];
}
