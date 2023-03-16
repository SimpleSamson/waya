import 'dart:io';

class adHelper{
  static String get wayaBannerAdUnitId{
    if(Platform.isAndroid){
      return 'ca-app-pub-8414088282794460/3724844165';
    }else if(Platform.isIOS){
      return 'ca-app-pub-8414088282794460/6923423384';
    }else if(Platform.isLinux) {
      return '';
    }else{
      throw 'Unsupported platform';
    }
  }
}
//<-- adunitid           android:value="ca-app-pub-8414088282794460/3724844165" />
