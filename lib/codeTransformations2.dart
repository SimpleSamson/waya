import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waya/globalFx.dart';
//import 'lib/material.dart';
import 'globalFx.dart';
class wayaCodeMap {
  int? cBinary;
  int? cOct;
  String? cDecimal;
  String? cHex;

  wayaCodeMap({this.cBinary, this.cOct, this.cDecimal, this.cHex});

  // String toBin(String input) {
  //   return '$cBinary';
  // }
  //
  // @override
  // bool operator ==(Object other) {
  //   if (other.runtimeType != runtimeType) {
  //     return false;
  //   }
  //   return other is wayaCodeMap
  //       && other.Binary == Binary
  //       && other.Decimal == Decimal
  //       && other.Oct == Oct
  //       && other.Hex == Hex;
  // }

//  @override
//  int get hashCode => hashValues(Binary, Decimal, Oct, Hex);
  wayaCodeMap.fromJson(Map<String, dynamic> json){
    cBinary = json['Binary'];
    cHex = json['Hex'];
    cOct = json['Oct'];
    cDecimal = json['Decimal'];
  }
}
class codeTransformationsAutocomplete extends StatelessWidget{
  const codeTransformationsAutocomplete({Key? key}) : super(key:key);
  //initialize
  // static const List<wayaCodeMap> _wayaCodeMapOptions = <wayaCodeMap>[
  //   wayaCodeMap(Binary: 00000000, Decimal: "0", Oct: 0, Hex: "0"),
  //   wayaCodeMap(Binary: 00000000, Decimal: "0", Oct: 0, Hex: "0"),
  // ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

//source is the code that need to be transformed
List codeTransformation(String sourceCode, dynamic sourceCodeText, String resultCode){
  var x; // = "Nothing";
  //final List<Map<String, dynamic>> codesJson = [
//  const codesJson = ;

//  var reqValue = wayaCodeMap.fromJson(codesJson as Map<String, dynamic>);
//   if(resultCode == "Binary"){
//     x = reqValue.cBinary;
//   }else if(resultCode == "Decimal"){
//     x = reqValue.cDecimal;
//   }else if(resultCode == "Oct"){
//     x = reqValue.cOct;
//   }else if(resultCode == "Hex"){
//     x = reqValue.cHex;
//   }
//  codesMap.forEach((element) {
    //element["$sourceCode"] == true ? print(element["$resultCode"]) : "Nothing matches";
//    print (element['Oct']);
//    print(element[resultCode]);
//    print(element[sourceCodeText]);
//  });
//  x = codesMap.where((element) => element[sourceCode] == true);
//  x = codesMap.firstWhere((element) => element[sourceCode] == sourceCodeText);// orElse: ()=> {"nothing": "here", "matches": "any", "of": "your", "query": "values"});
//   x = codesMap.where((element) => element["$sourceCode"] == true);
//   codesMap.forEach((element){
//    // if(element[sourceCode] == sourceCodeText){
//     element[sourceCode].toString().contains(sourceCodeText)? x =  element : "Code Not Found. Try Again";
//    // }
//   });
  //print(x);
  //return x.toString();

  //var
//  List<Map<String, dynamic>> reqValues = codesJson.forEach((key, value) { print 'key is $key'; }); //= codesJson.where((code) => code['$sourceCode'] == $sourceCodeText); //.startsWith('$sourceCodeText'));
//  List<dynamic> binaryVal = [reqValues[codesJson.indexOf(z'$sourceCodeText', 0)]["Binary"], 2, 3];
//  var reqVx = binaryVal; //reqValues.toString(); //here
//  final List <dynamic> dynamicList = json.decode('[{"Binary": "000 0000", "Octadecimal": 0, "Decimal": 0, "Hex": "0"}, {"Binary": "000 0001", "Octadecimal": 1, "Decimal": 1, "Hex": "1"}, {"Binary": "000 0010", "Octadecimal": 2, "Decimal": 2, "Hex": "2"}, {"Binary": "000 0011", "Octadecimal": 3, "Decimal": 3, "Hex": "3"}, {"Binary": "000 0100", "Octadecimal": 4, "Decimal": 4, "Hex": "4"}, {"Binary": "000 0101", "Octadecimal": 5, "Decimal": 5, "Hex": "5"}, {"Binary": "000 0110", "Octadecimal": 6, "Decimal": 6, "Hex": "6"}, {"Binary": "000 0111", "Octadecimal": 7, "Decimal": 7, "Hex": "7"}, {"Binary": "000 1000", "Octadecimal": 10, "Decimal": 8, "Hex": "8"}, {"Binary": "000 1001", "Octadecimal": 11, "Decimal": 9, "Hex": "9"}, {"Binary": "000 1010", "Octadecimal": 12, "Decimal": 10, "Hex": "0A"}, {"Binary": "000 1011", "Octadecimal": 13, "Decimal": 11, "Hex": "0B"}, {"Binary": "000 1100", "Octadecimal": 14, "Decimal": 12, "Hex": "0C"}, {"Binary": "000 1101", "Octadecimal": 15, "Decimal": 3, "Hex": "0D"}, {"Binary": "000 1110", "Octadecimal": 16, "Decimal": 4, "Hex": "0E"}, {"Binary": "000 1111", "Octadecimal": 17, "Decimal": 5, "Hex": "0F"}, {"Binary": "001 0000", "Octadecimal": 20, "Decimal": 6, "Hex": "10"}, {"Binary": "001 0001", "Octadecimal": 21, "Decimal": 7, "Hex": "11"}, {"Binary": "001 0010", "Octadecimal": 22, "Decimal": 8, "Hex": "12"}, {"Binary": "001 0011", "Octadecimal": 23, "Decimal": 9, "Hex": "13"}, {"Binary": "001 0100", "Octadecimal": 24, "Decimal": 0, "Hex": "14"}, {"Binary": "001 0101", "Octadecimal": 25, "Decimal": 1, "Hex": "15"}, {"Binary": "001 0110", "Octadecimal": 26, "Decimal": 2, "Hex": "16"}, {"Binary": "001 0111", "Octadecimal": 27, "Decimal": 3, "Hex": "17"}, {"Binary": "001 1000", "Octadecimal": 30, "Decimal": 4, "Hex": "18"}, {"Binary": "001 1001", "Octadecimal": 31, "Decimal": 5, "Hex": "19"}, {"Binary": "001 1010", "Octadecimal": 32, "Decimal": 6, "Hex": "1A"}, {"Binary": "001 1011", "Octadecimal": 33, "Decimal": 7, "Hex": "1B"}, {"Binary": "001 1100", "Octadecimal": 34, "Decimal": 8, "Hex": "1C"}, {"Binary": "001 1101", "Octadecimal": 35, "Decimal": 9, "Hex": "1D"}, {"Binary": "001 1110", "Octadecimal": 36, "Decimal": 0, "Hex": "1E"}, {"Binary": "001 1111", "Octadecimal": 37, "Decimal": 1, "Hex": "1F"}, {"Binary": "111 1111", "Octadecimal": 177, "Decimal": 27, "Hex": "7F"}]');
  final List <dynamic> dynamicList = json.decode('[{"Binary": "000 0000", "Octadecimal": "0", "Decimal": "0", "Hexadecimal": "0"}, {"Binary": "000 0001", "Octadecimal": "1", "Decimal": "1", "Hexadecimal": "1"}, {"Binary": "000 0010", "Octadecimal": "2", "Decimal": "2", "Hexadecimal": "2"}, {"Binary": "000 0011", "Octadecimal": "3", "Decimal": "3", "Hexadecimal": "3"}, {"Binary": "000 0100", "Octadecimal": "4", "Decimal": "4", "Hexadecimal": "4"}, {"Binary": "000 0101", "Octadecimal": "5", "Decimal": "5", "Hexadecimal": "5"}, {"Binary": "000 0110", "Octadecimal": "6", "Decimal": "6", "Hexadecimal": "6"}, {"Binary": "000 0111", "Octadecimal": "7", "Decimal": "7", "Hexadecimal": "7"}, {"Binary": "000 1000", "Octadecimal": "10", "Decimal": "8", "Hexadecimal": "8"}, {"Binary": "000 1001", "Octadecimal": "11", "Decimal": "9", "Hexadecimal": "9"}, {"Binary": "000 1010", "Octadecimal": "12", "Decimal": "10", "Hexadecimal": "0A"}, {"Binary": "000 1011", "Octadecimal": "13", "Decimal": "11", "Hexadecimal": "0B"}, {"Binary": "000 1100", "Octadecimal": "14", "Decimal": "12", "Hexadecimal": "0C"}, {"Binary": "000 1101", "Octadecimal": "15", "Decimal": "3", "Hexadecimal": "0D"}, {"Binary": "000 1110", "Octadecimal": "16", "Decimal": "4", "Hexadecimal": "0E"}, {"Binary": "000 1111", "Octadecimal": "17", "Decimal": "5", "Hexadecimal": "0F"}, {"Binary": "001 0000", "Octadecimal": "20", "Decimal": "6", "Hexadecimal": "10"}, {"Binary": "001 0001", "Octadecimal": "21", "Decimal": "7", "Hexadecimal": "11"}, {"Binary": "001 0010", "Octadecimal": "22", "Decimal": "8", "Hexadecimal": "12"}, {"Binary": "001 0011", "Octadecimal": "23", "Decimal": "9", "Hexadecimal": "13"}, {"Binary": "001 0100", "Octadecimal": "24", "Decimal": "0", "Hexadecimal": "14"}, {"Binary": "001 0101", "Octadecimal": "25", "Decimal": "1", "Hexadecimal": "15"}, {"Binary": "001 0110", "Octadecimal": "26", "Decimal": "2", "Hexadecimal": "16"}, {"Binary": "001 0111", "Octadecimal": "27", "Decimal": "3", "Hexadecimal": "17"}, {"Binary": "001 1000", "Octadecimal": "30", "Decimal": "4", "Hexadecimal": "18"}, {"Binary": "001 1001", "Octadecimal": "31", "Decimal": "5", "Hexadecimal": "19"}, {"Binary": "001 1010", "Octadecimal": "32", "Decimal": "6", "Hexadecimal": "1A"}, {"Binary": "001 1011", "Octadecimal": "33", "Decimal": "7", "Hexadecimal": "1B"}, {"Binary": "001 1100", "Octadecimal": "34", "Decimal": "8", "Hexadecimal": "1C"}, {"Binary": "001 1101", "Octadecimal": "35", "Decimal": "9", "Hexadecimal": "1D"}, {"Binary": "001 1110", "Octadecimal": "36", "Decimal": "0", "Hexadecimal": "1E"}, {"Binary": "001 1111", "Octadecimal": "37", "Decimal": "1", "Hexadecimal": "1F"}, {"Binary": "111 1111", "Octadecimal": "177", "Decimal": "27", "Hexadecimal": "7F"}]');
  List li = [];
//  final List <Map<String, dynamic>> thecodes = List.from(dynamicList.where((x) => x is Map && x[sourceCode] == sourceCodeText)));
  print(sourceCode);
  print(sourceCodeText);
 // change here to be able to obtain values. I think the reason is because of an absence of opening and closing quotes
  var y = "$sourceCode";
  var z = sourceCodeText;
 // var thecodes =
//  dynamicList.takeWhile((value) => value[sourceCode] == sourceCodeText);
 // Binary": "000 0001", "Octadecimal": "1", "Decimal": "1", "Hexadecimal":
  if(resultCode == "Binary" || resultCode == "Octadecimal" || resultCode == "Decimal" || resultCode == "Hexadecimal" ) {
    dynamicList.retainWhere((element) => element == resultCode);
  }
  // else {
  //   dynamicList.retainWhere((element) => element.key == resultCode);
  // }

    List.from(dynamicList);//copyRange(li, 1, dynamicList);//.of(dynamicList.where((x) => x is Map && x[y] == z));
    // final List <Map<String, dynamic>> thecodes = codesJson;//.first['$sourceCode'];
//  final String codeRequired = thecodes[1]['$sourceCode']['$resultCode'];//thecodes['$resultCode'];
//  String result = wayaCodeMap().Hex.toString();
//   if(sourceCode == "$sourceCode" && resultCode == "Hex") {
//     result = codesJson['$sourceCode':'$sourceCode', ] as String;  //wayaCodeMap().Hex.toString();
//   }else if(sourceCode == "$sourceCode" && resultCode == "Binary"){
//     result = wayaCodeMap().Binary.toString();
//   }else if(sourceCode == "$sourceCode" && resultCode == "Oct"){
//     result = wayaCodeMap().Oct.toString();
//   }else if(sourceCode == "$sourceCode" && resultCode == "Decimal"){
//     result = wayaCodeMap().Decimal.toString();
//   }
//  print("reqvx = $reqVx and reqvalues = $reqValues");
//  return "reqVx";//alues;
    //print(thecodes.any(thecodes['$sourceCode'].contains('$sourceCodeText')).toString());//['$sourceCode']['$resultCode']); //.singleWhere((element) => (element) == "0"));
//  print(thecodes.toList.startsWith('$sourceCodeText'));
//  thecodes.removeWhere((key, value) => value.startsWith('0'));//, '0'));// where((element) => element['0']));
    print(y);
    print(z);
    print(li);
    print("117 codeTrans");
    print(dynamicList);
//  var valueNeeded = thecodes.retainWhere((key) => (key) == z) ? thecodes.toString : "none";
//  var valueNeeded = thecodes.singleWhere((element) => element == '$sourceCode' );
//  var valueNeeded = thecodes.singleWhere(thecodes[1]['$sourceCode'].contains('$sourceCodeText'));//retainWhere((key) => (key) == z) ? thecodes.toString : "none";
//  var valueNeeded = thecodes.singleWhere((element) => element.toString().contains('$sourceCodeText'));
    return dynamicList;
  }//thecodes;//.toString();//thecodes.first.toString();
  //return valueNeeded;
//}
//filter
///for (var code in codeMap.keys){
/// return ${codeMap[code]}
/// }
/// map ofValues is the code transormation
String reqValue(var mapOfValues, var sourceCode, var sourceCodeText, var resultCode){
 // Iterable x = codeTransformation(sourceCode, sourceCodeText, resultCode).map((e) => e[mapOfValues]);
//  Iterable x = codeTransformation(sourceCode, sourceCodeText, resultCode).map((e) => e[mapOfValues]);
  var z = mapOfValues.firstWhere((element) => element == sourceCode);

  var map1 = Map.fromIterable(z);
  String y = "not yet available";
  for(var key in map1.keys){
    y = map1[resultCode];// as Iterable;
  }
  return y;
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
          //source code
          DropdownButtonFormField(
            decoration: const InputDecoration(labelText: 'Select Current Format'),
           value: availableCodeType,
           onChanged: (String? newValue){
            setState(() {
              availableCodeType = newValue!;
              //change value of the text in results
            });},
           items: <String>['Decimal', 'Hexadecimal', 'Binary', 'Octadecimal']
                  .map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                        );
           }).toList(),
          ),
          //destination code
          DropdownButtonFormField(
            decoration: const InputDecoration(labelText: 'Select Destination Format'),
            value: resultType,
            onChanged: (String? newValue2){
              setState(() {
                resultType = newValue2!;
                //change value of the text in results
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
            var x = codeTransformation(availableCodeType, availableCodeController.text, resultType).toList();//, availableCodeType, availableCodeController.text, resultType)),
            print(x.length);
            print (x.toString());
            showDialog(context: context, builder: (BuildContext context){
              return SizedBox(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: SimpleDialog(
                children: [
              //    Text(reqValue2(codeTransformation(availableCodeType, availableCodeController.text, resultType), availableCodeType, availableCodeController.text, resultType)),
//                   ListView(

                  ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  //   itemCount: ValuesToChartItems(BodyPart, tryOnlineThenOff()).length,
                  itemCount: x.length,
                  itemBuilder: (context, index){
                    final item = x[index];
                    return ListTile(subtitle: Text(item.toString()));
                  }),
                   //)
//                  Text(requiredItem(availableCodeType, availableCodeController.text, resultType)),
//                  Text(codeTransformation(availableCodeType, availableCodeController.text, resultType).replaceAll(RegExp(r'{'), '[').replaceAll(r'}', ']')),//.Helpers.findById(this, availableCodeType)),//Helpers.findById(this, id); //TODO: do the same(regexp) with closing and try to only show required result
//                  Text(codeTransformation(availableCodeType, availableCodeController.text, resultType).contains(RegExp('${availableCodeController.text}')).toString().replaceAll(RegExp(r'{'), '').replaceAll(r'}', '').splitMapJoin(RegExp(availableCodeController.text.toString()), onMatch: (m)=> '${m[0]}', onNonMatch: (n) =>'Error No Match')), //TODO: do the same(regexp) with closing and try to only show required result
//                   Text(codeTransformation(availableCodeType, availableCodeController.text, resultType)
// //                   .replaceAll(r'{', '\n {')
// //                    .replaceAll(r'},', '}, \n')
// //                   .replaceAll(r'[', '')
// //                   .replaceAll(r']', '')
// //                   .split('} \n')
// //                  .toList()
//           //        .firstWhere((element) => element.contains(availableCodeController.text))
//   //                .where((availableCodeType) => availableCodeType.contains("12"))
//                     //  .firstWhere((availableCodeType) => availableCodeType == availableCodeController.text)
//
//
// //                      .firstWhere((element) => element.{availableCodeType} == availableCodeController.text)
// //                      .where((element) => element.contains(availableCodeController.text))
// //                      .where((element)=>element['$availableCodeType'] == '${availableCodeController.text}')
//                   //.skipWhile((element)=> element[0] != availableCodeController.text)
// //this works can be used for prices                      .map((e) => e[availableCodeType]).where((element) => element.contains(availableCodeController.text))
//                     //  .toList().removeWhere((element) => element != availableCodeType)
//                       .firstWhere((element) => element == availableCodeType)
// //                      .indexWhere((element) => element.toString() == availableCodeType)//.startsWith(availableCodeType)) //map((e) => e[availableCodeType]).take(3)//where((element) => element.contains(availableCodeController.text)) //tinker with this
//                   // .firstWhere((element) => element == availableCodeController.text)
//                   // this returns ().where((element) => element == availableCodeController.text)
//                   //    .singleWhere((element) => element == availableCodeController.text, orElse: () => true)
//             //      .elementAt(0)
//                       .toString()
//                   )
//
                  //firstWhere((element) => (element[availableCodeController.text.toString()]? element[0].contains(availableCodeController.text) as String: "not found")).toString())//.allMatches('${availableCodeController.text}')),//splitMapJoin(RegExp(availableCodeController.text.toString()), onMatch: (m)=> '${m[0]}', onNonMatch: (n) =>'Error No Match')), //TODO: do the same(regexp) with closing and try to only show required result
//                  Text(codeTransformation(availableCodeType, availableCodeController.text, resultType).split(',').where((element) => (element[availableCodeController.text.toString()] ? element[availableCode].contains(availableCodeController.text) as String as List<dynamic>),//toList())//.allMatches(RegExp('${availableCodeController.text}'))),//.replaceAll(RegExp(r'{'), '').replaceAll(r'}', '').splitMapJoin(RegExp(availableCodeController.text.toString()), onMatch: (m)=> '${m[0]}', onNonMatch: (n) =>'Error No Match')), //TODO: do the same(regexp) with closing and try to only show required result
//                Text(codeTransformation(availableCodeType, availableCodeController.text, resultType).split(',').where((element) => (element[availableCodeController.text.toString()!] ? element[availableCode].contains(availableCodeController.text) as String;// as List<Map<String, dynamic>>;//wayaCodeMap; //List<dynamic>;)
//                  Text(codeTransformation(availableCodeType, availableCodeController.text, resultType)),//startsWith(availableCodeController.text))
          //    ),
                ElevatedButton(onPressed: (){ Navigator.of(context).pop();},
                  child: const Text('OK'),),
              ],
                )//;
              //)
              );
            }, );

       //   print(x[index]);
            }, child: Text("Convert"),
            )
        ],
      )))
    );
  }

  // String requiredItem(String av, String avc, String rt) {
  //   Iterable x = codeTransformation(av,avc,rt).split(',');//.where((element) => (element[av!] ? element['av'].contains(avc);// as List<Map<String, dynamic>>;//wayaCodeMap; //List<dynamic>;
  //   var y;
  //   // if(resultType == "Octadecimal"){
  //   //   y = x.cOct;
  //   // }else if(resultType == "Hexadecimal"){
  //   //   y = x.cHex;
  //   // }else if(resultType == "Decimal"){
  //   //   y = x.cDecimal;
  //   // }else {y = x.cBinary;}
  //  // y = x.where((element) => element[resultType][0] == availableCodeController.text);
  //   print(x.toString());
  //   return x;//y.toString();
  // }
}

reqValue2(var mapOfValues, var sourceCode, var sourceCodeText, var resultCode){
    // Iterable x = codeTransformation(sourceCode, sourceCodeText, resultCode).map((e) => e[mapOfValues]);
//  Iterable x = codeTransformation(sourceCode, sourceCodeText, resultCode).map((e) => e[mapOfValues]);
    var z = mapOfValues;//.map((e) => e[sourceCode]);//.where((element) => element.contains(sourceCodeText.text));
    //mapOfValues.firstWhere((element) => element == sourceCode);

    var map1 = Map.fromIterable(z);
    print(z);
    var y;// = "not yet available";
    for(var key in map1.keys){
     y = map1[resultCode];// as Iterable;
     // y = map1.values;// as String;
    }
    return y.toString();
  }



