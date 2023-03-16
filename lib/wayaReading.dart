import 'dart:async';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'globalFx.dart';
//PDFDocument offlinePdfDoc = File('/wayadocs/offlinebooks.pdf') as PDFDocument;
// Future<PDFDocument> file() async{
//   var x = await PDFDocument.fromFile(File('/wayadocs/offlinebooks.pdf')); //File('/wayadocs/offlinebooks.xml');
//   return x;
// }
class chosenPdfBook{
  EarlyInstantiationPdfSingleton earlyInstantiationPdfSingleton = EarlyInstantiationPdfSingleton();
  String? documentx;// = earlyInstantiationPdfSingleton.thePdfLocationString(_OfflineReadPageState().PdfFilePath);// = 'wayadocs/offlinebooks.pdf';
  String? get getDoc{
    return earlyInstantiationPdfSingleton.thePdfLocationString(_OfflineReadPageState().PdfFilePath);// = 'wayadocs/offlinebooks.pdf';;
  }
  set setDoc(String documentx){
    this.documentx = documentx;
//    documentx = PdfDocument.openAsset(docPath) as PdfDocument;
  }
}
final pdfPinchController = PdfControllerPinch(document: PdfDocument.openAsset('wayadocs/placeholder.pdf'));
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
                        onPressed: (() async {
                          //var x = await _OfflineReadPageState().loadDocument2();
                          //TODO: send intent with extension to an app that can open it

                          //ViewWidget.builder(context, , state, (context) => null, document, loadingError);
//                          _OfflineReadPageState()._pdfController.loadDocument(documentFuture)
                          //_OfflineReadPageState().loadDocument2(); //?? PdfController(document: (PdfDocument.openAsset('lib/wayadocs/offlinebooks.pdf')));
//                          _OfflineReadPageState().loadDocument();//_pickFiles();
                          //Timer(const Duration(seconds: 7),(){
                          //  x.then((pdfValue){ _OfflineReadPageState().loadDocument2()._pdfDoc = pdfValue; }, onError: (e){ PdfDocument.openAsset('wayadocs/underconstruction.pdf'); print(e); });
                          //});
                   //       x.then(
                     //         Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SimplePage(pdfString: _OfflineReadPageState().loadDocument2()._pdfDoc,)))); //continue trying here
                          showDialog(context: context, builder: (BuildContext context){
                            return AlertDialog(
                              title: Text('Sorry!'),
                              content: Text('Still under construction'),
                              actions: [
                                ElevatedButton(onPressed: (){ Navigator.of(context).pop(); }, child: Text('OK'))
                              ],
                            );
                          });
                        }),
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
class OfflineReadPage extends StatefulWidget{
  State<StatefulWidget> createState() => _OfflineReadPageState();
}

class _OfflineReadPageState extends State<OfflineReadPage>{
  String PdfFilePath = '/lib/wayadocs/placeholder.pdf';
  bool _isLoading = true;
//  PDFDocument? doc;// = await PDFDocument.fromAsset('/lib/wayadocs/placeholder.pdf');
  late PdfController _pdfController;


  @override
  void initState(){
    _pdfController = PdfController(document: PdfDocument.openAsset('wayadocs/offlinebooks.pdf'),
      initialPage: 1,
    );//    loadDocument();
    super.initState();
  }
  @override
  void dispose(){
    _pdfController.dispose();
    super.dispose();
  }
//  THIS ALMOST WORKS
  // loadDocument() async {
  //   //hint: use picker method from below method that has been commented out)
  //   FilePickerResult? pickerResult = await FilePicker.platform.pickFiles();
  //   var PdfPath = pickerResult?.files.single.path;
  //   PDFDocument doc = await PDFDocument.fromAsset( '${PdfPath}');
  // }
//  Future<String> loadDocument2() async{
  loadDocument2() async{
    dynamic _pdfDoc = await EarlyInstantiationPdfSingleton().thePdfLocationString(PdfFilePath);// = PdfControllerPinch(document: PdfDocument.openAsset(PdfFilePath));//TODO: for windows remove pinch since it does not support

    FileType _picici = FileType.custom;
    FilePickerResult? pickerResult = await FilePicker.platform.pickFiles(type: _picici, allowedExtensions: ['pdf']);
    if(pickerResult != null){
    //  setState(() async { //PdfFilePath = pickerResult.files.single.path ?? "path unavailable";});
        _pdfDoc = PdfDocument.openFile(pickerResult.files.single.path!);
        _pdfController = await PdfController(document: _pdfDoc, initialPage: 1, );
        var x = EarlyInstantiationPdfSingleton().thePdfLocationString(pickerResult.files.single.path!);
        chosenPdfBook cpdf = chosenPdfBook();
//        cpdf.documentx = _pdfController.document as String?;
  //    });
    }
    //TODO: loading online
    //   if(pickerResult != null){
    //     //setState((){
    //       PdfFilePath = pickerResult.files.single.path ?? "path unavailable";
    //       print(PdfFilePath);
    //     //});
    //       _pdfController = await PdfController(document: PdfDocument.openAsset(PdfFilePath));//TODO: for windows remove pinch since it does not support
    //      // offlinePdfDoc = await PDFDocument.fromFile(File(PdfFilePath));// as PDFDocument;
    // }

    //);
    return PdfViewBuilders(
            options: const DefaultBuilderOptions(),
            pageBuilder: _pageBuilder)
     ;
   // });
    }
  Future<Widget> testTheory()async{
//    try{
    final docy = await PdfDocument.openAsset('wayadocs/offlinebooks.pdf');
    final page = await docy.getPage(1);
    final pageImage = await page.render(width: page.width, height: page.height);
    await page.close();
    return Image(image: MemoryImage(pageImage!.bytes));
    //  } on PlatformException catch (error){
    //  print(error);
    //}
//    return Image(image: MemoryImage(pageImage!.bytes));
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: wayaTitle()),
      body:
        PdfView( //fix here
          builders: PdfViewBuilders<DefaultBuilderOptions>(
            options: const DefaultBuilderOptions(),
            documentLoaderBuilder: (_) => const Center(child: CircularProgressIndicator(),),
            pageLoaderBuilder: (_) => const Center(child: CircularProgressIndicator(),),
            pageBuilder: _pageBuilder,
          ),
          controller: _pdfController,
        )
    );
  }

  PhotoViewGalleryPageOptions _pageBuilder(BuildContext context, Future<PdfPageImage> pageImage, int index, PdfDocument document) {
    return PhotoViewGalleryPageOptions(imageProvider:  PdfPageImageProvider(pageImage, index, document.id),
    minScale: PhotoViewComputedScale.contained *1,
      maxScale: PhotoViewComputedScale.contained *2,
      initialScale: PhotoViewComputedScale.contained * 1.0,
      heroAttributes: PhotoViewHeroAttributes(tag: '${document.id}-$index'),
    );
  }
}

