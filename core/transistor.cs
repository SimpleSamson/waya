using System;
namespace AssemblyCSharp.scripts
{
    public class transistor
    {
        public transistor()
        {
        }
        void Operation(double BaseCurrent, double EmitterCurrent, double CollectorCurrent, double constant)
        {
            if(BaseCurrent != 0)
            {
                CollectorCurrent = constant * EmitterCurrent;
                CollectorCurrent = constant * BaseCurrent;
            }
        }
    }
}
