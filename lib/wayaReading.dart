import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:waya/onlinePageSources.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'globalFx.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
//import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:xml/xml.dart';

Future<PDFDocument> file() async{
  var x = await PDFDocument.fromFile(File('/wayadocs/offlinebooks.pdf')); //File('/wayadocs/offlinebooks.xml');
  return x;
}
class Book{
  final bookTitle;
  final Image? bookCover;
  final String? bookDescription;
  final String pathToBook;
  Book({this.bookTitle, this.bookCover, this.bookDescription, required this.pathToBook});
}
class ReadPage extends StatefulWidget {
  const ReadPage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  State<ReadPage> createState() => _ReadPageState();

}

class _ReadPageState extends State<ReadPage>{
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: wayaTitle(),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("How Would You like to Read"),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonBar(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: (){
                          Navigator.pushNamed(context, '/readonline');
                        },
                        child: const Text('Read Online'),
                      ),
                      ElevatedButton(
                        onPressed: (){
                          OfflineReadPage()._pickFiles();
//                          selectStorage(context);
//                          Navigator.pushNamed(context, '/readoffline');
                        },
                        child: const Text('Read Offline'),
                      )
                    ],
                  ),
                ])
          ]),
    );
  }
}

class OnlineReadPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _OnlineReadPageState();
}
class _OnlineReadPageState extends State<OnlineReadPage>{
  Widget build(BuildContext context){
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: wayaTitle(),
        ),
        body : ListView(
          children: <Widget>[
            ListTile(
              minLeadingWidth: 14,
              title: Card(child:
                Container(
                  child: Column(
                    children: [
                      Image.asset('images/enwiki.png', width: size.width * 0.21,height: size.height * 0.21,),
                      Text("wikipedia"),
                      TextButton.icon(onPressed: (){
//                        wikipediaRoute();
                        Navigator.pushNamed(context, '/wikiRoute');
                      }, icon: Icon(Icons.web), label: Text("Wikipedia"))
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/wikiRoute');
              },
            ),
            ListTile(
              minLeadingWidth: 14,
              title: Card(child:
              Container(
                child: Column( children: [
                  Image.asset('images/mit-ol.png', width: size.width * 0.21,height: size.height * 0.21,),
                  Text("MIT"),
                  TextButton.icon(onPressed: (){
                    Navigator.pushNamed(context, '/mitRoute');
                  }, icon: Icon(Icons.web), label: Text("mit ocw"))
                ],
                ),
              ),
              ),
              onTap: (){
                Navigator.pushNamed(context, '/mitRoute');
              },
            ),
            ListTile(
              minLeadingWidth: 14,
              title: Card(child:
              Container(
                child: Column( children: [
                  Image.asset('images/Internet_Archive.png', width: size.width * 0.14,height: size.height * 0.14,),
                  Text("ARCHIVE"),
                  TextButton.icon(onPressed: (){
                    Navigator.pushNamed(context, '/archiveRoute');
                  }, icon: Icon(Icons.web), label: Text("archive"))
                ],
                ),
              ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/archiveRoute');
              },
            ),
          ],
        ),
    );
  }
}
class OfflineReadPage extends StatelessWidget{
  bool _isLoading = false;

  void _pickFiles() async {
    FileType _picici = FileType.custom;

//  File offlineRes = File();
  FilePickerResult? pickerResult = await FilePicker.platform.pickFiles(
      type: _picici,
      allowMultiple: false,
      onFileLoading: (FilePickerStatus status) => print(status),
      allowedExtensions: ['pdf', 'txt', 'doc', '']);//await FilePicker.platform.pickFiles();
  if(pickerResult != null){
    File file = File(pickerResult.files.single.path ?? "path unavailable");

  }
//  PDFDocument doc = PDFDocument.fromAsset(_paths) as PDFDocument;
  List<PlatformFile>? _paths;
  String? _directoryPath;

//    _resetState();
    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: _picici,
        allowMultiple: false,
        onFileLoading: (FilePickerStatus status) => print(status),
        allowedExtensions: ['pdf', 'txt', 'doc', '']
      ))
          ?.files;
    } on PlatformException catch (e) {
      log('Unsupported operation' + e.toString());
    } catch (e) {
      log(e.toString());
    }
    // if (!mounted) return;
    // setState(() {
    //   bool _isLoading = false;
    //   String _fileName =
    //   _paths != null ? _paths!.map((e) => e.name).toString() : '...';
    //   _userAborted = _paths == null;
    // });

  }