// class _OfflineReadPageState extends State<OfflineReadPage>{
//   bool _isLoading = false;
//   var _picici = FileType.custom;
//   Future _pickFiles() async {
// //    FileType _picici = FileType.custom;
//     FilePickerResult? pickerResult = await FilePicker.platform.pickFiles(
//       type: _picici,
//       allowMultiple: false,
//       //onFileLoading: (FilePickerStatus status) => print(status),
//       allowedExtensions: ['pdf']);//;, 'txt', 'doc', '']);
//   if(pickerResult != null){
//     String? PdfFilePath; //File offlinePdfFile = await file;
// //    setState((){
//     PdfFilePath = pickerResult.files.single.path ?? "path unavailable";
//     print(PdfFilePath);
//   //  });
//     offlinePdfDoc = await PDFDocument.fromAsset('$PdfFilePath'); //as PDFDocument;
//
//   }
//   List<PlatformFile>? _paths;
//   String? _directoryPath;
//     try {
//       _directoryPath = null;
//       _paths = (await FilePicker.platform.pickFiles(
//         type: _picici,
//         allowMultiple: false,
//         onFileLoading: (FilePickerStatus status) => print(status),
//         allowedExtensions: ['pdf', 'txt', 'doc', '']
//       ))
//           ?.files;
//     } on PlatformException catch (e) {
//       log('Unsupported operation' + e.toString());
//     } catch (e) {
//       log(e.toString());
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//   return Container(
//     child: Scaffold(
//       body: Card(
//       child: _isLoading ?
//       Center(child: CircularProgressIndicator()) :
//       // FutureBuilder(
//       //     builder: (BuildContext context, AsyncSnapshot<PDFDocument> snapshot){
//       //   if(snapshot.hasData){
//       //     return PDFViewer(document:offlinePdfDoc);// file as PDFDocument);
//       //   } PDFDocument selectedDoc = snapshot.data as PDFDocument;
//       //      return PDFViewer(document: selectedDoc);
//       //   }
//       // )
//         PDFViewer(document: offlinePdfDoc,
//           zoomSteps: 1
//         )
//       ),)
//       );
//   }
// }
//


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
class ViewWidget {
  static Widget builder(BuildContext context, PdfViewPinchBuilders builders,
      PdfLoadingState state, WidgetBuilder loadedBuilder, PdfDocument? document, Exception? loadingError) {
    final Widget content = () {
      switch (state) {
        case PdfLoadingState.loading:
          return KeyedSubtree(key: const Key('pdfx.root.loading'),
              child: builders.documentLoaderBuilder?.call(context) ??
                  const SizedBox());
        case PdfLoadingState.error:
          return KeyedSubtree(key: const Key('pdfx.loading.error'),
              child: builders.errorBuilder?.call(context, loadingError!) ??
                  Center(child: Text(loadingError.toString())));
        case PdfLoadingState.success:
          return KeyedSubtree(
            key: Key('pdfx.root.success.${document!.id}'),
            child: loadedBuilder(context),);
      }
    }();
    final defaultBuilder = builders as PdfViewPinchBuilders<
        DefaultBuilderOptions>;
    final options = defaultBuilder.options;
    return AnimatedSwitcher(duration: options.loaderSwitchDuration,
      transitionBuilder: options.transitionBuilder,
      child: content,);
  }

