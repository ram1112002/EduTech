import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_tech/components/Assignment.dart';
import 'package:edu_tech/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Assign extends StatefulWidget{
  String Class,Subject;
  String Title,Desc;
  DateTime date;
  bool check;
  Assign({required this.Subject,required this.Class,required this.Title,required this.Desc,required this.date,required this.check});
  _AssignState createState() => _AssignState(Subject: Subject,Class: Class,title: Title,Desc: Desc,date: date,check: check);
}
class _AssignState extends State<Assign>{
  bool _validateTitle = false;
  bool _validateDes = false;
  DateTime now = DateTime.now();
  String Class,Subject;
  String title,Desc;
  DateTime date;
  bool check;
  _AssignState({required this.Subject,required this.Class,required this.title,required this.Desc,required this.date,required this.check});
  final formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime x  = DateTime.now();
  @override
  Widget build(BuildContext context) {
    if(check == true){
      titleController.text = title;
      descriptionController.text = Desc;
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 330),
                  child: Text("Title",
                    style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,

                  ),),
                ),
                SizedBox(height: 15,),
                SizedBox(
                  width: 390,
                  child: TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                      enabled: check? false: true,
                      errorText: _validateTitle? "Please fill Title": null,
                      labelText: "Title",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0)
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 230),
                  child: Text("Description",style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,

                  )),
                ),
                SizedBox(height: 15,),
                Card(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        controller: descriptionController,
                        maxLines: 8, //or null
                        decoration: InputDecoration(hintText: "Enter your text here",
                          errorText: _validateDes ? "Enter Description": null
                        ),
                      ),
                    )
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(right: 270),
                  child: Text("Deadline",style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,

                  )),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  height: 200,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: check? date : now,
                    onDateTimeChanged: (DateTime newDateTime) {
                      x = newDateTime;
                    },
                  ),
                ),
                SizedBox(height: 30,),
                InkWell(
                  onTap: (){SendData();},
                  child: Container(
                    height: 70,
                    width: 300,
                    child: Center(
                      child: Text("Confirm",style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue,

                        borderRadius: BorderRadius.circular(10.0)
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
  SendData() async{
    setState(() {
      titleController.text.isEmpty ? _validateTitle = true : _validateTitle = false;
      descriptionController.text.isEmpty ? _validateDes = true : _validateDes = false;
    });
    if(_validateTitle == false && _validateDes == false) {
      showDialog(context: context,
          barrierDismissible: false,
          builder: (context) => Center(child: CircularProgressIndicator(),));
      await FirebaseFirestore.instance.collection(Subject + "_" + Class).doc(
          "Assignment").collection("Assignments").doc(titleController.text).set(
          {
            "Title": titleController.text,
            "Description": descriptionController.text,
            "Deadline": x,
            "Completed": []
          });
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) =>
          Assignment(teacher: true, Subject: Subject, Class: Class,)));
    }
  }

}