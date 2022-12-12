import 'package:flutter/material.dart';
import 'dart:math';
import 'globalFx.dart';
String? resistorBandFinalValue;
String? ToleranceCBValue; // = 1;

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
  String? cb2dropdownValue = 'Red';
  String? cb3dropdownValue = 'Red';
  String? cb4dropdownValue = 'Red';
  String? cb5dropdownValue = 'Red';
  String? cb6dropdownValue = 'Red';
  String? cb7dropdownValue = 'Red';

  String? ResistorConcatVals;
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

    ColorBand? ColorToValue(String? value){
      if(value == 'Black') {
        return ColorBand(0, 1, null);
      } else if(value == 'Brown') {
        return ColorBand(1, 10, 1);
      } else if(value == 'Red') {
        return ColorBand(2, 100, 2);
      }else if(value == 'Orange') {
        return ColorBand(3, 1000, 0.05);
      }else if(value == 'Yellow') {
        return ColorBand(4, 10000, 0.02);
      }else if(value == 'Green') {
        return ColorBand(5, 100000, 0.5);
      }else if(value == 'Blue') {
        return ColorBand(6, 1000000, 0.25);
      } else if(value == 'Violet'){
        return ColorBand(7, null, 0.1);
      }else if(value == 'Grey'){
        return ColorBand(8, null, 0.01);
      }else if(value == 'White'){
        return ColorBand(9, null, null);
      }else if(value == 'Gold'){
        return ColorBand(null, 0.1, 5);
      }else if(value == 'Silver'){
        return ColorBand(null, 0.01, 10);
      } else if(value == 'absent'){
        return ColorBand(null, null, null);
      }
    }

    //get tolerance
    List<String?> toleranceV = [ColorToValue(cb1dropdownValue)!.tolerance.toString(), ColorToValue(cb2dropdownValue)!.tolerance.toString(), ColorToValue(cb3dropdownValue)?.tolerance.toString(), ColorToValue(cb4dropdownValue)?.tolerance.toString(), ColorToValue(cb5dropdownValue)?.tolerance.toString(), ColorToValue(cb6dropdownValue)?.tolerance.toString(), ColorToValue(cb7dropdownValue)?.tolerance.toString()];
    print('tolerance is $toleranceV');
   // get the cbx at position of last non null value
    List<String> toleranceBandValues = toleranceV.toString().replaceAll(RegExp(r', null'),'').replaceAll(RegExp(r']'), '').replaceAll(RegExp(r'\['), '').split(','); //remove null values
    int toleranceBandPostion = toleranceBandValues.length - 1;
    double toleranceValue = double.parse(toleranceBandValues[toleranceBandPostion]);
    print('this is tolerance $toleranceValue');
    ToleranceCBValue = toleranceValue.toString();

    ///getting multiplier
    List<String?> resV = [ColorToValue(cb1dropdownValue)!.Digit.toString(), ColorToValue(cb2dropdownValue)!.Digit.toString(), ColorToValue(cb3dropdownValue)?.Digit.toString(), ColorToValue(cb4dropdownValue)?.Digit.toString(), ColorToValue(cb5dropdownValue)?.Digit.toString(), ColorToValue(cb6dropdownValue)?.Digit.toString()];//, ColorToValue(cb7dropdownValue)?.Digit.toString()];
    print('resv is $resV');
    print('ndo jio ');//${ColorToValue(cb4dropdownValue ?? cb3dropdownValue)!.Digit.toString() ?? '17'}');
    List<String> multiplerBandValues = resV.toString().replaceAll(RegExp(r', null'),'').replaceAll(RegExp(r']'), '').replaceAll(RegExp(r'\['), '').split(','); //remove null values
    int multiplierBandPosition = multiplerBandValues.length - 1;
    double multiplierExponent = double.parse(multiplerBandValues[multiplierBandPosition]);
    num multiplierValue = pow(10, multiplierExponent);
    print('this is $multiplierValue');
    ///the end of working multiplier value

///    getting the colorband value
    List<String?> allBands = [ColorToValue(cb1dropdownValue)!.Digit.toString(), ColorToValue(cb2dropdownValue)?.Digit.toString(), ColorToValue(cb3dropdownValue)?.Digit.toString(), ColorToValue(cb4dropdownValue)?.Digit.toString(), ColorToValue(cb5dropdownValue)?.Digit.toString() , ColorToValue(cb6dropdownValue)?.Digit.toString()];//, ColorToValue(cb7dropdownValue)?.Digit.toString()];
    print( 'all bands $allBands');
    List<String> resistorBandValues = allBands.toString().replaceAll(RegExp(r', null'), '').replaceAll(RegExp(r'\['), '').replaceAll(RegExp(r']'), '').replaceAll(RegExp(r',]'), ']').split(',');
  print('null removed $resistorBandValues');
    ///////////////the below 5 lines should return tolerance
