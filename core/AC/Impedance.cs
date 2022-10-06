using System;
namespace AssemblyCSharp.scripts.AC
{
    public class Impedance
    {
        double ZBar;

        public double Quantity(double Voltage, double Current)
        {
            ZBar = Voltage / Current;
            return ZBar;
        }
        public double Quantity(double Resistance, double Reactance, double Imaginary)
        {
            ZBar = Resistance + (Imaginary * Reactance);
            return ZBar;
        }
        //public double QuantityAtFrequency(double Resistance, double Reactance, double frequency, double frequency)
        //{
        //}
        public double QuantityR(double Resistance)
        {
            ZBar = Resistance;
            return ZBar;
        }

    }
}
