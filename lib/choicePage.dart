import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waya/codeTransformations.dart';
import 'AC.dart';
import 'DCLaws.dart';
import 'diode.dart';
import 'globalFx.dart';
import 'resistorcalc.dart';
import 'transistor.dart';
import 'voltageDivider.dart';
class ChoicePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChoiceState();
}

class _ChoiceState extends State<ChoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: wayaTitle(),
      ),
      body: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(17), child: Center( child: Text('Choose a calculator'))),

          ListTile(
              minLeadingWidth: 35,
              title: Card(
                elevation: 7.0,
                child: Container(
                  child: Column(
                    children: [
                      Image.asset(
                        'images/binary.png',
                        width: 49,
                        height: 49,
                      ),
                      Text("Code"),
                      TextButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => codeCalculator()));
                          },
                          icon: Icon(Icons.calculate),
                          label: const Text("CALCULATE")),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => codeCalculator() ));
              }),
          ListTile(
              minLeadingWidth: 35,
              title: Card(
                elevation: 7.0,
                child: Container(
                  child: Column(
                    children: [
                      Image.asset('images/2.png', width: 49, height: 49),
                      Text("Transistor"),
                      TextButton.icon(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder:(context) => Transistor()));
                        },
                        icon: Icon(Icons.forward),
                        label: const Text(""),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Transistor()));
              }),
          ListTile(
              minLeadingWidth: 35,
              title: Card(
                elevation: 7.0,
                child: Container(
                  child: Column(
                    children: [
                      Image.asset(
                        'images/3.png',
                        width: 49,
                        height: 49,
                      ),
//                  Icon(Icons.add_a_photo_outlined, size: 49,),
                      Text("Resistor"),
                      TextButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResistorCalc()));
                          },
                          icon: Icon(Icons.calculate),
                          label: const Text("CALCULATE")),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResistorCalc()));
              }
          ),

          ListTile(
            minLeadingWidth: 35,
            title: Card(
              elevation: 7.0,
              child: Column(
                children: [
                  Image.asset(
                    'images/4.png',
                    width: 49,
                    height: 49,
                  ),
                  Text("Diode"),
                  TextButton.icon(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => diode()));
                      },
                      icon: Icon(Icons.calculate),
                      label: const Text("CALCULATE")),
                ],
              ),
            ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => diode()));
              }
          ),
          ListTile(
            minLeadingWidth: 35,
            title: Card(
              elevation: 7.0,
              child: Column(
                children: [
                  Image.asset(
                      'images/7.png',
                      width: 49,
                      height: 49,
                    ),
                  Text("Ohms Law"),
                  TextButton.icon(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => OhmsLaw()));
                      },
                      icon: Icon(Icons.calculate_outlined),
                      label: const Text("")),
                ],
              ),
            ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OhmsLaw()));
              }
          ),
          ListTile(
            minLeadingWidth: 35,
            title: Card(
            elevation: 7.0,
            child: Column(
                children: [
                  Image.asset('images/1.png', width: 49, height: 49,),
                  Text("Capacitors"),
                  TextButton.icon(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Capacitor()));
                  }, icon: Icon(Icons.calculate), label: const Text(""))

                  // Image.asset(
                  //   'images/5.png',
                  //   width: 49,
                  //   height: 49,
                  // ),
                  // Text("AC"),
                  // TextButton.icon(
                  //     onPressed: () {
                  //       Navigator.push(context,
                  //           MaterialPageRoute(builder: (context) => AC()));
                  //     },
                  //     icon: Icon(Icons.calculate_rounded),
                  //     label: const Text("CALCULATE")
                  // ),
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
                    'images/20.png',
                    width: 49,
                    height: 49,
                  ),
                  Text("Voltage Divider"),
                  TextButton.icon(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => VoltageDivider()));
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
                        builder: (context) => VoltageDivider())
                );
              }
          ),
        ],
      ),
    );
  }
}
