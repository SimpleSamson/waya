import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorForm extends StatefulWidget {
  const ColorForm({Key? key}) : super (key: key);

  @override
  State<ColorForm> createState() => _ColorForm();
}
class _ColorForm extends State<ColorForm>{
  final GlobalKey<FormState> _resistorbandskey = GlobalKey<FormState>();
//  final noResistorBands = TextEditingController();
  final noDropdownsController = TextEditingController();
  bool visible = false;

  Future resistorbanddiv() async {
    setState(() {
      visible = true;
    });
    int noResistorBands = noDropdownsController.text as int;
  }

  int noDropdowns = 1;
  String dropDownValue = 'Red';
  String dropDownValue2 = 'Red';
  String dropDownValue3 = 'Red';
  String dropDownValue4 = 'Red';
  String dropDownValue5 = 'Red';
  String dropDownValue6 = 'Red';

  Widget build(BuildContext context) {
    return Form(
      key: _resistorbandskey,
        child: Column(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.number,
              controller: noDropdownsController,
              decoration: const InputDecoration(
                hintText: 'number of color bands',
                labelText: 'Number of bands',
              ),
            ),

            //1
            DropdownButton<String>(
            value:  dropDownValue,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 17,
            elevation: 17,
            style: const TextStyle(color: Colors.white),
            onChanged: (String? newValue){
              setState((){
                dropDownValue = newValue!;
              });
            },
            items: <String>['Black', 'Brown', 'Red', 'Orange', 'Green', 'Blue', 'Violet', 'Grey', 'White', 'Gold', 'Silver']
                .map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                      child: Text(value),
                    onTap: colorbandvalue(),
                  );
                }
            ) .toList(),
          ),

              //2
              DropdownButton<String>(
                value: dropDownValue2,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 17,
                elevation: 17,
                style: const TextStyle(color: Colors.white),
                onChanged: (String? newValue) {
                  setState(() {
                    dropDownValue2 = newValue!;
                  });
                },
                items: <String>['Black', 'Brown', 'Red', 'Orange', 'Green', 'Blue', 'Violet', 'Grey', 'White', 'Gold', 'Silver']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                    onTap: colorbandvalue(),
                  );
                }
                ).toList(),
              ),

            //3
            DropdownButton<String>(
              value:  dropDownValue3,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 17,
              elevation: 17,
              style: const TextStyle(color: Colors.white),
              onChanged: (String? newValue){
                setState((){
                  dropDownValue3 = newValue!;
                });
              },
              items: <String>['Black', 'Brown', 'Red', 'Orange', 'Green', 'Blue', 'Violet', 'Grey', 'White', 'Gold', 'Silver']
                  .map<DropdownMenuItem<String>>((String value){
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                  onTap: colorbandvalue(),
                );
              }
              ) .toList(),
            ),

            //4
            DropdownButton<String>(
              value:  dropDownValue4,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 17,
              elevation: 17,
              style: const TextStyle(color: Colors.white),
              onChanged: (String? newValue){
                setState((){
                  dropDownValue4 = newValue!;
                });
              },
              items: <String>['Black', 'Brown', 'Red', 'Orange', 'Green', 'Blue', 'Violet', 'Grey', 'White', 'Gold', 'Silver']
                  .map<DropdownMenuItem<String>>((String value){
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                  onTap: colorbandvalue(),
                );
              }
              ) .toList(),
            ),


            //5
            DropdownButton<String>(
              value:  dropDownValue5,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 17,
              elevation: 17,
              style: const TextStyle(color: Colors.white),
              onChanged: (String? newValue){
                setState((){
                  dropDownValue5 = newValue!;
                });
              },
              items: <String>['Black', 'Brown', 'Red', 'Orange', 'Green', 'Blue', 'Violet', 'Grey', 'White', 'Gold', 'Silver']
                  .map<DropdownMenuItem<String>>((String value){
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                  onTap: colorbandvalue(),
                );
              }
              ) .toList(),
            ),


            //6
            DropdownButton<String>(
              value:  dropDownValue5,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 17,
              elevation: 17,
              style: const TextStyle(color: Colors.white),
              onChanged: (String? newValue){
                setState((){
                  dropDownValue5 = newValue!;
                });
              },
              items: <String>['Black', 'Brown', 'Red', 'Orange', 'Green', 'Blue', 'Violet', 'Grey', 'White', 'Gold', 'Silver']
                  .map<DropdownMenuItem<String>>((String value){
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                  onTap: colorbandvalue(),
                );
              }
              ) .toList(),
            ),

            //7
            DropdownButton<String>(
              value:  dropDownValue5,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 17,
              elevation: 17,
              style: const TextStyle(color: Colors.white),
              onChanged: (String? newValue){
                setState((){
                  dropDownValue5 = newValue!;
                });
              },
              items: <String>['Black', 'Brown', 'Red', 'Orange', 'Green', 'Blue', 'Violet', 'Grey', 'White', 'Gold', 'Silver']
                  .map<DropdownMenuItem<String>>((String value){
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                  onTap: colorbandvalue(),
                );
              }
              ) .toList(),
            ),

          ]
        ),
    );
  }

  colorbandvalue() {
    int band1 = dropDownValue.toString() as int;
  }
}
/*
class ColorsForm extends StatefulWidget{
  const ColorForm({Key? key}) : super (key: key);
  Color dropDownColor = Colors.black;
  @override
  ColorFormState createState(){
    return ColorFormState();
  }
  class ColorFormState extends State<ColorForm>{
    @override
  final _formKey = GlobalKey(FormState);

    @override
  Widget build(BuildContext context){
      return Form(
      child: Column(
      children: <Widget>[
        TextFormField(
  decoration: const InputDecoration(
  labelText: 'Line 1 Color'
  ),
  ),
    new Container(
      padding: const EdgeInsets.symmetric(),

      child: new DropdownButton<Colors>(
              items: <ColoredBox>[ ColoredBox(color: Color.fromRGBO(0, 0, 0, 100)), new ColoredBox(color: Color.fromRGBO(0, 0, 0, 100)])[
                return DropdownMenuItem<ColoredBox>(
  child: Color(Future.value()),
  );
                Colors.black,
  Colors.brown, Colors.purpleAccent
  ]
              .map<DropdownMenuItem<Container>>((Container dropDownColor)){
                return DropdownMenuItem<Container>(
                  color: dropDownColor,
  child : Container(dropDownColor),
  
        )
  }
      .map((e) => <DropdownMenuItem<Colors>>(Colors value))){
    return DropdownMenuItem<Colors>(
    value: Future.value(),
  child: Container(
  color: Colors.dropDownValue,
  ),
    )
  }
  new Container( padding: const EdgeInsets.symmetric(7.0),
  color: Colors.black,),Colors.black, Colors.Brown, Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.purpleAccent, Colors.grey, Colors.white)
  ]
  new DropdownButton(items: ), //TODO: change purple to Xee82ee)
  
  )
  ],
  
      ));
  }

  }
}
*/
