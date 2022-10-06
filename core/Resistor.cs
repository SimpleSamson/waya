using UnityEngine;
using System.Collections;
using System.Math;

public class Resistor : MonoBehaviour {
//    public double Resistance;
    public long Resistivity;
    public double Area;
    public bool ArrangementSeries;
    public double Length;

    public double ResistanceA;
    public double ResistanceB;
    public double ToleranceA;
    public double ToleranceB;

    //calculations
    //Voltage = Current * Resistance;
    //Resistance = Voltage /Current;
    //write the different resistance in ohm-meter

    double Resistance(bool ArrangementSeries) {
        double y = 0;
        //for series
        if (ArrangementSeries == true)
        {
            y = Resistivity * Length / Area;
        }

        //for parrallel
        if (ArrangementSeries == false)
        {
            y = (ResistanceA * ResistanceB) / (ResistanceA + ResistanceB);
        }
        return y;
        
    }


    public double Tolerance(double ToleranceA, double ToleranceB) {
        double x = 0;
        //series
        if (ArrangementSeries == true)
        {
            x = ToleranceA + ToleranceB;
        }
        if (ArrangementSeries == false)
        {
            //parallel
            x = ((ToleranceA * ToleranceB * ToleranceB) + (ToleranceA * ToleranceA * ToleranceB)) / ((ToleranceA + ToleranceB) * (ToleranceA + ToleranceB));
        }
            return x; 
        }
    public double SingleResistorVoltageDrop(double ThisResistance, double VoltageIn, double OtherTotalResistance)
    {
        double Vdrop = VoltageIn * ThisResistance / OtherTotalResistance;
        return Vdrop;
    }
    public double ResistorCurrent(double Resistance, double Voltage)
    {
        //TODO: voltage and current divider
        double Ir = Voltage / Resistance;
        return Ir;
    }
    public char ColorCode(string RealColor){
    //Black 0 Brown 1 Red 2 Orange 3 Yellow 4 Green 5 Blue 6 Violet 7 Gray 8 White 9
        if(RealColor == red){
           ColorCode = 0;
           Multiplier =
        }
        if(ColorCode = 1){

        }
    }
}
