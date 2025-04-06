using System;
using Symbols;
class ReturnException : Exception
{
    public ValueWrapper ReturnValue { get; }

    public ReturnException(ValueWrapper returnValue)
    {
        ReturnValue = returnValue;
    }
}