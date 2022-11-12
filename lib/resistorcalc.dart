import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:math';
import 'globalFx.dart';
//TODO: check against resistor_color.dart and remove one file
class ColorBand { //TODO add this so that color band can simply derive values
  int? Digit;
  double? multiplier;
  double? tolerance;
  ColorBand(int? Digit, double? multiplier, double? tolerance){
    this.Digit = Digit; // = Digit;
    this.multiplier = multiplier;
    this.tolerance = tolerance;
  }
}
class ResistorCalc extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ResistorCalcState();
  }
}
//TODO: change the number of color bands with user input
class ResistorCalcState extends State<ResistorCalc>{
  final _ResistorFormKey2 = GlobalKey<FormState>();

  Color ColorBand1 = Colors.yellow;
  Color ColorBand2 = Colors.orange;
  //colorbands
  String cb1dropdownValue = 'Red';
  String cb2dropdownValue = 'Red';
  String cb3dropdownValue = 'Red';
  String cb4dropdownValue = 'Red';
  String cb5dropdownValue = 'Red';
  String cb6dropdownValue = 'Red';
  String cb7dropdownValue = 'Red';

  double? ResistorCBValue;// = 1;
  double? ToleranceCBValue; // = 1;
//  final ResistorCBValue =
  Future calcResistor() async {
    //digits in value
    ColorBand x;
    String cb1;
    String cb2;
    String cb3;
    String cb4;
    String cb5;
    String cb6;
    String cb7;

    ColorBand? ColorToValue(String value){
      if(value == 'Black') {
        return ColorBand(0, 1, null);
      } else if(value == 'Brown') {
        return ColorBand(1, 10, 1);
      } else if(value == 'Red') {
        return ColorBand(2, 100, 2);
      }else if(value == 'Orange') {
        return ColorBand(3, 1000, null);
      }else if(value == 'Yellow') {
        return ColorBand(4, 10000, null);
      }else if(value == 'Green') {
        return ColorBand(5, 100000, 0.5);
      }else if(value == 'Blue') {
        return ColorBand(6, 1000000, 0.25);
      } else if(value == 'Violet'){
        return ColorBand(7, null, 0.1);
      }else if(value == 'Grey'){
        return ColorBand(8, null, null);
      }else if(value == 'White'){
        return ColorBand(9, null, null);
      }else if(value == 'Gold'){
        return ColorBand(null, 0.1, 5);
      }else if(value == 'Silver'){
        return ColorBand(null, 0.01, 10);
      } else if(value == 'absent'){
        return null;
      }
    }
    int exponentM = (ColorToValue(cb4dropdownValue.toString())!.multiplier!).toInt();// as int;//) as num;
    int multiplyByThisValue = pow(10, exponentM) as int; // to get number of zeros try to concatenate this number of zeros
    print('exponent ${exponentM}');
    print('multiply ${multiplyByThisValue}');
    ResistorCBValue = ((
        ColorToValue(cb1dropdownValue)!.Digit!
        + (int.parse(ColorToValue(cb2dropdownValue)!.Digit!.toString()))// as double)
        + ColorToValue(cb3dropdownValue)!.Digit!
    ) * multiplyByThisValue)/1.floor(); // NOTE: '/1.floor()' is to turn the number into a double to avoid cast error ;

    //in case of 4 bands the 4th band is used as tolerance
    ToleranceCBValue = (cb5dropdownValue.toString() != 'absent') ? ColorToValue(cb5dropdownValue.toString())!.tolerance : ColorToValue(cb4dropdownValue.toString())!.tolerance;
//      } else return null;
    //  }
    print('tolerance: ${ToleranceCBValue}'); //check here how to display on screen instead of default value
    print('${ResistorCBValue}');
  }
  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: wayaTitle(),
      ),
      body: ListView(
        children: [Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 2, horizontal: 3), child: Image.asset('images/resistor.1.2.png' ,width: 190, height: 170),),
          Form(
              child: Column(
                children: <Widget>[
                  /*
              todo add a dropdown for number of cb then create the dropdowns accordingly
               for(i<noOfBands){
                 create new dropdown with cb$index as value
               }
               */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Color Band 1 : '),
                      DropdownButton<String>(
                        value: cb1dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                        iconSize: 17,
                        elevation: 17,
                        style: const TextStyle(color: Colors.black),

                        onChanged: (String? newValue){
                          setState((){
                            cb1dropdownValue = newValue!;
                          });
                        },
                        items: <String>['Black', 'Brown', 'Red', 'Orange', 'Green', 'Blue', 'Violet', 'Grey', 'White', 'Gold', 'Silver', 'Absent']
                            .map<DropdownMenuItem<String>>((String value){
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        })
                            .toList(),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: Text('Color Band 2 : ')),
                      DropdownButton<String>(
                        value: cb2dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                        iconSize: 17,
                        elevation: 17,
                        style: const TextStyle(color: Colors.black),

                        onChanged: (String? newValue){
                          setState((){
                            cb2dropdownValue = newValue!;
                          });
                        },
                        items: <String>['Black', 'Brown', 'Red', 'Orange', 'Green', 'Blue', 'Violet', 'Grey', 'White', 'Gold', 'Silver', 'Absent']
                            .map<DropdownMenuItem<String>>((String value){
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),

                      ),
                    ],
                  ),

                  //3
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: const Text('Color Band 3 : ')),
                      DropdownButton<String>(
                        value: cb3dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                        iconSize: 17,
                        elevation: 17,
                        style: const TextStyle(color: Colors.black),

                        onChanged: (String? newValue){
                          setState((){
                            cb3dropdownValue = newValue!;
                          });
                        },
                        items: <String>['Black', 'Brown', 'Red', 'Orange', 'Green', 'Blue', 'Violet', 'Grey', 'White', 'Gold', 'Silver', 'Absent']
                            .map<DropdownMenuItem<String>>((String value){
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),

                  //4
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: const Text('Color Band 4 : ')),
                      DropdownButton<String>(
                        value: cb4dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                        iconSize: 17,
                        elevation: 17,
                        style: const TextStyle(color: Colors.black),

                        onChanged: (String? newValue){
                          setState((){
                            cb4dropdownValue = newValue!;
                          });
                        },
                        items: <String>['Black', 'Brown', 'Red', 'Orange', 'Green', 'Blue', 'Violet', 'Grey', 'White', 'Gold', 'Silver', 'Absent']
                            .map<DropdownMenuItem<String>>((String value){
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),

                      ),
                    ],
                  ),

                  //5
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: const Text('Color Band 5 : ')),
                      DropdownButton<String>(
                        value: cb5dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                        iconSize: 17,
                        elevation: 17,
                        style: const TextStyle(color: Colors.black),

                        onChanged: (String? newValue){
                          setState((){
                            cb5dropdownValue = newValue!;
                          });
                        },
                        items: <String>['Black', 'Brown', 'Red', 'Orange', 'Green', 'Blue', 'Violet', 'Grey', 'White', 'Gold', 'Silver', 'Absent']
                            .map<DropdownMenuItem<String>>((String value){
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),

                      ),
                    ],
                  ),

                  //6
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: const Text('Color Band 6 : ')),
                      DropdownButton<String>(
                        value: cb6dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                        iconSize: 17,
                        elevation: 17,
                        style: const TextStyle(color: Colors.black),

                        onChanged: (String? newValue){
                          setState((){
                            cb6dropdownValue = newValue!;
                          });
                        },
                        items: <String>['Black', 'Brown', 'Red', 'Orange', 'Green', 'Blue', 'Violet', 'Grey', 'White', 'Gold', 'Silver', 'Absent']
                            .map<DropdownMenuItem<String>>((String value){
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),

                      ),
                    ],
                  ),

                  //7
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: const Text('Color Band 7 : ')),
                      DropdownButton<String>(
                        value: cb7dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                        iconSize: 17,
                        elevation: 17,
                        style: const TextStyle(color: Colors.black),

                        onChanged: (String? newValue){
                          setState((){
                            cb7dropdownValue = newValue!;
                          });
                        },
                        items: <String>['Black', 'Brown', 'Red', 'Orange', 'Green', 'Blue', 'Violet', 'Grey', 'White', 'Gold', 'Silver', 'Absent']
                            .map<DropdownMenuItem<String>>((String value){
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),

                      ),
                    ],
                  ),

                  ElevatedButton(
                      onPressed: (){
                        calcResistor();
                        showDialog(context: context, builder: (BuildContext context){
                          return AlertDialog(
                            title: Text('Resistance: ${ResistorCBValue.toString()} \n Tolerance:' '${ToleranceCBValue.toString()}'),
                            actions: <Widget>[
                              ElevatedButton(onPressed: (){ Navigator.of(context).pop(); }, child: const Text('OK')),
                            ],
                          );
                        });
                      }, child: const Text("calculate")),
                  Text('NOTE: if value of tolerance does not add up please place the color in the one after last band e.g band 5 instead of 7'),

                ],
              ),
          ),
        ],
      ),
    ])
    );
  }
}
