class Impedance {
}
double? ZBar;

double? Quantity(double Voltage, double Current){
    ZBar = Voltage /Current;
    return ZBar;
}
double? Quantity2(double Resistance, double Reactance, double Imaginary){
  ZBar = Resistance + (Imaginary * Reactance);
  return ZBar;
}
// double QuantityAtFrequency(double Resistance, double Reactance, double Frequency){
//
// }
double? QuantityR(double Resistance){
  ZBar = Resistance;
  return ZBar;
}