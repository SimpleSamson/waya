import 'dart:async';
import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:waya/globalFx.dart';
//import 'package:waya/main.dart';

//current
final CapacitanceController = TextEditingController();
final VoltageStartController = TextEditingController();
final VoltageEndController = TextEditingController();
final TimeEndController = TextEditingController();
final TimeStartController = TextEditingController();

//voltage at time
final VoltageController = TextEditingController();
final TimeController = TextEditingController();
final AngularFrequencyController = TextEditingController();
final PhaseController = TextEditingController();
//current at time values same as voltage at time
//inductor voltage calc
final CurrentStartController = TextEditingController();
final CurrentFinalController = TextEditingController();
final NumberCoilTurnsController = TextEditingController();

final Future<Double> CurrentAtTime = Future.delayed(const Duration(seconds: 3));
final Future<Double> Time = Future.delayed(const Duration(seconds: 5));
final Future<Double> VoltageAtTime = Future.delayed(const Duration(seconds : 2));
final Future<Double> Current = Future.delayed(const Duration(seconds: 3));

class AC extends StatefulWidget{
  const AC({Key? key}):super(key: key);

  State<StatefulWidget> createState() => _ACChoices();
}
class _ACChoices extends State<AC>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: wayaTitle(),),
      body: //Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.center,
        //children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('images/1.png', width: 191, height: 151,),
                  Text("Capacitors"),
                  TextButton.icon(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Capacitor()));
                  }, icon: Icon(Icons.calculate), label: const Text(""))
                ],
              ),
            ),
//        ],
//      ),
    );
  }
}
Future calculations() async{
  //current
  double Capacitance = CapacitanceController.text as double;
  double VoltageStart = VoltageStartController.text as double;
  double VoltageEnd = VoltageEndController.text as double;
  double TimeEnd = TimeEndController.text as double;
  double TimeStart = TimeEndController.text as double;

  //voltage at time
  double Voltage = VoltageController.text as double;
  double Time = TimeController.text as double;
  double AngularFrequency = AngularFrequencyController.text as double;
  double Phase = PhaseController.text as double;

  //current
  double Current = Capacitance * ((VoltageEnd - VoltageStart) / (TimeEnd - TimeStart));

  //voltage at time
  if(VoltageAtTime.toString() as double > 0) {
//      setState(() {
//        visible = true;
//      });
    double VoltageAtTime = Voltage * sin((AngularFrequency * Time) + Phase);
  }
  //current at time
  if(CurrentAtTime.toString() as double > 0) {
//      setState(() {
//        visible = true;
//      });
    double CurrentAtTime = Voltage * AngularFrequency *
        cos((AngularFrequency * Time) + Phase);
  }
}

class Capacitor extends StatefulWidget{
//  var CurrentAtTime = 0;

  State<StatefulWidget> createState() => _CapacitorState();
}
class _CapacitorState extends State<Capacitor>{
  bool visible = false;
  final CapacitorChargeController = TextEditingController();
  final CapacitorVoltageController = TextEditingController();

  @override
  Widget build(BuildContext context){
    String dropdownValue = 'Current';
    return Scaffold(
      body: Padding(padding: const EdgeInsets.all(17),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Icon(Icons.calculate_outlined, size: 70,),
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical:17, horizontal:17)),
            // DropdownButton(
            //   value:  dropdownValue,
            //     icon: const Icon(Icons.arrow_drop_down),
            //     iconSize: 17,
            //     elevation: 17,
            //     style: const TextStyle(color: Colors.black),
            //
            //     onChanged: (String? newValue){
            //       setState((){
            //         dropdownValue = newValue!;
            //       });
            //       if(newValue == 0){
            //         CurrentCalculator();
            //       }
            //       if(newValue == 1){
            //         VoltageAtTimeCalculator();
            //       }
            //       if(newValue == 2){
            //         CurrentAtTimeCalculator();
            //       }
            //     },
            //     items: <String>['Current', 'Voltage At Time', 'Current At Time']
            //         .map<DropdownMenuItem<String>>((String value){
            //           return DropdownMenuItem<String>(
            //               value: value,
            //               child: Text(value),
            //           );
            //     })
            //     .toList(),
            // ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: CapacitorChargeController,
              decoration: const InputDecoration(
                hintText: 'Farads',
                labelText: 'Charge',
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: CapacitorVoltageController,
              decoration: const InputDecoration(
                hintText: 'Volts',
                labelText: 'Voltage'
              ),
            ),
            ElevatedButton(onPressed: (){
              showDialog(context: context, builder: (BuildContext context){
                return AlertDialog(
                  title: Text('Capacitance'),
                  content: Text(calculateCapacitance().toString() + ' C'),
                );
              });
            }, child: Text('CALCULATE'))
          ],
        ),
      ),
    );
  }
