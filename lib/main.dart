import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:waya/onlinePageSources.dart';
import 'DiscPage.dart';
import 'choicePage.dart';
import 'globalFx.dart';
import 'voltageDivider.dart';
import 'wayaReading.dart';
Widget? widx;
String? ErrorMsg;

void main() {
  runApp(WayaApp());
}

class WayaApp extends StatelessWidget {
  const WayaApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Electric Engineer Calculator',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: //OfflineReadPage(),
        //WayaHomePage(title: 'Waya'),
        WayaHomePage(title: 'Waya Home Page'),
//        home: const VoltageDivider(),
//      home: const DiscPage(),
//    home: const ReadPage(),
//    home: const CalculatorPage(),
//    home: VoltageDivider(),
//    home: ChoicePage(),
      routes: <String, WidgetBuilder>{
        '/home' : (BuildContext context) => WayaHomePage(title: 'Home'),
        '/calculators': (BuildContext context) => ChoicePage(),
        '/discussion': (BuildContext context) => DiscPage(title: 'discussion page'),
        '/read': (BuildContext context) => const ReadPage(title: 'Study'),
        '/readonline': (BuildContext context) => OnlineReadPage(),
        '/readoffline': (BuildContext context) => OfflineReadPage(),
        '/wikiRoute': (BuildContext context) => wikipediaRoute(),
        '/mitRoute': (BuildContext context) => mitRoute(),
        '/archiveRoute':(BuildContext context) => archiveRoute(),
        '/discussion':(BuildContext context) => DiscPage(),
      }
    );
  }
}

class WayaHomePage extends StatefulWidget {
  const WayaHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<WayaHomePage> createState() => _WayaHomePageState();
}
class _WayaHomePageState extends State<WayaHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Material(
      child: Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: wayaTitle(),
      ),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
//          remove these
            children: <Widget>[
              Text('What would you like to do?'),
              ElevatedButton.icon(onPressed: (){ Navigator.pushNamed(context, '/calculators'); }, icon: Icon(Icons.calculate), label: Text('Use tools and calculators')),
              ElevatedButton.icon(onPressed: (){ Navigator.pushNamed(context, '/read');}, icon: Icon(Icons.my_library_books_outlined), label: Text('Study')),
              ElevatedButton.icon(onPressed: (){ Navigator.pushNamed(context, '/discussion');}, icon: Icon(Icons.wechat_outlined), label: Text('Discuss')),
            ],
          ),
      ),
/*
      floatingActionButton: FloatingActionButton(
        onPressed: (){_exitApp()},
        tooltip: 'exit',
        child: const Icon(Icons.add),

      ), // This trailing comma makes auto-formatting nicer for build methods.
*/
    ),);
  }
}
class VoltageDividerState extends State<VoltageDivider>{
  final _ResistorFormKey = GlobalKey<FormState>();

  double Resistor1 = 0;
  double Resistor2 = 0;
  @override
  Widget build(BuildContext context) {
    //thanks to javatpoint.com for label
    //get child =>
    return Form(child: Column(
      children: <Widget>[
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Resistor 1',
          ),
          onFieldSubmitted: (String? value){
            Resistor1 = value as double;
          },
        ),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Resistor 2',
          ),
        onFieldSubmitted: (String? value){
            Resistor2 = value as double;
    },
//    TextInputType: TextInputType.number,
        ),
        ElevatedButton(
            onPressed: () {
              CalculateResistorValue();
              },
            child: Text('Calculate')
        ),
      ],
    ));
  }

  void CalculateResistorValue() {
    //field1+field2
  }
}
class ReadingNav extends Scaffold{

}