import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waya/globalFx.dart';
import 'globalFx.dart';
class wayaCodeMap {
  int? cBinary;
  int? cOct;
  String? cDecimal;
  String? cHex;

  wayaCodeMap({this.cBinary, this.cOct, this.cDecimal, this.cHex});
  wayaCodeMap.fromJson(Map<String, dynamic> json){
    cBinary = json['Binary'];
    cHex = json['Hex'];
    cOct = json['Oct'];
    cDecimal = json['Decimal'];
  }
}

String codeTransformation(String sourceCode, String sourceCodeText, String resultCode){
  var x;
  const List<Map<String, dynamic>> codesJson = [
    {"Binary": "000 0000", "Oct": 0, "Decimal": 0, "Hex": "0"},
    {"Binary": "000 0001", "Oct": 1, "Decimal": 1, "Hex": "1"},
    {"Binary": "000 0010", "Oct": 2, "Decimal": 2, "Hex": "2"},
    {"Binary": "000 0011", "Oct": 3, "Decimal": 3, "Hex": "3"},
    {"Binary": "000 0100", "Oct": 4, "Decimal": 4, "Hex": "4"},
    {"Binary": "000 0101", "Oct": 5, "Decimal": 5, "Hex": "5"},
    {"Binary": "000 0110", "Oct": 6, "Decimal": 6, "Hex": "6"},
    {"Binary": "000 0111", "Oct": 7, "Decimal": 7, "Hex": "7"},
    {"Binary": "000 1000", "Oct": 10, "Decimal": 8, "Hex": "8"},
    {"Binary": "000 1001", "Oct": 11, "Decimal": 9, "Hex": "9"},
    {"Binary": "000 1010", "Oct": 12, "Decimal": 10, "Hex": "0A"},
    {"Binary": "000 1011", "Oct": 13, "Decimal": 11, "Hex": "0B"},
    {"Binary": "000 1100", "Oct": 14, "Decimal": 12, "Hex": "0C"},
    {"Binary": "000 1101", "Oct": 15, "Decimal": 13, "Hex": "0D"},
    {"Binary": "000 1110", "Oct": 16, "Decimal": 14, "Hex": "0E"},
    {"Binary": "000 1111", "Oct": 17, "Decimal": 15, "Hex": "0F"},
    {"Binary": "001 0000", "Oct": 20, "Decimal": 16, "Hex": "10"},
    {"Binary": "001 0001", "Oct": 21, "Decimal": 17, "Hex": "11"},
    {"Binary": "001 0010", "Oct": 22, "Decimal": 18, "Hex": "12"},
    {"Binary": "001 0011", "Oct": 23, "Decimal": 19, "Hex": "13"},
    {"Binary": "001 0100", "Oct": 24, "Decimal": 20, "Hex": "14"},
    {"Binary": "001 0101", "Oct": 25, "Decimal": 21, "Hex": "15"},
    {"Binary": "001 0110", "Oct": 26, "Decimal": 22, "Hex": "16"},
    {"Binary": "001 0111", "Oct": 27, "Decimal": 23, "Hex": "17"},
    {"Binary": "001 1000", "Oct": 30, "Decimal": 24, "Hex": "18"},
    {"Binary": "001 1001", "Oct": 31, "Decimal": 25, "Hex": "19"},
    {"Binary": "001 1010", "Oct": 32, "Decimal": 26, "Hex": "1A"},
    {"Binary": "001 1011", "Oct": 33, "Decimal": 27, "Hex": "1B"},
    {"Binary": "001 1100", "Oct": 34, "Decimal": 28, "Hex": "1C"},
    {"Binary": "001 1101", "Oct": 35, "Decimal": 29, "Hex": "1D"},
    {"Binary": "001 1110", "Oct": 36, "Decimal": 30, "Hex": "1E"},
    {"Binary": "001 1111", "Oct": 37, "Decimal": 31, "Hex": "1F"},
    {"Binary": "111 1111", "Oct": 177, "Decimal": 127, "Hex": "7F"}
  ];

  final List <Map<String, dynamic>> thecodes = codesJson;
  print(thecodes);
  var xg = thecodes.where((element) => element.containsValue(sourceCodeText)).toString().replaceAll('({', '').replaceAll('})', '');
  print(xg);
  return xg;
}


class codeCalculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => codeCalculatorState();
}
class codeCalculatorState extends State<codeCalculator>{
  String availableCodeType = 'Decimal';
  String resultType = 'Hexadecimal';

  var availableCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: wayaTitle(),),
        body: Padding(padding: const EdgeInsets.all(49),
            child: Form(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DropdownButtonFormField(
                  decoration: const InputDecoration(labelText: 'Select Current Format'),
                  value: availableCodeType,
                  onChanged: (String? newValue){
                    setState(() {
                      availableCodeType = newValue!;
                    });},
                  items: <String>['Decimal', 'Hexadecimal', 'Binary', 'Octadecimal']
                      .map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(labelText: 'Select Destination Format'),
                  value: resultType,
                  onChanged: (String? newValue2){
                    setState(() {
                      resultType = newValue2!;
                    });},
                  items: <String>['Hexadecimal', 'Decimal', 'Binary', 'Octadecimal']
                      .map<DropdownMenuItem<String>>((String value2){
                    return DropdownMenuItem<String>(
                      value: value2,
                      child: Text(value2),
                    );
                  }).toList(),
                ),
                TextFormField(decoration: InputDecoration(labelText: "enter code", hintText: "Enter Code Here"), controller: availableCodeController,),
                ElevatedButton(onPressed: (){
                  showDialog(context: context, builder: (BuildContext context){
                    return AlertDialog(
                      alignment: Alignment(0.0,0.0),
                      title: Text(resultType, textAlign: TextAlign.center),
                      content:
                        Text(
                            codeTransformation(availableCodeType, availableCodeController.text, resultType)
                            .split(',')
                            .elementAt(showNeededIndex(resultType))
                            .split(':')
                            .elementAt(1)
                            .toString(), textAlign: TextAlign.center
                        ),
                      actions: <Widget>[
                        ElevatedButton(onPressed: (){ Navigator.of(context).pop();}, child: const Text('OK')),
                      ],);
                  }, );
                }, child: Text("Convert"),
                )
              ],
            )))
    );
  }
  int showNeededIndex(String requiredIndex){
      int x = 0;
      if(requiredIndex == "Binary"){
        x = 0;
      }
      if(requiredIndex == "Octadecimal"){
        x = 1;
      }
      if(requiredIndex == "Decimal"){
        x = 2;
      }
      if(requiredIndex == "Hexadecimal"){
        x = 3;
      }
      return x;
  }
}


