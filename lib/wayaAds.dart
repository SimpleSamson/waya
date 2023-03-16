import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

DateTime adloadDateTime = DateTime(2000, DateTime.tuesday, 1); //initialize adLoad to avoid null
DateTime adOpenedDateTime = DateTime(2000, DateTime.wednesday, 7);
final BannerAd wayaBanner = BannerAd(
//  adUnitId: 'ca-app-pub-3940256099942544/6300978111',
  adUnitId: 'ca-app-pub-8414088282794460/3724844165',
  size: AdSize.banner,
  request: AdRequest(),
  listener: BannerAdListener(),
);
final BannerAdListener listener = BannerAdListener(
  //called when add successfully received
  onAdLoaded: (Ad ad) => adloadDateTime = DateTime.now(),
  onAdFailedToLoad: (Ad ad, LoadAdError error){
    ad.dispose();
    print('adFailed to load $error');
  },
  onAdOpened: (Ad ad) => adOpenedDateTime = DateTime.now(),

);
final adDateLoadDifference = DateTime.now().difference(adloadDateTime);
final loadDiffInDays = adDateLoadDifference.inDays;
final loadDiffInHours = adDateLoadDifference.inHours;
wayaAdManipulation(){
  if(loadDiffInDays > 7){
  //load an ad
    wayaBanner.load();
  }
  if(loadDiffInHours > 7){
    //remove ad
    wayaBanner.dispose();
  }
}
final AdWidget wayaAdWidget = AdWidget(ad: wayaBanner);
//TODO add these timings