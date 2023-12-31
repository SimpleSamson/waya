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
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'adHelper.dart';
Widget? widx;
String? ErrorMsg;

void main() {
  runApp(WayaApp());
}

class WayaApp extends StatelessWidget {
  Future<InitializationStatus> _initGoogleMobileAds(){
    //initialize
    return MobileAds.instance.initialize();
  }
  const WayaApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Electric Engineer Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WayaHomePage(title: 'Waya Home Page'),
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
        '/stackexchange':(BuildContext context) => stackExchangeRoute(),
      }
    );
  }
}

class WayaHomePage extends StatefulWidget {
  const WayaHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<WayaHomePage> createState() => _WayaHomePageState();
}
class _WayaHomePageState extends State<WayaHomePage> {
  BannerAd? _wayaBannerAd;
  //advert addition
  void initState(){
    BannerAd(
      request: AdRequest(),
      size: AdSize.banner,
        adUnitId: adHelper.wayaBannerAdUnitId,
        listener: BannerAdListener(onAdLoaded: (ad){
          setState(() {
            _wayaBannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, error){
          print('failed to load a banner ad: ${error.message}');
          ad.dispose();
        },
        ),
    ).load();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
      appBar: AppBar(
        title: wayaTitle(),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
//          remove these
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('What would you like to do?'),
                  ElevatedButton.icon(onPressed: (){ Navigator.pushNamed(context, '/calculators'); }, icon: Icon(Icons.calculate), label: Text('Use tools and calculators')),
                  Padding(padding: EdgeInsets.symmetric(vertical: 1.7, horizontal: 0)),
                  ElevatedButton.icon(onPressed: (){ Navigator.pushNamed(context, '/read');}, icon: Icon(Icons.my_library_books_outlined), label: Text('Study')),
                  Padding(padding: EdgeInsets.symmetric(vertical: 1.7, horizontal: 0)),
                  ElevatedButton.icon(onPressed: (){ Navigator.pushNamed(context, '/discussion');}, icon: Icon(Icons.wechat_outlined), label: Text('Discuss')),
                ],
              ),
              //advert
              SafeArea(
                child: Stack(children: [
                  Center(),
                  if(_wayaBannerAd !=null )
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: _wayaBannerAd!.size.width.toDouble(),
                        height: _wayaBannerAd!.size.height.toDouble(),
                        child: AdWidget(ad: _wayaBannerAd!),
                      ),
                    )
                ],),
              ),


            ],
          ),
      ),
    ),);
  }
  //place in exit
  @override
  void dispose(){
    _wayaBannerAd?.dispose();
    super.dispose();
  }
}
class VoltageDividerState extends State<VoltageDivider>{
  final _ResistorFormKey = GlobalKey<FormState>();

  double Resistor1 = 0;
  double Resistor2 = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          Form(child: Column(
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
        ),
        ElevatedButton(
            onPressed: () {
              CalculateResistorValue();
              },
            child: Text('Calculate')
        ),
      ],
    ))]);
  }

  void CalculateResistorValue() {
  }
}
class ReadingNav extends Scaffold{

}