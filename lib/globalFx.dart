import 'package:flutter/material.dart';

const String wayaBaseUrl = "https://waya.airesol.org";
const String wikipediaAddress = "https://en.m.wikipedia.org/wiki/Portal:Electronics";
//const String mitAddress = "https://ocw.mit.edu/search/?t=Electronics";
const String mitAddress = "https://ocw.mit.edu/search/?q=electronics";
//const String archiveAddress = "https://archive.org/search.php?query=electrical";
//const String archiveAddress = "https://archive.org/search.php?query=electronics";
const String archiveAddress = "https://archive.org/search.php?query=electrical%20engineering";
const String stackAddress = "https://engineering.stackexchange.com/";
class wayaTitle extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _wayaTitleState();
}

class _wayaTitleState extends State<wayaTitle>{
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(onPressed: (){ Navigator.pushNamed(context, '/home');}, icon: Icon(Icons.home)),
        IconButton(onPressed: (){ Navigator.pushNamed(context, '/read');}, icon: Icon(Icons.library_books_outlined)),
      ],
    );
  }
}

String EmptyValueError(){
  return 'Please check that you have entered all values';
}
