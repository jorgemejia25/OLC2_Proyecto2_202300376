using analyzer;
using Symbols;

namespace api.Common
{
    /// <summary>
    /// Clase para manejar el flujo de control del programa (break, continue y return).
    /// </summary>
    public class ControlFlow
    {
        /// <summary>
        /// Indica si se debe retornar un valor.
        /// </summary>
        public bool ShouldReturn { get; set; } = false;

        /// <summary>
        /// Valor a retornar.
        /// </summary>
        public ValueWrapper ReturnValue { get; set; } = ValueWrapper.Nil;

        /// <summary>
        /// Indica si se debe hacer break.
        /// </summary>
        public bool ShouldBreak { get; set; } = false;

        /// <summary>
        /// Indica si se debe hacer continue.
        /// </summary>
        public bool ShouldContinue { get; set; } = false;

        /// <summary>
        /// Activa la señal para salir del bucle actual (break).
        /// </summary>
        public void Break()
        {
            ShouldBreak = true;
        }

        /// <summary>
        /// Activa la señal para continuar a la siguiente iteración del bucle (continue).
        /// </summary>
        public void Continue()
        {
            ShouldContinue = true;
        }

        /// <summary>
        /// Activa la señal de retorno con el valor especificado.
        /// </summary>
        public void Return(ValueWrapper value)
        {
            ShouldReturn = true;
            ReturnValue = value ?? ValueWrapper.Nil;
        }

        /// <summary>
        /// Activa la señal de retorno sin valor (retorno nil).
        /// </summary>
        public void ReturnVoid()
        {
            ShouldReturn = true;
            ReturnValue = ValueWrapper.Nil;
        }

        /// <summary>
        /// Reinicia todos los flags de control de flujo.
        /// </summary>
        public void Reset()
        {
            ShouldReturn = false;
            ReturnValue = ValueWrapper.Nil;
            ShouldBreak = false;
            ShouldContinue = false;
        }

        /// <summary>
        /// Guarda una copia del estado actual del flujo de control.
        /// </summary>
        /// <returns>Una copia del estado actual.</returns>
        public ControlFlowState SaveState()
        {
            return new ControlFlowState
            {
                ShouldReturn = this.ShouldReturn,
                ReturnValue = this.ReturnValue,
                ShouldBreak = this.ShouldBreak,
                ShouldContinue = this.ShouldContinue
            };
        }

        /// <summary>
        /// Restaura el estado del flujo de control desde una copia guardada.
        /// </summary>
        /// <param name="state">El estado a restaurar.</param>
        public void RestoreState(ControlFlowState state)
        {
            this.ShouldReturn = state.ShouldReturn;
            this.ReturnValue = state.ReturnValue;
            this.ShouldBreak = state.ShouldBreak;
            this.ShouldContinue = state.ShouldContinue;
        }
    }

    /// <summary>
    /// Clase para guardar el estado del flujo de control.
    /// </summary>
    public class ControlFlowState
    {
        public bool ShouldReturn { get; set; }
        public ValueWrapper ReturnValue { get; set; }
        public bool ShouldBreak { get; set; }
        public bool ShouldContinue { get; set; }
    }
}