//
//  DropdownMenuItem<String> itemChoice(value) {
  Widget? itemChoice(value) {
    if(value == 1){
      return DropdownMenuItem<String>(
        value: value,
        child: Text('Current'),
        onTap: (){CurrentCalculator();},
      );
    }

    if(value == 2){
      return DropdownMenuItem<String>(
        value: value,
        child: Text('Current'),
        onTap: (){VoltageAtTimeCalculator();},
      );
    }

    if(value == 2){
      return DropdownMenuItem<String>(
        value: value,
        child: Text('Current'),
        onTap: (){VoltageAtTimeCalculator();},
      );
    }
  }

  calculateCapacitance(){
    double Q = double.parse(CapacitorChargeController.text);
    double V = double.parse(CapacitorVoltageController.text);
    double Capacitance = Q * V;
    return Capacitance;
  }
  }
class CurrentAtTimeCalculator extends State<Capacitor> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(child: Column(
      children: <Widget>[
        TextFormField(
          controller: VoltageController,
          decoration: const InputDecoration(
            labelText: 'Voltage',
          ),
        ),
        TextFormField(
          controller: AngularFrequencyController,
          decoration: const InputDecoration(
            labelText: 'Angular Frequency',
          ),
        ),
        TextFormField(
          controller: PhaseController,
          decoration: const InputDecoration(
            labelText: 'Phase',
          ),
        ),
        ElevatedButton.icon(
            onPressed: (){
              calculations();
              showDialog(context: context, builder: (BuildContext context){
                return AlertDialog(
                  title: new Text('Current At Time ' + Time.toString() + ' is ' + CurrentAtTime.toString()),
                  actions: <Widget>[
                    ElevatedButton(onPressed: (){ Navigator.of(context).pop();}, child: new Text('OK')),
                  ],
                );
              });
              },
            icon: Icon(Icons.calculate_outlined), label: Text('CALCULATE')),
      ],
    ));
  }

}

class VoltageAtTimeCalculator extends State<Capacitor> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(child: Column(
      children: <Widget>[
        TextFormField(
          controller: VoltageController,
          decoration: const InputDecoration(
            labelText: 'Voltage',
          ),
        ),
        TextFormField(
          controller: AngularFrequencyController,
          decoration: const InputDecoration(
            labelText: 'Angular Frequency'
          ),
        ),
        TextFormField(
          controller: PhaseController,
          decoration: const InputDecoration(
            labelText: 'Phase',
          ),
        ),
        ElevatedButton.icon(
          onPressed: (){
            calculations();
            showDialog(context: context, builder: (BuildContext context){
              return AlertDialog(
                title: new Text('Voltage At Time ' + Time.toString() + ' is ' + VoltageAtTime.toString()),
              );
            });
          },
          icon: Icon(Icons.calculate_outlined),
          label: Text('Calculate'),
        ),
      ],
    ),);
    throw UnimplementedError();
  }
}

