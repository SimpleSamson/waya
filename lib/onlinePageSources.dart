import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'globalFx.dart';
import 'wayaReading.dart';

class wikipediaRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => wikipediaRouteState();
}

class wikipediaRouteState extends State<wikipediaRoute>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WebView(
      initialUrl: wikipediaAddress,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
class mitRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => mitRouteState();

}
class mitRouteState extends State<mitRoute>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WebView(
      initialUrl: mitAddress,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
class archiveRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => archiveRouteState();

}
class archiveRouteState extends State<archiveRoute>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WebView(
      initialUrl: archiveAddress,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}