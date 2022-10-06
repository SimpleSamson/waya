
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'globalFx.dart';

class DiscPage extends StatefulWidget{
  DiscPage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  State<StatefulWidget> createState() => _DiscPageState();

}

class _DiscPageState extends State<DiscPage>{
 // WebView{
 //   const DiscPage({Key? key, this.title}) : super(key: key);

  Widget build(BuildContext context){
    final size = MediaQuery.of(context).size;
    return 
      Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: wayaTitle(),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              minLeadingWidth: 14,
              title: Card(
                  child:
                  Container(
                    child: Column(
                      children: [
                        Image.asset('images/stackexchange.png', width: size.width *.21, height: size.height*0.21,),
                        Text("stackexchange"),
                        TextButton.icon(onPressed: (){Navigator.pushNamed(context, '/stackexchange');}, icon: Icon(Icons.web), label: Text("StackExchange"))
                      ],
                    ),
                  )
              ),
            ),
          ],
        ),
      );
    }
}
class stackExchangeRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => stackExchangeRouteState();
}
class stackExchangeRouteState extends State<stackExchangeRoute>{
  @override
  Widget build(BuildContext context){
    return WebView(
      initialUrl: stackAddress,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}