//   void _pickFiles() async{
// //    _resetState();
//     try{
//       _directoryPath = null;
//       _paths = (await FilePicker.platform.pickFiles(
//           type: _picici,
//           allowMultiple: false,
//           onFileLoading: (FilePickerStatus status) => print(status),
//           allowedExtensions: ['pdf', 'txt', 'doc', ''])) as List<PlatformFile>?;
//     } catch(e){
//       log(e.toString());
//     }
//   }
  @override
  Widget build(BuildContext context) {
    // Creates a widget that registers a callback to veto attempts by the user to dismiss the enclosing
    // or controllers the system's back button
  return Container(
    child: Scaffold(
      body: Card(
      child: _isLoading ?
      Center(child: CircularProgressIndicator()) :
      FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot<PDFDocument> snapshot){
        if(snapshot.hasData){
          return PDFViewer(document: file as PDFDocument);
        }PDFDocument selectedDoc = snapshot.data as PDFDocument;
          return PDFViewer(document: selectedDoc);
        }
      ) //PDFViewer(document: PDFDocument.fromFile(file) as PDFDocument)//AlertDialog(title: Text("pick file"), content: Text("x"),)
      // ElevatedButton(onPressed: (){
      //   _pickFiles(); },
        //   child: Text("Look")),  //fileOffOutput(),
        ),)
      );
  }

  // fileOffOutput() {
  //   Widget x = Text("this is a placeholder");
  //   if(result != null){
  //     PlatformFile file = result.files.first;
  //     x = Row(
  //       children : [
  //         Text("${file.name}"),
  //         Text("${file.bytes}"),
  //         Text("$file.size"),
  //         Text("$file.extension"),
  //         Text("${file.path}"),
  //       ],
  //     );
  //   } else{
  //     //user cancelled the picker
  //   }
  //   return x;
  // }
}

