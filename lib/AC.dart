import 'dart:async';
import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:waya/globalFx.dart';

final CapacitanceController = TextEditingController();
final VoltageStartController = TextEditingController();
final VoltageEndController = TextEditingController();
final TimeEndController = TextEditingController();
final TimeStartController = TextEditingController();

final VoltageController = TextEditingController();
final TimeController = TextEditingController();
final AngularFrequencyController = TextEditingController();
final PhaseController = TextEditingController();

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
      body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                ],
              ),
            ),
    );
  }
}
Future calculations() async{
  double Capacitance = CapacitanceController.text as double;
  double VoltageStart = VoltageStartController.text as double;
  double VoltageEnd = VoltageEndController.text as double;
  double TimeEnd = TimeEndController.text as double;
  double TimeStart = TimeEndController.text as double;

  double Voltage = VoltageController.text as double;
  double Time = TimeController.text as double;
  double AngularFrequency = AngularFrequencyController.text as double;
  double Phase = PhaseController.text as double;
  double Current = Capacitance * ((VoltageEnd - VoltageStart) / (TimeEnd - TimeStart));
  if(VoltageAtTime.toString() as double > 0) {
    double VoltageAtTime = Voltage * sin((AngularFrequency * Time) + Phase);
  }
  if(CurrentAtTime.toString() as double > 0) {
    double CurrentAtTime = Voltage * AngularFrequency *
        cos((AngularFrequency * Time) + Phase);
  }
}

class Capacitor extends StatefulWidget{
  State<StatefulWidget> createState() => _CapacitorState();
}
class _CapacitorState extends State<Capacitor>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: wayaTitle()),
      body: ListView(
        children:<Widget>[
          ListTile(
              minLeadingWidth: 35,
              title: Card(
                elevation: 7.0,
                child: Column(
                  children: [
                    Image.asset(
                      'images/1.png',
                      width: 49,
                      height: 49,
                    ),
                    Text("Capacitors"),
                    TextButton.icon(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Capacitor()));
                        },
                        icon: Icon(Icons.calculate_rounded),
                        label: const Text("CALCULATE")
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Capacitor())
                );
              }
          ),
          ListTile(
              minLeadingWidth: 35,
              title: Card(
                elevation: 7.0,
                child: Column(
                  children: [
                    Image.asset(
                      'images/11.png',
                      width: 49,
                      height: 49,
                    ),
                    Text("Capacitor Writing"),
                    TextButton.icon(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => CapacitorWriting()));
                        },
                        icon: Icon(Icons.calculate_rounded),
                        label: const Text("CALCULATE")
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CapacitorWriting())
                );
              }
          ),
        ]
      )
    );
  }
}

class CapacitorWriting extends StatefulWidget {
  State<StatefulWidget> createState() => _CapacitorWritingState();
}
class _CapacitorWritingState extends State<CapacitorWriting>{
  final capacitorDigitsController = TextEditingController();

  var capacitorFaceVal;
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: wayaTitle()),
      body: Padding(padding: const EdgeInsets.all(17),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.number,
              controller: capacitorDigitsController,
              decoration:const InputDecoration(
                hintText:'enter values',
                labelText: 'values',
              )
            ),
            ElevatedButton(onPressed:(){
              capacitorCalculatedValue(capacitorDigitsController.text);
              showDialog(context: context, builder: (BuildContext context){
                return AlertDialog(
                  title: const Text('Capacitor Value'),
                  content: Text(
                      '$capacitorFaceVal'
                          )
                );
              });
            }
                , child: const Text('CALCULATE'))
          ]
        )
      )
    );
  }

  void capacitorCalculatedValue(String digitsOnCapacitor) {
    //for 3 digit code
    List<dynamic> digits = digitsOnCapacitor.split('');//.cast<int>();
    var multiplierPosition= digits.length - 1;
    double multiplierExponent = double.parse(digits[multiplierPosition]);
    num x = pow(10, multiplierExponent);//.toString();
    capacitorFaceVal = x;//(capacitorCalculatedValue(capacitorDigitsController.text)).toString()
  }
}
class Capacitance extends StatefulWidget{
  State<StatefulWidget> createState() => _CapacitanceState();
}
class _CapacitanceState extends State<Capacitance>{
  bool visible = false;
  final CapacitorChargeController = TextEditingController();
  final CapacitorVoltageController = TextEditingController();

  @override
  Widget build(BuildContext context){
    String dropdownValue = 'Current';
    return Scaffold(
      appBar: AppBar(title: wayaTitle()),
      body: Padding(padding: const EdgeInsets.all(17),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Icon(Icons.calculate_outlined, size: 70,),
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical:17, horizontal:17)),
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