//    it did return resistorBandValues without nullfor a short whle when the take while is used allBands certain way
//    print( 'before removal $resistorBandValues');
   // var xyz =resistorBandValues.takeWhile((value) => value.replaceAll(RegExp(r',null'), ''));//.contains('null'));    //remove null values
    var xyz = resistorBandValues.elementAt(resistorBandValues.length - 1);//(element) => element == element[element.length - 1]);//.takeWhile((value) => value == resistorBandValues[resistorBandValues.length - 1]);//.takeWhile((value) => value.replaceAll(RegExp(r',null'), ''));//.contains('null'));    //remove null values
    print('last digit is $xyz');
    //var xy = xyz.toList();//.removeLast();    //show the last value
   // print('second is $xy');

    // ToleranceCBValue = resistorBandValues.removeWhere((element) => element == null);
    // var x = ToleranceCBValue?.removeLast();

   // final resistorBands1 = resistorBandValues.remove(resistorBandValues[resistorBandValues.length - 1]); //remove last digit
    final removelast = resistorBandValues.remove(resistorBandValues[resistorBandValues.length - 1]); //TODO NOTE this is a bit contentious coz it removes a value that is needed???????
    //TODO: capacitor calc in form of 104 meaning 0.1uF
    String digitSum = resistorBandValues.join('').replaceAll(RegExp(r' '), ''); //joined values
    resistorBandFinalValue = (int.parse(digitSum) * multiplierValue).toString();
    print('finally $resistorBandFinalValue');
    print('all bands $allBands');
    print('digitsum $digitSum');
    print('resistor band val is $resistorBandValues');
    print('bands $allBands');
    print(' concat ${ResistorConcatVals}');
    // return [resistorBandFinalValue, ToleranceCBValue]; //get this to work and then in dialog get each value and place in the right place

//    ToleranceCBValue = resistorBandValues.where((element) => element[element.length -1] == true).toString; //get tolerance
    //ToleranceCBValue = resistorBandValues.takeWhile((value) => value[value.length - 1] == true).toString();
    //ToleranceCBValue = xyz; //this works//resistorBandValues.removeLast();//.takeWhile((value) => value == value[value.length-1]) as String?;
    print('after removal $ToleranceCBValue');
  }
  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(

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
                        items: <String>['Black', 'Brown', 'Red', 'Orange', 'Yellow', 'Green', 'Blue', 'Violet', 'Grey', 'White', 'Gold', 'Silver', 'Absent']
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
                        items: <String>['Black', 'Brown', 'Red', 'Orange', 'Yellow', 'Green', 'Blue', 'Violet', 'Grey', 'White', 'Gold', 'Silver', 'Absent']
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
                        items: <String>['Black', 'Brown', 'Red', 'Orange', 'Yellow', 'Green', 'Blue', 'Violet', 'Grey', 'White', 'Gold', 'Silver', 'Absent']
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
                        items: <String>['Black', 'Brown', 'Red', 'Orange', 'Yellow', 'Green', 'Blue', 'Violet', 'Grey', 'White', 'Gold', 'Silver', 'Absent']
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
                        items: <String>['Black', 'Brown', 'Red', 'Orange', 'Yellow', 'Green', 'Blue', 'Violet', 'Grey', 'White', 'Gold', 'Silver', 'Absent']
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
                        items: <String>['Black', 'Brown', 'Red', 'Orange', 'Yellow', 'Green', 'Blue', 'Violet', 'Grey', 'White', 'Gold', 'Silver', 'Absent']
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
                        items: <String>['Black', 'Brown', 'Red', 'Orange', 'Yellow', 'Green', 'Blue', 'Violet', 'Grey', 'White', 'Gold', 'Silver', 'Absent']
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
                          print(resistorBandFinalValue);
                          return AlertDialog(
                            title:
                            Text(
                                'Resistance: $resistorBandFinalValue '
                                +'\n '+
                                'Tolerance:' '${ToleranceCBValue.toString()}'
                            ),
                            actions: <Widget>[
                              ElevatedButton(onPressed: (){ Navigator.of(context).pop(); }, child: const Text('OK')),
                            ],
                          );
                        });
                      }, child: const Text("calculate")),
//                  Text('NOTE: if value of tolerance does not add up please place the color in the one after last band e.g band 5 instead of 7'),
                  Text('NOTE: This calculator does not include a temperature coefficient calculator yet. \n in case of coefficient band please DO NOT insert above or your calculations will be off.'), //TODO add coefficient calculator

                ],
              ),
          ),
        ],
      ),
    ])
    );
  }
}
