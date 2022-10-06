/*
import 'dart:html';
import 'dart:io';
import 'dart:js_util';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

final String wayaBaseUrl = "https://waya.miradi.info/";

void pagechoices(){
  runApp(WayaMainChoices());
}
class WayaMainChoices extends StatefulWidget {
  const WayaMainChoices({Key? key}) :super(key: key);

  @override
  State<WayaMainChoices> createState() => _WayaChoices();
}
class _WayaChoices extends State<WayaMainChoices>{
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData.dark(),
      home: const CalculatorPage(title: 'Calculator Page'),
      routes: <String, WidgetBuilder>{
        '/discussion': (BuildContext context) => DiscPage(title: 'discussion page'),
        '/reading': (BuildContext context) => ReadPage(title: 'reading'),
      },
    );
  }
}
class DiscPage extends WebView{
  const DiscPage({Key? key, this.title}) : super(key: key);

  final String? title;
  Widget build(BuildContext context){
    return WebView(
      initialUrl: wayaBaseUrl + "discussion",
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
class ReadPage extends StatefulWidget {
  const ReadPage({Key? key, this.title}) : super(key: key);
  final String? title;

//  State<ReadPage> createState() => _OfflineReadPage();
  State<ReadPage> createState() => _OnlineReadPage();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ButtonBar(
          buttonHeight: 27,
          children: <ElevatedButton>[
            ElevatedButton(
                onPressed: (){
                  _OnlineReadPage();
                },
                child: Text('Read Online'),
            ),
            ElevatedButton(
                onPressed: (){
                  OfflineReadPage();
            },
                child: Text('Read Offline'),
            )
          ],
        ),
      ),
    );
  }
}
class ReadingNav extends Scaffold{

}
class _OnlineReadPage extends State<ReadPage>{

  Widget build(BuildContext context){
    return WebView(
        initialUrl: wayaBaseUrl + "reading",
        javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
class OfflineReadPage extends State<ReadPage>{

  Widget build(BuildContext context){
    //TODO: implement reading file from storage
    throw 'not yet impl';
  }
}
class CalculatorPage extends StatelessWidget{
    // TODO: implement createState
    const CalculatorPage({Key? key, this.title}) : super(key: key);
    //this widget allows values or resistor to be entered
    // throw UnimplementedError();
    final String? title;
    @override
    Widget build(BuildContext context){
      return DefaultTextStyle(
          style: Theme.of(context).textTheme.headline4!,
          child: Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: const GroupedCalculators(),
          ),
      );
  }
}
//create a nav bar
class GroupedCalculators extends StatelessWidget{
  const GroupedCalculators({Key? key}) : super(key: key);
  @override
  Widget ResistorInfo(BuildContext context){
    return const TextField(
      enabled: true,
//        autofillHints: 'value in ohms',
    );
  }
  Widget build(BuildContext context){
    final PageController controller = PageController(initialPage: 0);
    return PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: const <Widget>[
          Center(
            child: const TextButton(
              onPressed: (){
                VoltageDivider();
              }
                child: const Text('Voltage Divider Calculator'),
            ),
          ),
          Center(
            child: const TextButton(onPressed: ResistorValuePopup(), child: const Text('Resistor Value Calculator')),
          ),
        ],
      );
  }
}

class VoltageDivider extends StatefulWidget{
  const VoltageDivider({Key? key, this.Resistor1, this.Resistor2}) : super(key: key);
  final TextBox? Resistor1;
  final TextBox? Resistor2;

  @override
  TODO: write an input field
  State<StatefulWidget> createState() {
    Widget build(BuildContext context){
      return Navigator(
        initialRoute: 'resistor/resistor1',
        onGenerateRoute: (RouteSettings settings){
          WidgetBuilder builder;
          switch(settings.resistorval){
            case 'resistor/resistor1':
            //get values and on click button calculate the other
              builder = (BuildContext context) => const AddValuesResistor();
              break;
          }
        },
      );
    }
  }



}
  class _CalculatorPageState extends State<CalculatorPage>{
    int _counter2 = 0;

    void _enterKnownValue(){
      getProperty(Icons.text_fields, ContentType.text); //get text from user
      }
      @override
    Widget build(BuildContext context){
      return NavigationRail(
        appBar:
      )
      }
  }
class ResistorCalc extends Form{
  const ResistorCalc({Key? key}): super(key: _FormKey);
  @override
  // TODO: implement child
  Widget get child => TextFormField(
    showCursor: true,
//    TextInputType: TextInputType.number,
  );
}*/
