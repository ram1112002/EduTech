
import 'dart:collection';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_tech/components/Assign.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

import '../SubPages/PaymentPage.dart';
import '../SubPages/constants.dart';
import '../main.dart';



class Assignment extends StatefulWidget{

  bool teacher;
  String Class,Subject;
  Assignment({required this.teacher,required this.Subject,required this.Class});
  _AssignmentState createState() => _AssignmentState(teacher: teacher,Subject: Subject,Class: Class);

}
class _AssignmentState extends State<Assignment>{
  DateTime now = DateTime.now();
  List<bool> check = [];
  String? email = FirebaseAuth.instance.currentUser?.email;
  File? file;
  bool teacher;
  String Class,Subject;
  _AssignmentState({required this.teacher,required this.Subject,required this.Class});
  @override
  Widget build(BuildContext context) {
    String fileName = file != null ? path.basename(file!.path) : "No File Selected";
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
                SizedBox(
                  height: 700,
                  child: StreamBuilder<dynamic>(stream: FirebaseFirestore.instance.collection(Subject+"_"+Class).doc("Assignment").collection("Assignments").snapshots(),builder: (context,snapshot){
                      if(!snapshot.hasData) return Text("Currently no assignment");
                      return SizedBox(
                        height: 500,
                        child: ListView.builder(itemCount: snapshot.data.docs.length ,itemBuilder:(context,index) {
                          check.add(false);
                          var data = snapshot.data.docs[index];
                            DateTime date = DateTime.parse(data["Deadline"].toDate().toString());
                            if(date.compareTo(now) <= 0){
                              FirebaseFirestore.instance.collection(Subject+"_"+Class).doc("Assignment").collection("Assignments").doc(data["Title"]).delete();
                            }
                            String deadline = DateFormat('dd-MMM-yyy').format(date);
                            List<dynamic> comp = data["Completed"];
                            return Container(
                              padding: EdgeInsets.all(kDefaultPadding),
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(kDefaultPadding),
                                color: kOtherColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: kTextLightColor,
                                    blurRadius: 2.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [

                                  Container(
                                    width: 200,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: kSecondaryColor.withOpacity(0.4),
                                      borderRadius:
                                      BorderRadius.circular(kDefaultPadding),
                                    ),
                                    child: Center(
                                      child: Text(
                                        data["Title"],
                                        style: Theme.of(context).textTheme.caption?.copyWith(
                                          fontSize: 20
                                        ),
                                      ),
                                    ),
                                  ),
                                  kHalfSizedBox,
                                  AssignmentDetailRow(
                                    title: 'Last Date',
                                    statusValue: deadline,
                                  ),
                                  kHalfSizedBox,
                                  kHalfSizedBox,

                                  Text(data["Description"],style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey
                                  ),),
                                  kHalfSizedBox,
                                  kHalfSizedBox,
                                  if(teacher == true)

                                    Container(child:
                                      Row(
                                        children: [
                                          AssignmentButton(title: "Delete", onPress: (){FirebaseFirestore.instance.collection(Subject+"_"+Class).doc("Assignment").collection("Assignments").doc(data["Title"]).delete();}),
                                          SizedBox(width: 50,),
                                          AssignmentButton(title: "Edit", onPress: (){Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> Assign(Subject: Subject,Class: Class,Title: data["Title"],Desc: data["Description"],date: date,check : true)));})

                                        ],
                                      ),)
                                  else
                                    if(comp.contains(email))
                                      Container(
                                        child: Row(
                                          children: [
                                            Icon(Icons.check ,color: Colors.green,),
                                            Text("Completed",style: TextStyle(
                                                color: Colors.green
                                            ),)
                                          ],
                                        ),
                                      )
                                    else
                                      Row(
                                        children: [
                                          AssignmentButton(title: "Upload Assignment", onPress: (){if(check[index] == true){AssignmentUpload(data["Title"],comp);}}),
                                          SizedBox(width: 50,),
                                          Flexible(
                                            child: Column(
                                              children: [
                                                AssignmentButton(title: "Select File", onPress: (){SelectFile(index);}),
                                                if(check[index] == true)
                                                  Text(fileName,overflow:TextOverflow.ellipsis)
                                                else
                                                  Text("No File Selected")
                                              ],
                                            ),
                                          )

                                        ],
                                      )

                                ],
                              ),
                            );
                        }),
                      );
                  }),
                ),
                if(teacher)
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 50,right: 10),
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> Assign(Subject: Subject,Class: Class,Title: "",Desc: "",date: now,check : false)));
                      },
                      child: Container(
                        height: 80,
                        width: 600,
                        child: Center(
                          child: Text("Assign",style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold
                          ),),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue,

                          borderRadius: BorderRadius.circular(10.0)
                        ),
                      ),
                    ),
                  )

            ],
          ),
        ),
    );
  }
  AssignmentUpload(String title,List<dynamic> comp) async{
    if (file == null) return;

    final fileName = path.basename(file!.path);
    String fol = Subject+"_"+Class;
    final destination = '$fol/Assignment/$title/$fileName';
    FirebaseStorage.instance.ref(destination).putFile(file!);
    comp.add(email!);
    FirebaseFirestore.instance.collection(fol).doc("Assignment").collection("Assignments").doc(title).update({'Completed': comp});
  }
  SelectFile(int index) async{
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if(result == null) return;
    final path = result.files.single.path!;
    int len = check.length;
    check = List.filled(len, false,growable: true);
    setState(() {
      file = File(path);
      check[index] = true;
    });
  }


}
class AssignmentDetailRow extends StatelessWidget {
  const AssignmentDetailRow(
      {Key? key, required this.title, required this.statusValue})
      : super(key: key);
  final String title;
  final String statusValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .caption!
              .copyWith(color: kTextBlackColor, fontWeight: FontWeight.w900,fontSize: 18),
        ),
        Text(
          statusValue,
          style: Theme.of(context).textTheme.caption
          ?.copyWith(fontSize: 18),
        ),
      ],
    );
  }
}

class AssignmentButton extends StatelessWidget {
  const AssignmentButton({Key? key, required this.title, required this.onPress})
      : super(key: key);
  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 160,
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [kSecondaryColor, kPrimaryColor],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.5, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
        child: Center(
          child: Text(
              title,
              style: Theme.of(context).textTheme.subtitle2
          ),
        ),
      ),
    );
  }
}
