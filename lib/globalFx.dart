import 'package:flutter/material.dart';

const String wayaBaseUrl = "https://waya.airesol.org";
const String wikipediaAddress = "https://en.m.wikipedia.org/wiki/Portal:Electronics";
//const String mitAddress = "https://ocw.mit.edu/search/?t=Electronics";
const String mitAddress = "https://ocw.mit.edu/search/?q=electronics";
//const String archiveAddress = "https://archive.org/search.php?query=electrical";
//const String archiveAddress = "https://archive.org/search.php?query=electronics";
const String archiveAddress = "https://archive.org/search.php?query=electrical%20engineering";
const String stackAddress = "https://electronics.stackexchange.com/";

class wayaTitle extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _wayaTitleState();
}

class _wayaTitleState extends State<wayaTitle>{
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset('images/logo.png', width: 49, height: 49,),
//        IconButton(onPressed: (){ Navigator.pushNamed(context, '/home');}, icon: Icon(Icons.home)),
//        IconButton(onPressed: (){ Navigator.pushNamed(context, '/read');}, icon: Icon(Icons.library_books_outlined)),
      ],
    );
  }
}

String EmptyValueError(){
  return 'Please check that you have entered all values';
}
//class PdfSingleton{

  // static final PdfSingleton _pdfSingleton = PdfSingleton._internal();
  // factory PdfSingleton(){
  //   return _pdfSingleton;
  // }
  // PdfSingleton._internal();// = 'lib/wayadocs/offlinebooks.pdf';
//  String pdfLink;
//}
class EarlyInstantiationPdfSingleton {
  EarlyInstantiationPdfSingleton._privateConstructor();

  static final EarlyInstantiationPdfSingleton _instance = EarlyInstantiationPdfSingleton._privateConstructor();

  factory EarlyInstantiationPdfSingleton() {
    return _instance;
  }

  // static LazyInstantionPdfSingleton get instance {
  //   return _instance ??= LazyInstantiationPdfSingleton._privateConstructor();
  // }
  String thePdfLocationString(String stringValue){
//    open pdf
    return stringValue;
  }
}
