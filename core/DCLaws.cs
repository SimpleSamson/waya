using System;
namespace AssemblyCSharp.scripts
{
    public class DCLaws
    {
        public DCLaws()
        {
        }
        public class OhmsLaw
        {
            double Voltage(double Current, double Resistance)
            {
                double V = Current * Resistance;
                return V;
            }
            double Resistance( double Voltage, double Current)
            {
                double R = Voltage / Current;
                return R;
            }
            double Current(double Voltage, double Resistance)
            {
                double I = Voltage / Resistance;
                return I;
            }
        }
        public string KirschoffCurrentLaw(double CurrentIn, double CurrentOut)
        {
            string e = "ERROR: The input and output current have to result in a zero sum value";
            double It = CurrentOut - CurrentIn;
            if (It > 0)
            {
                 return e;
            } else return "circuit obeys law";
//            return It;
        }
        public string KirschoffVoltageLaw(double VoltageIn, double VoltageOut)
        {
            string e = "ERROR: The input and output voltage have to result in a zero sum value";
            double Vt = VoltageOut - VoltageIn;
            if (Vt > 0)
            {
                return e;
            }
            else return "circuit obeys Kirchoff's Voltage Law";
        }
    }
}
