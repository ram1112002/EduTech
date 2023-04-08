
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_tech/SubPages/PDFViewerPage.dart';
import 'package:edu_tech/main.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';

class Notes extends StatefulWidget{
  String Subject,Class;
  Notes({required this.Class,required this.Subject});
  _NotesState createState() => _NotesState(Class: Class,Subject: Subject);
}
class _NotesState extends State<Notes>{

  String Subject,Class;
  _NotesState({required this.Class,required this.Subject});

  late Future<ListResult> futureFiles;
  Map<int ,double> downloadProgress = {};

  @override
  void initState(){
    super.initState();
    futureFiles = FirebaseStorage.instance.ref("/"+Subject+"_"+Class).listAll();
  }
  @override
  Widget build(BuildContext context) {
    return
      Padding(padding: EdgeInsets.all(8.0,)
        ,

        child: FutureBuilder<ListResult>(
          future: futureFiles,
          builder: (context,snapshot){
            if(snapshot.hasData){
              final files = snapshot.data!.items;
              return ListView.builder(itemCount: files.length,padding: EdgeInsets.fromLTRB(27, 120, 0, 0),itemBuilder: (context,index){
                final file = files[index];
                double? progress = downloadProgress[index];
                return ListTile(
                  contentPadding: EdgeInsets.all(15),
                  title:   RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = ()async{
                                    showDialog(context: context,barrierDismissible: false, builder: (context) => Center(child: CircularProgressIndicator(),));

                                    final url = file.name;
                                    final fil = await loadFirebase(file, url, Subject, Class);
                                    if(fil == null){
                                      return;
                                    }
                                    navigatorKey.currentState!.popUntil((route) => route.isFirst);

                                    openPDF(context, fil);
                                  },
                                text: file.name,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: GoogleFonts.actor().fontFamily,
                                    color: Colors.black)
                            )
                          ]
                      )),
                  leading: CircleAvatar(child: Text(file.name[index][0]), backgroundColor: Colors.amber,),
                  subtitle: progress != null ? LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.black26,
                  ): null,
                  trailing: IconButton(
                    icon: const Icon(Icons.download,color: Colors.black),
                     onPressed: ()=> downloadFile(index,file),
                  ),

                );
              },);
            }else if(snapshot.hasError){
              return const Center(child: Text('Error Occurred'),);
            }else{
              return const Center(child: CircularProgressIndicator(),);
            }
          },
      ),


    );

  }

  Future downloadFile(int index, Reference ref,) async{
    Directory? dir;

    final url = await ref.getDownloadURL();
    try {
      if (Platform.isIOS) {
        dir = await getApplicationDocumentsDirectory();
      } else {
        dir = Directory('/storage/emulated/0/Download');
        if (!await dir.exists()) dir = await getExternalStorageDirectory();
      }
    } catch (err, stack) {
      print("Cannot get download folder path");
    }
    final path = '${dir?.path}/${ref.name}';
    await Dio().download(url,path,
    onReceiveProgress: (received, total){
      double progress = received / total;

      setState((){
        downloadProgress[index] = progress;
      });
    }
    );

    if(url.contains('.mp4')){
      await GallerySaver.saveVideo(path,toDcim: true);
    }
    else if(url.contains('.jpg') || url.contains('.png')){
      await GallerySaver.saveImage(path,toDcim: true);
    }

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Downloaded ${ref.name} in Downloads Folder")));

    }
   Future<File?> loadFirebase(Reference ref,String url,String Subject,String Class) async {

    try {
      final refPDF = FirebaseStorage.instance.ref("/"+Subject+"_"+Class).child(url);
      final bytes = await refPDF.getData();

      return _storeFile(ref,url, bytes!);
    } catch (e) {
      return null;
    }
  }
    static Future<File> _storeFile(Reference ref,String url,List<int> bytes) async{
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/${ref.name}');
      await file.writeAsBytes(bytes,flush: true);
      return file;
    }

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => PDFViewerPage(file: file,)),
  );
  }

