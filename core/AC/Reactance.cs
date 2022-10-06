using System;
namespace AssemblyCSharp.scripts.AC
{
    public class Reactance
    {
        double X;
        public Reactance()
        {
        }
        /// <summary>
        /// Quantity of Inductive reactance.
        /// </summary>
        /// <returns>The Inductive Reactance.</returns>
        /// <param name="frequency">Frequency.</param>
        /// <param name="Inductance">Inductance in Henries.</param>
        public double QuantityL(double frequency, double Inductance)
        {
            X = frequency * Inductance;
            return X;
        }
        /// <summary>
        /// Quantities the capacitance in F.
        /// </summary>
        /// <returns>The c.</returns>
        /// <param name="frequency">Frequency.</param>
        /// <param name="Capacitance">Capacitance.</param>
        public double QuantityC(double frequency, double Capacitance)
        {
            X = 1 / (frequency * Capacitance);
            return X;
        }

    }
}
