import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waya/globalFx.dart';

  final double electronCharge = 1.60217663 * pow(10, -19);
  final double boltzmannsConstant = 1.38064852 * pow(10, -23);
  final SaturationCurrentController = TextEditingController();
  final DiodeVoltageController = TextEditingController();
  final IdealityFactorController = TextEditingController();
  final ThermalVoltageController = TextEditingController();
  final ElectronChargeController = TextEditingController();
  final TemperatureController = TextEditingController();
  final BoltzmannConstantController = TextEditingController();
  final ElectronChargeController2 = TextEditingController();
  final TemperatureController2 = TextEditingController();
class diode extends StatefulWidget{
  Future calculations() async {
    double current(){
      double SaturationCurrent = SaturationCurrentController.text as double;
      double DiodeVoltage = DiodeVoltageController.text as double;
      double IdealityFactor = IdealityFactorController.text as double;
      double ThermalVoltage = ThermalVoltageController.text as double;
      double ElectronCharge = ElectronChargeController.text as double;
      double Temperature = TemperatureController.text as double;

      //TODO get these values from user
      double Is = SaturationCurrent *
          (exp(DiodeVoltage / (IdealityFactor * ThermalVoltage))) -
          SaturationCurrent;
      return Is;
    }
    double ThermalVoltage(){
      double Temperature = TemperatureController.text as double;
      double ElectronCharge = ElectronChargeController.text as double;
      double T = boltzmannsConstant * Temperature / ElectronCharge;
      return T;
    }
  }

  @override
  State<StatefulWidget> createState() => _diodeState();
}

class _diodeState extends State<diode> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: wayaTitle(),),
        body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 17),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
              child:
              Form(
                child: Column(
                children: <Widget>[
                  Image.asset('images/4.png', width: 71, height: 71),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: SaturationCurrentController,
                    decoration: const InputDecoration(
                      hintText: 'Saturation Current Value',
                      labelText: 'Saturation Current',
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: DiodeVoltageController,
                    decoration: InputDecoration(label: const Text("Diode Voltage"), hintText: "Enter the Diode Voltage"),
                    ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: IdealityFactorController,
                    decoration: const InputDecoration(
                      hintText: 'Ideality Factor Value',
                      labelText: 'Ideality Factor',
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: ThermalVoltageController,
                          decoration: const InputDecoration(
                            hintText: 'Thermal Voltage Value',
                            labelText: 'Thermal Voltage',
                          ),
                        ),
                      ),
                      Flexible(
                        child: ElevatedButton.icon(
                          onPressed: (){
                              showDialog(context: context, builder: (BuildContext context){
                                return thermV();
                              });
                          }, icon: Icon(CupertinoIcons.question), label: Text('')
                        ),),
                    ],
                  ),


                TextFormField(
//                    keyboardType: TextInputType.number,
                    controller: ElectronChargeController,
                    decoration: const InputDecoration(
                      hintText: 'Electron Charge Value (C)',
                      labelText: 'Electron Charge',
                    ),
//                    initialValue: '$electronCharge',
                  ),
                  TextFormField(
//                    keyboardType: TextInputType.number,
                    controller: BoltzmannConstantController,
                    decoration: const InputDecoration(
                      hintText: 'Boltzmann Constant Value',
                      labelText: 'Boltzmann Constant(m^2 kg s^-2 K^-1)',
                    ),
//                    initialValue: '$boltzmannsConstant',
                  ),
                  // TextFormField(
                  //   controller: TemperatureController,
                  //   decoration: InputDecoration(label: const Text("Temperature"), hintText: "Enter the Temperature"),
                  //   ),
                  ElevatedButton.icon(onPressed: (){
                    showDialog(context: context, builder: (BuildContext context){
                      return AlertDialog(
                        title: Text('Current'),
                        content: Text(calculatedValue().toString()),
                      );
                    });
                  }, icon: Icon(Icons.calculate_outlined), label: Text('CALCULATE')),
            ]),
          ),
              )],
    ));
  }

  calculatedValue() {
    double SC = double.parse(SaturationCurrentController.text);
    double DV = double.parse(DiodeVoltageController.text);
    double IF = double.parse(IdealityFactorController.text);
    double TV = double.parse(ThermalVoltageController.text);
    double Current = SC * (DV/(IF * TV)) - SC;
    return Current;
//    TODO calculate the thermal voltage and place a button for a dialog to calculate this and return it to the equation
  }

 thermV() {
//  String BCHolder = BoltzmannConstantController.text;

//  double Temp = TemperatureController.text as double;
  double Temp = double.parse(TemperatureController2.text);
//  y(){if(BCHolder != null){ return '$boltzmannsConstant';}}
//  double BC = y() as double;
//  double eC = ElectronChargeController.text as double;
  double eC = double.parse(ElectronChargeController2.text);
  double ThermalVoltage = boltzmannsConstant * Temp / eC;

   Future? ThermAlertDialog() async{
     return AlertDialog(
     title: new Text(ThermalVoltage.toString()),
     actions: <Widget>[
       ElevatedButton(
           onPressed: (){
             Navigator.of(context).pop();
           },
           child: new Text('OK'))],
     );
   }

   return AlertDialog(
    content: Form(
        child: Column(
          children: [
            TextFormField(controller: TemperatureController2, decoration: InputDecoration(
              labelText: 'Temperature', hintText: 'K',
            ),),
            TextFormField(controller: ElectronChargeController2, decoration: InputDecoration(
              labelText: 'Electron Charge', hintText: 'C'
            ),)
          ],)),
    actions: [ElevatedButton(onPressed: (){ ThermAlertDialog();}, child: Text('CALCULATE'))],
  );
}

//  Widget thermV() {

//  }
}
