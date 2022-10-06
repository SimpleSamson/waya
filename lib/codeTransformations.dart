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
String codeTransformation(String sourceCode, String sourceCodeText, String resultCode){
  var x; // = "Nothing";
  final List<Map<String, dynamic>> codesJson = [
//  var codesMap = [
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
  final List <Map<String, dynamic>> thecodes = codesJson;//.first['$sourceCode'];
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
  print(thecodes);//['$sourceCode']['$resultCode']); //.singleWhere((element) => (element) == "0"));
//this works but returns a single value  var xg = thecodes.singleWhere((element) => element.containsValue(sourceCodeText)).toString();//.first.toString();
  var xg = thecodes.where((element) => element.containsValue(sourceCodeText)).toString().replaceAll('({', '').replaceAll('})', '');//.first.toString();
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
                  showDialog(context: context, builder: (BuildContext context){
                    return AlertDialog(title: Text("Result"), content: Column(
                      children: [
//                  Text(requiredItem(availableCodeType, availableCodeController.text, resultType)),
//                  Text(codeTransformation(availableCodeType, availableCodeController.text, resultType).replaceAll(RegExp(r'{'), '[').replaceAll(r'}', ']')),//.Helpers.findById(this, availableCodeType)),//Helpers.findById(this, id); //TODO: do the same(regexp) with closing and try to only show required result
//                  Text(codeTransformation(availableCodeType, availableCodeController.text, resultType).contains(RegExp('${availableCodeController.text}')).toString().replaceAll(RegExp(r'{'), '').replaceAll(r'}', '').splitMapJoin(RegExp(availableCodeController.text.toString()), onMatch: (m)=> '${m[0]}', onNonMatch: (n) =>'Error No Match')), //TODO: do the same(regexp) with closing and try to only show required result
                        Text(
                            codeTransformation(availableCodeType, availableCodeController.text, resultType)
                            //turn into list
                            .split(',')
                            .elementAt(showNeededIndex(resultType))
                            //only take the value
                            .split(':')
                            .elementAt(1)
                        //                   .replaceAll(r'{', '{')
                        //      .replaceAll(r'}', '}, \n')
                        //               .replaceAll(r'[', '')
                        //               .replaceAll(r']', '')
                        //               .split('} \n')
                        //                 .toList()
//                  .firstWhere((element) => element.contains(availableCodeController.text))
                        //                .where((availableCodeType) => availableCodeType.contains("12"))
                        //.firstWhere((availableCodeType) => availableCodeType == availableCodeController.text)


//                      .firstWhere((element) => element.{availableCodeType} == availableCodeController.text)
//                      .where((element) => element.contains(availableCodeController.text))
//                      .where((element)=>element['$availableCodeType'] == '${availableCodeController.text}')
                        //.skipWhile((element)=> element[0] != availableCodeController.text)
                        // .map(//(e) => //e[availableCodeType])//where(
                        //      (element) => element.contains(availableCodeController.text)
                        //   )
                        // .firstWhere((element) => element == availableCodeController.text)
                        // this returns ().where((element) => element == availableCodeController.text)
                        //    .singleWhere((element) => element == availableCodeController.text, orElse: () => true)
                        //      .elementAt(0)
                            .toString()
                        )//firstWhere((element) => (element[availableCodeController.text.toString()]? element[0].contains(availableCodeController.text) as String: "not found")).toString())//.allMatches('${availableCodeController.text}')),//splitMapJoin(RegExp(availableCodeController.text.toString()), onMatch: (m)=> '${m[0]}', onNonMatch: (n) =>'Error No Match')),
//                  Text(codeTransformation(availableCodeType, availableCodeController.text, resultType).split(',').where((element) => (element[availableCodeController.text.toString()] ? element[availableCode].contains(availableCodeController.text) as String as List<dynamic>),//toList())//.allMatches(RegExp('${availableCodeController.text}'))),//.replaceAll(RegExp(r'{'), '').replaceAll(r'}', '').splitMapJoin(RegExp(availableCodeController.text.toString()), onMatch: (m)=> '${m[0]}', onNonMatch: (n) =>'Error No Match')), //TODO: do the same(regexp) with closing and try to only show required result
//                Text(codeTransformation(availableCodeType, availableCodeController.text, resultType).split(',').where((element) => (element[availableCodeController.text.toString()!] ? element[availableCode].contains(availableCodeController.text) as String;// as List<Map<String, dynamic>>;//wayaCodeMap; //List<dynamic>;)
//                  Text(codeTransformation(availableCodeType, availableCodeController.text, resultType)),//startsWith(availableCodeController.text))
                      ],
                    ), actions: <Widget>[
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


