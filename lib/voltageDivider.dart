import 'package:flutter/material.dart';
import 'globalFx.dart';
class VoltageDivider extends StatefulWidget{
  const VoltageDivider({Key? key}):super(key:key);
  // const VoltageDivider({Key? key, this.Resistor1, this.Resistor2}) : super(key: key);
  // final FormField? Resistor1;
  // final FormField? Resistor2;

  @override
  State<StatefulWidget> createState() => _VoltageDivider();
}

class _VoltageDivider extends State<VoltageDivider>{
  double? OutPutVoltage;// = 12.0;
//  final GlobalKey<FormState> _resistorFormKey = GlobalKey<FormState>();
  // final Future<String> resistorValue = Future<String>.delayed(
  //   const Duration(seconds: 3),
  //       () => 'value is 35',
  // );

 // bool visible = false;

  final resistor1Controller = TextEditingController();
  final resistor2Controller = TextEditingController();
  final VoltageOutController = TextEditingController();
  final VoltageInController = TextEditingController();
  final OutPutVoltageController = TextEditingController();

//  var resistor1;
  Future voltdiv() async {
  //  double? xy;
    // setState(() {
    //   visible = true;
    // });

    double? resistor1Value = double.tryParse(resistor1Controller.text);
    double? resistor2Value = double.tryParse(resistor2Controller.text);
    double? VoltageOutValue = double.tryParse(VoltageOutController.text);
    double? VoltageInValue = double.tryParse(VoltageInController.text);

//    double calculateValue() {
//      late double x = 0;
    //output voltage
    // if(OutPutVoltage.toString().isEmpty || resistor1Value.toString().isEmpty) {
    //   setState(() {
    //     visible = false;
    //   });
      OutPutVoltage = (VoltageInValue! * resistor2Value!) / (resistor1Value! + resistor2Value);
//        OutPutVoltage;
    //  xy = OutPutVoltage;
   // }
    print( OutPutVoltage.toString());
//      return x;
//    }

  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: wayaTitle(),
      ),
      body:
      Padding(padding: const EdgeInsets.symmetric(vertical:17, horizontal:17),
        child:
        Form(
            //key: _resistorFormKey,
            child: ListView(
              //icon then 2 resistors
              children: <Widget>[
                Center(
                  child: Image.asset(
                    'images/20.png',
                    width: 171,
                    height: 171,
                  ),
                ),
                Padding(padding: const EdgeInsets.symmetric(vertical:17, horizontal:17)),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: resistor1Controller,
                  decoration: const InputDecoration(
                    hintText: 'Resistor1',
                    labelText: 'Resistor 1',
                  ),
/*            validator: (value){
              if(value!.isNotEmpty){
                resistor1Value = value as double;
              }
              return null;
            },*/
                ), //Resistor 1
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: resistor2Controller,
                  decoration: const InputDecoration(
                    hintText: 'Resistor2',
                    labelText: 'Resistor 2',
                  ),
/*            validator: (value){
              if(value!.isNotEmpty){
                resistor2Value = value as double;
              }
              return null;
            }*/
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller:VoltageInController,
                  decoration: InputDecoration(
                    hintText: 'VoltageIn',
                    labelText: 'Voltage In',
                  ),
/*
              validator: (value){
                if(value == null||value.isEmpty){

                }
                if(value!.isNotEmpty){
                  VoltageInValue = value as double;
                }
                return null;
              }
*/
                ),
//                 TextFormField(
//                   keyboardType: TextInputType.number,
//                   controller : VoltageOutController,
//                   decoration: const InputDecoration(
//                     hintText: 'VoltageOut',
//                     labelText: 'Voltage Out',
//                   ),
// /*
//               validator: (value){
//                 if(value!.isNotEmpty){
//                   VoltageOutValue = value as double;
//                 }
//                 return null;
//               }
// */
//                 ),
                ElevatedButton(
                    onPressed: (){
                      //return true if valid false otherwise
//                if(_resistorFormKey.currentState!.validate()){
//                  calculateValue();
                      voltdiv();
                      showDialog(context: context, builder: (BuildContext context){
                        return AlertDialog(
                          title: Text("Output Voltage"),
                            content: Text(OutPutVoltage.toString()),//place a builder that gets value from OutputVoltage//(OutPutVoltage.toString()),
                          actions: <Widget>[
                            ElevatedButton(onPressed: (){ Navigator.of(context).pop(); }, child: new Text('OK')),
                          ],
                        );
                      });
//                }
                    },
                    child: const Text('Calculate')
                ),
                // Visibility(
                //     visible: visible,
                //     child: Container(
                //       margin: EdgeInsets.all(17),
                //       child: CircularProgressIndicator(),
                //     )),
                // TextField(
                //   decoration: InputDecoration(
                //     labelText: 'Required Value',
                //   ),
                // ),
              ],
            )
        ),
      ),
    );
  }
/*
  String resistorText (){
    double x = resistor1Value + resistor2Value; //resistors
    return x.toString();
  }
*/

}
