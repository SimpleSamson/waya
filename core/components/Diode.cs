using System;
namespace AssemblyCSharp.scripts.components
{
    public class Diode
    {
        public double BoltzmannsConstant = 1.38064852 * Math.Pow(10, -23); //m^2 kg s^-2 K^-1
        public Diode()
        {
        }
        /// <summary>
        /// Current the specified SaturationCurrent, DiodeVoltage, idealityFactor, ThermalVoltage and electronCharge.
        /// </summary>
        /// <returns>The current.</returns>
        /// <param name="SaturationCurrent">Saturation current.</param>
        /// <param name="DiodeVoltage">Diode voltage.</param>
        /// <param name="idealityFactor">Ideality factor.</param>
        /// <param name="ThermalVoltage">Thermal voltage.</param>
        /// <param name="electronCharge">Electron charge.</param>
        public double Current(double SaturationCurrent, double DiodeVoltage, double idealityFactor, double ThermalVoltage, double electronCharge)
        {
            double Is = SaturationCurrent * (Math.Exp(DiodeVoltage / (idealityFactor * ThermalVoltage))) - SaturationCurrent;
            return Is;
        }
        public double ThermalVoltage(double Temperature, double electronCharge) 
        {
            double T = BoltzmannsConstant * Temperature / electronCharge;
            return T;  
        }
    }
}