// class _OfflineReadPageState extends State<OfflineReadPage> {
//   late Book libraryBook;
//
//   // final GlobalKey<SfPdfViewerState>_pdfViewerKey = GlobalKey();
//   // @override
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(onWillPop: () async {
//       if(await fmController.isRootDirectory()){
//         return true;
//       }else{
//         fmController.goToParentDirectory();
//         return false;
//       }
//     }, child:
//       Scaffold(
//       appBar: AppBar(title: wayaTitle(),),
//       body: Container(
//         margin: EdgeInsets.all(17),
//         child: Container(
//           child: FileManager(
//               controller: fmController,
//               builder: (context, snapshot){
//                 final List<FileSystemEntity> entities = snapshot;
//                 return ListView.builder(
//                   itemCount: entities.length,
//                   itemBuilder: (context, index) {
//                   FileSystemEntity entity = entities[index];
//                   return Card(
//                     child: ListTile(
//                       leading: FileManager.isFile(entity) ? Icon(Icons.feed_outlined) : Icon(Icons.folder),
//                       title: Text(FileManager.basename(entity)),
//                       subtitle: subtitle(entity),
//                       onTap: (){
//                         if(FileManager.isDirectory(entity)){
//                           fmController.openDirectory(entity);
//                           entity.exists();
//                       }else{
//                           entity.exists();
//                         }
//                       }
//
//                       //     () async {
//                       //   if(FileManager.isDirectory(entity)){
//                       //     fmController.openDirectory(entity);
//                       //     entity.exists();
//                       //     int sizew = (await entity.stat()).size;
//                       //   }
//                       // },
//                     ),
//                   );
//                 },
//               );
//             }
//           ),
//         ),
//       ),
// //       ListView(
// //           children: [
// //             selectStorage(context),
// //             //save in cache below
// // //           booksDBLoop()
// //           ]
// //       ),
//       //     appBar: AppBar(
//       //       // Here we take the value from the MyHomePage object that was created by
//       //       // the App.build method, and use it to set our appbar title.
//       //       title: wayaTitle(),
//       //     ),
//       //     floatingActionButton: _pdfViewerKey.currentState?.openBookmarkView(),
//       //     body : SfPdfViewer.network('https://dnhorth.pdf', key: _pdfViewerKey)//Text('show files'), //allow saving of file locations
//       )
//     );
//   }
//
//   bookStorage() {
//     final builder = XmlBuilder();
//     builder.processing('xml', 'version="1.0"');
//     builder.element('bookTitle', nest: () {
//       builder.attribute('lang', 'en');
//       builder.text('${libraryBook.bookTitle}');
//     });
//     builder.element('storagePath', nest: () {
//       builder.attribute('lang', 'en');
//       builder.text('${libraryBook.pathToBook}');
//     });
//   }
//
//   booksDBLoop() {
//     //store recent books in cache
// //    for each item from the books database create a view like above
//     final bookTile = List<ListTile>.generate(1000, (index) =>
//     index % 6 == 0 ?
//     ListTile(
//       minLeadingWidth: 35,
//       title: Card(
//         child: Column(
//             children: [
//               Image.asset('${libraryBook.bookCover}'),
//               Text('${libraryBook.bookTitle}'),
//               Text('${libraryBook.bookDescription}'),
//             ]
//         ),
//       ),
//     ) :
//     ListTile(
//       minLeadingWidth: 35,
//       title: Card(
//         child: Column(
//             children: [
//               Image.asset('images/1.png'),
//               Text('${libraryBook.bookTitle}'),
//               Text('${libraryBook.bookDescription}'),
//             ]
//         ),
//       ),
//     ));
//     return bookTile;
//   }
//   Widget subtitle(FileSystemEntity entity){
//     return FutureBuilder<FileStat>(
//         future: entity.stat(),
//         builder: (context, snapshot){
//           if(snapshot.hasData){
//             if(entity is File){
//               int size = snapshot.data!.size;
//               return Text("${FileManager.formatBytes(size)}");
//             }
//             return Text("${snapshot.data!.modified}");
//           } else {
//             return Text("");
//           }
//         });
//   }
// }
//   selectStorage(BuildContext context) {
//     showDialog(context: context, builder: (context) => Dialog(child: FutureBuilder<List<Directory>>(
//       builder: (context, wayaDirBuilder){
//         if(wayaDirBuilder.hasData){
//           final List<FileSystemEntity> storageList = wayaDirBuilder.data!;
//           return Padding(padding: const EdgeInsets.all(7),
//               child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: storageList.map((e) => ListTile(title: Text("${FileManager.basename(e)}",),
//                     onTap: (){
//                     fmController.openDirectory(e);
//                     Navigator.pop(context);
//                     },
//                   )).toList()));
//         }
//         return CircularProgressIndicator();
//         //   Dialog(
//         //   child: FileManager(builder: (BuildContext context, List<FileSystemEntity> snapshot) {
//         //     if(snapshot.isNotEmpty){
//         //       final List<FileSystemEntity> storageList = snapshot;
//         //       return Padding(padding: EdgeInsets.all(7), child: Column(children: storageList.map((e) => ListTile(title: Text("${FileManager.basename(e)}",),onTap: (){ fmController.openDirectory(e); Navigator.pop(context); },),).toList()));
//         //     } else throw Text("nothing found");
//         //   }, controller: fmController,),
//         // );
//       },
//     ),));
//     // showDialog(context: context, builder: (context) => Dialog(child: FutureBuilder<List<Directory>>(
//     //   future: FileManager.getStorageList(),
//     //   builder: (context, snapshot){
//     //     if (snapshot.hasData){
//     //       final List<FileSystemEntity> storageList = snapshot.data!;
//     //       return Padding(
//     //         padding: const EdgeInsets.all(7),
//     //         child: Column(
//     //             mainAxisSize: MainAxisSize.min, children: storageList.map((e) => ListTile(title: Text("${FileManager.basename(e)}",), onTap: (){ fmController.openDirectory(e);
//     //         Navigator.pop(context); },)).toList()),);
//     //     }
//     //     return Dialog(child: CircularProgressIndicator(),);
//     //   },
//     // ),));
//   }
//
//
