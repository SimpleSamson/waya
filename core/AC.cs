using System;
namespace AssemblyCSharp.scripts
{
    public class AC
    {
        public AC()
        {
        }
        private void Capacitor()
        {
            double Current(double Capacitance, double VoltageStart, double VoltageEnd, double TimeEnd, double TimeStart)
            {
                double It = Capacitance * ((VoltageEnd - VoltageStart) / (TimeEnd - TimeStart));
                return It;
            }
            double VoltageAtTime(double Voltage, float time, double angularFrequency, double phase)
            {
                double vt = Voltage * Math.Sin((angularFrequency * time) + phase);
                return vt;
            }
            double CurrentAtTime(double Voltage, double angularFrequency, float time, double phase)
            {
                double it = Voltage * angularFrequency * Math.Cos((angularFrequency * time) + phase);
                return it;
            }
        }
        private void Inductor()
        {
            double Voltage(double time, double currentStart, double currentFinal, double timeStart, float timeFinal, double numberCoilTurns)
            {
                double vt = ((numberCoilTurns * currentFinal) - (numberCoilTurns * currentStart)) / (timeFinal - timeStart); //derivatives are tricky
                return vt;
            }
        }
    }
}
