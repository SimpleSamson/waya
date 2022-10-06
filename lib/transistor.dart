import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:waya/globalFx.dart';
import 'package:waya/main.dart';
class Transistor extends StatefulWidget{
  const Transistor({Key? key}):super(key: key);
  @override
  State<StatefulWidget> createState() => TransistorState();
}
class TransistorState extends State<Transistor>{
  bool visible = false;
  final BaseCurrentController = TextEditingController();
  final EmitterCurrentController = TextEditingController();
  final CollectorCurrentController = TextEditingController();
  final TransistorConstantController = TextEditingController();
  String currentType = 'Choose Current Type';
  var MissingCurrent;

  Operation() {

    setState((){
//      if(BaseCurrent.toString().isNotEmpty){
        //    enter calculation
//    CollectorCurrent = TransistorConstant * BaseCurrent;
//      } else if(EmitterCurrent.toString().isNotEmpty){
//      CollectorCurrent = TransistorConstant * EmitterCurrent;
//        CollCurrent = TransistorConstant * EmitterCurrent;
//      } else if(EmitterCurrent.toString().isNotEmpty && BaseCurrent.toString().isNotEmpty){
//        MissingCurrent = 7777777;
//      }
//      visible = true;
    });
    // CollCurrent = TransistorConstant * BaseCurrent;
    // CollCurrent = TransistorConstant * EmitterCurrent; //this is for dialog box
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar( title: wayaTitle(),),
      body: Padding(padding: const EdgeInsets.symmetric(vertical: 49, horizontal: 49),
      child: Form(child: Column(
        children: <Widget>[
//TODO: uncomment          Padding(padding: EdgeInsets.symmetric(vertical: 2, horizontal: 3), child: Image.asset('transistor.png', width: 170, height: 70),),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: 'Choose Current Type'),
            hint: const Text('Choose Current Type'),
            value: currentType,
            onChanged: (String? newValue){
              setState(() {
                currentType = newValue!;
              });
              },
              items: <String>['Choose Current Type', 'Base Current', 'Collector Current']
          .map<DropdownMenuItem<String>>((String value){
      return DropdownMenuItem(
      value: value,
      child: Text(value),
      );
      }).toList(),
      ),
      TextFormField(
      keyboardType: TextInputType.number,
      controller: BaseCurrentController,
      decoration: const InputDecoration(
        hintText: 'Available Current Value',
        labelText: 'Available Current',
        ),
      ),
      // TextFormField(
      //   keyboardType: TextInputType.number,
      //   controller: EmitterCurrentController,
      //   decoration: const InputDecoration(
      //     hintText: 'Emitter Current',
      //     labelText: 'Emitter Current',
      //   ),
      // ),
      // TextFormField(
      //   keyboardType: TextInputType.number,
      //   controller: CollectorCurrentController,
      //   decoration: const InputDecoration(
      //     hintText: 'Collector Current',
      //     labelText: 'Collector Current',
      //   ),
      // ),
      TextFormField(
      keyboardType: TextInputType.number,
      controller: TransistorConstantController,
      decoration: const InputDecoration(
      hintText: 'Constant used in calculation',
              labelText: 'Transistor Constant',
            ),
          ),
          ElevatedButton.icon(
              onPressed: (){
//                Operation();
//                _resultsFromCalc();
                showDialog(context: context, builder: (BuildContext context){
                  return AlertDialog(
                    title: Text(CurrentType()),
                    content: Text(_resultsFromCalc()), //Text('Collector : ' + CollCurrent.toString()),
                    actions: <Widget>[
                      ElevatedButton(onPressed: (){ Navigator.of(context).pop(); }, child: const Text('OK')),
                    ],
                  );
                });
                },
              icon: Icon(Icons.calculate), label: const Text('Calculate'))
        ],
      )),),
    );
  }
  String _resultsFromCalc() {
    double? BaseCurrent = double.tryParse(BaseCurrentController.text); // as double;
//    double? EmitterCurrent = double.tryParse(EmitterCurrentController.text); // as double;
//    double CollectorCurrent = CollectorCurrentController.text as double;
    double TransistorConstant = double.parse(TransistorConstantController.text); // as double;
//    MissingCurrent = TransistorConstant * BaseCurrent;
      if(BaseCurrent.toString().isNotEmpty && TransistorConstant.toString().isNotEmpty){// && EmitterCurrent.toString().isEmpty && TransistorConstant.toString().isNotEmpty){
    //    enter calculation
        MissingCurrent = TransistorConstant * BaseCurrent!;
        ErrorMsg = '';
      }
//       else if(EmitterCurrent.toString().isNotEmpty){ // && BaseCurrent.toString().isEmpty && TransistorConstant.toString().isNotEmpty){
//         MissingCurrent = TransistorConstant * EmitterCurrent!;
//         ErrorMsg = '';
// //        CollCurrent = TransistorConstant * EmitterCurrent;
//       }
//       else if(EmitterCurrent.toString().isNotEmpty && BaseCurrent.toString().isNotEmpty){
//        ErrorMsg = 'Error : Enter only 1 field value';
//      } else if(EmitterCurrent.toString().isNotEmpty && BaseCurrent.toString().isNotEmpty){
//        ErrorMsg = 'Error : Enter only 1 field value';
//      } else if(TransistorConstant.toString().isEmpty){
//        ErrorMsg = 'Error : Enter a constant';
      else if(BaseCurrent.toString().isEmpty){
        MissingCurrent = 0;
        ErrorMsg = 'Please Enter A Value';
      }
    else if(TransistorConstant.toString().isEmpty){
      MissingCurrent = 0;
      ErrorMsg = 'Please Enter A Constant';
    }

  String x = MissingCurrent.toString() + ErrorMsg!;
  return x;
    // return AlertDialog(
    //     title: Text("Collector Current is"),
    //   content: new Row(
    //     children: [
    //       new Expanded(child: new Text(
    //         "$CollCurrent"
    //       )),
    //     ],
    //   ),
    // ); //CollCurrent.toString();
  }
  String CurrentType(){
    String? resultCurrent;
      if(currentType == 'Base Current'){
        resultCurrent = 'Collector Current';
      } else if(currentType == 'Collector Current'){
        resultCurrent = 'Base Current';
      }
      String x = resultCurrent!;
      return x;
  }
}