  static Widget transitionBuilder(Widget child, Animation<double> animation) =>
      FadeTransition(opacity: animation, child: child,);

  static PhotoViewGalleryPageOptions pageBuilder(BuildContext context,
      Future<PdfPageImage> pageImage, int index, PdfDocument document) =>
      PhotoViewGalleryPageOptions(
        imageProvider: PdfPageImageProvider(pageImage, index, document.id),
        minScale: PhotoViewComputedScale.contained * 1,
        maxScale: PhotoViewComputedScale.contained * 3.0,
        initialScale: PhotoViewComputedScale.contained * 1.0,
        heroAttributes: PhotoViewHeroAttributes(tag: '${document.id}-$index'),);
}
//      builders, state, (context) => null, document, loadingError))

/*PdfViewPinch(controller: pdfPinchController, builders: PdfViewPinchBuilders<DefaultBuilderOptions>(
options: const DefaultBuilderOptions(loaderSwitchDuration: const Duration(seconds:1), transitionBuilder: SomeWidget.transitionBuilder), documentLoaderBuilder: (_) => const Center(child: CircularProgressIndicator()), pageLoaderBuilder: (_) => const Center(child: CircularProgressIndicator()), errorBuilder: (_OfflineReadPageState, error) => Center(child: Text(error.toString()),), builder: ViewWidget.builder,))
PdfView(
controller:pdfController,
builders: PdfViewBuilders<DefaultBuilderOptions>(
pageBuilder: ViewWidget.pageBuilder,
)
);)
 */
//
//
class SimplePage extends StatefulWidget {
  const SimplePage({Key? key, String? pdfString}) : super(key: key);
  @override
  State<SimplePage> createState() => _SimplePageState();
}

class _SimplePageState extends State<SimplePage> {
  chosenPdfBook cpdfbk = chosenPdfBook();
  static const int _initialPage = 2;
  bool _isSampleDoc = true;
  late PdfController _pdfController = PdfController(document: PdfDocument.openAsset(cpdfbk.documentx.toString()));//'wayadocs/placeholder.pdf'));

  @override
  void initState() {
    super.initState();
    _pdfController = PdfController(
      document: PdfDocument.openAsset(cpdfbk.documentx.toString()),//chosenPdfBook().documentx!.toString()),//,'wayadocs/offlinebooks.pdf'), //this is the point of obtaining books
      initialPage: _initialPage,
    );
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Pdfx example'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            onPressed: () {
              _pdfController.previousPage(
                curve: Curves.ease,
                duration: const Duration(milliseconds: 100),
              );
            },
          ),
          PdfPageNumber(
            controller: _pdfController,
            builder: (_, loadingState, page, pagesCount) => Container(
              alignment: Alignment.center,
              child: Text(
                '$page/${pagesCount ?? 0}',
                style: const TextStyle(fontSize: 22),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            onPressed: () {
              _pdfController.nextPage(
                curve: Curves.ease,
                duration: const Duration(milliseconds: 100),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
            //  if (_isSampleDoc) {
                _pdfController.loadDocument(PdfDocument.openAsset(EarlyInstantiationPdfSingleton().thePdfLocationString(_OfflineReadPageState().PdfFilePath.toString())));//PdfDocument.openAsset('wayadocs/offlinebooks.pdf'));
                // print('look ${
                //     PdfDocument.openAsset(
                //         EarlyInstantiationPdfSingleton().
                //         thePdfLocationString(_OfflineReadPageState().PdfFilePath.toString())
                //     )
                // }');//PdfDocument.openAsset('wayadocs/offlinebooks.pdf'));
             //   _pdfController.loadDocument(PdfDocument.openAsset('wayadocs/offlinebooks.pdf'));
         //     } else {
        //        _pdfController.loadDocument(PdfDocument.openAsset('wayadocs/offlinebooks.pdf'));
         //     }
          //    _isSampleDoc = !_isSampleDoc;
            },
          ),
        ],
      ),
      body: PdfView(
        builders: PdfViewBuilders<DefaultBuilderOptions>(
          options: const DefaultBuilderOptions(),
          documentLoaderBuilder: (_) => const Center(child: CircularProgressIndicator()),
          pageLoaderBuilder: (_) => const Center(child: CircularProgressIndicator()),
          pageBuilder: _pageBuilder,
        ),
        controller: _pdfController,
      ),
    );
  }

  PhotoViewGalleryPageOptions _pageBuilder(
      BuildContext context,
      Future<PdfPageImage> pageImage,
      int index,
      PdfDocument document,
      ) {
    return PhotoViewGalleryPageOptions(
      imageProvider: PdfPageImageProvider(
        pageImage,
        index,
        document.id,
      ),
      minScale: PhotoViewComputedScale.contained * 1,
      maxScale: PhotoViewComputedScale.contained * 2,
      initialScale: PhotoViewComputedScale.contained * 1.0,
      heroAttributes: PhotoViewHeroAttributes(tag: '${document.id}-$index'),
    );
  }
}