class CurrentCalculator extends State<Capacitor>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(child: Column(
      children: <Widget>[
        TextFormField(
          controller: CapacitanceController,
          decoration: const InputDecoration(
            labelText: 'Capacitance',
          ),
        ),
        TextFormField(
          controller: VoltageStartController,
          decoration: const InputDecoration(
            labelText: 'Starting Voltage',
          ),
        ),
        TextFormField(
          controller: VoltageEndController,
          decoration: const InputDecoration(
            labelText: 'End Voltage',
          ),
        ),
        TextFormField(
          controller: TimeStartController,
          decoration: const InputDecoration(
            labelText: 'Time Start'
          ),
        ),
        TextFormField(
          controller: TimeEndController,
          decoration: const InputDecoration(
            labelText: 'Time End'
          ),
        ),
        ElevatedButton.icon(
            onPressed: (){
              calculations();
              showDialog(context: context, builder: (BuildContext context){
                return AlertDialog(
                  title: new Text('Current is ' + Current.toString()),
                  actions: <Widget>[
                    ElevatedButton(onPressed: (){ Navigator.of(context).pop();}, child: new Text('OK'))
                  ],
                );
              });
            },
            icon: Icon(Icons.calculate_outlined),
            label: Text('CALCULATE')),
      ],
    ));
  }
}
//inductor
//========
class _Inductor extends State<AC>{
  final Future<Double> InductorVoltage = Future.delayed(const Duration(seconds: 7));
  final Future<Double> Time = Future.delayed(const Duration(seconds:3));
  final Future<Double> CurrentStart = Future.delayed(const Duration(seconds:3));
  final Future<Double> CurrentFinal = Future.delayed(const Duration(seconds:3));
  final Future<Double> TimeStart = Future.delayed(const Duration(seconds:3));
  final Future<Double> TimeFinal = Future.delayed(const Duration(seconds:3));
  final Future<Double> NumberCoilTurns = Future.delayed(const Duration(seconds:3));

  bool visible = false;

  Future calculationCurrent() async{
    double Time = TimeController.text as double;
    double CurrentStart = CurrentStartController.text as double;
    double CurrentFinal = CurrentFinalController.text as double;
    double TimeStart = TimeStartController.text as double;
    double TimeFinal = TimeEndController.text as double;
    double NumberCoilTurns = NumberCoilTurnsController.text as double;

    if(NumberCoilTurns.toString() as double > 0){
      setState(() {
        visible = true;
      });
      double InductorVoltage = ((NumberCoilTurns * CurrentFinal) - (NumberCoilTurns * CurrentStart)) / (TimeFinal - TimeStart);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          children: <Widget>[
            Center(
              child: Text('Inductor Voltage'),
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 17)),
            TextFormField(
              controller: NumberCoilTurnsController,
              decoration: const InputDecoration(
                labelText: 'Coil Turns',
                hintText: 'Number',
              ),
            ),
            TextFormField(
              controller: CurrentFinalController,
              decoration: const InputDecoration(
                labelText: 'Final Current',
                hintText: 'Amperes'
              ),
            ),
            TextFormField(
              controller: CurrentStartController,
              decoration: const InputDecoration(
                labelText: 'Start Current',
                hintText: 'Amperes',
              ),
            ),
            TextFormField(
              controller: TimeEndController,
              decoration: const InputDecoration(
                labelText: 'Final Time',
                hintText: 'seconds',
              ),
            ),
            TextFormField(
              controller: TimeStartController,
              decoration: const InputDecoration(
                labelText: 'Start Time',
                hintText: 'seconds',
              ),
            ),
            ElevatedButton.icon(
                onPressed: (){
                  calculationCurrent();
                  showDialog(context: context, builder: (BuildContext context){
                    return AlertDialog(
                      title: new Text('Voltage is' + InductorVoltage.toString()),
                      actions: <Widget>[
                        ElevatedButton(onPressed: (){ Navigator.of(context).pop();}, child: new Text('OK')),
                      ],
                    );
                  });
                },
                icon: Icon(Icons.calculate_outlined),
                label: Text('CALCULATE')
            ),
          ],
        ),
      ),
    );
  }

}