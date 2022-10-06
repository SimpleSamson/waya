import 'package:flutter/material.dart';
import 'package:waya/AC.dart';
import 'package:waya/globalFx.dart';

class OhmsLaw extends StatefulWidget{
  const OhmsLaw({Key? key}): super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OhmsLaw();
  }


}

class _OhmsLaw extends State<OhmsLaw>{
  final GlobalKey<FormState> _ohmsFormKey = GlobalKey<FormState>();
  bool visible = false;
  final CurrentController = TextEditingController();
  final ResistanceController = TextEditingController();
  final CurrentInController = TextEditingController();
  final CurrentOutController = TextEditingController();
  final VoltageController = TextEditingController();
  final VoltageOutController = TextEditingController();
  final _OhmsKey = GlobalKey<FormState>();

  var voltage;

  ohmsDiv(){
    double Current = double.parse(CurrentController.text);
    double Resistance = double.parse(ResistanceController.text);
    voltage = Current * Resistance;
    try {
      return voltage;
    }on Exception catch(e){
      print('cannot calculate');
    } catch(e){
      print('exception 2');
    }
//    return voltage;
  }
  @override
  Widget build(BuildContext context) {
    //TODO depending on the dropdown choice return Voltage, resistance... calculators
    return Scaffold(
      appBar: AppBar(title: wayaTitle(),),
      body: Padding(padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 17),
        child: Form(key: _ohmsFormKey, child: Column(
          key: _OhmsKey,
          children: <Widget>[
            Image.asset(
              'images/7.png',
              width: 71,
              height: 71,
            ),
            Padding(padding: const EdgeInsets.all(17)),
            TextFormField(
              validator: (String? value){
                return(value == null || value.isEmpty ? 'Please Enter Some Text.' : null);
                // if(value == null || value.isEmpty){
                //   return 'Please Enter Some Text';
                // }
                // return null;
              },
              autovalidateMode: AutovalidateMode.always,
              keyboardType: TextInputType.number,
              controller: CurrentController,
              decoration: const InputDecoration(
                hintText: 'Amperes',
                labelText: 'Current',
              ),
            ),
            TextFormField(
              validator: (String? value){return(value == null || value.isEmpty ? 'Please Enter Some Text.' : null);},
              autovalidateMode: AutovalidateMode.always,
              keyboardType: TextInputType.number,
              controller: ResistanceController,
              decoration: const InputDecoration(
                hintText: 'Ohms',
                labelText: 'Resistance',
              ),
            ),
            ElevatedButton(onPressed: (){
//              ohmsDiv();
              if(FormatException().message.contains("double")){
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter valid values'),));
//                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Processing')));
              } else showDialog(context: context, builder: (BuildContext context)
              {
                return AlertDialog(
                  title: Text('Voltage'),
                  content: Text(ohmsDiv().toString() + ' V'),
                  actions: <Widget>[
                    ElevatedButton(onPressed: () {
                      Navigator.of(context).pop();
                    }, child: new Text('OK')),
                  ],
                );
              }
              );
            },
                child: const Text('=')
            ),
          ],
        ),),
      ),
    );
  }
}