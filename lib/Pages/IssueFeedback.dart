import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_tech/SubPages/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'HomePage.dart';
import 'Utils.dart';

class IssueFeedback extends StatefulWidget{
  _IssueFeedbackState createState() => _IssueFeedbackState();
}
class _IssueFeedbackState extends State<IssueFeedback>{
  String? email = FirebaseAuth.instance.currentUser?.email;
  final IFController = TextEditingController();
  bool _validateDes = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        title: Text("Share issue or Feedback",style: TextStyle(
          color: Colors.black,
          fontStyle: GoogleFonts.akronim().fontStyle,
          fontWeight: FontWeight.bold
        ),),
        leading: IconButton(
          color: Colors.black,
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> HomePage()));},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 40,top:20),
              child: Text("Please Share with us so that we work on it to improve your experience.",style: TextStyle(
                color: Colors.grey
              ),),
            ),
            SizedBox(height: 50,),
            Card(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (String Name) async{
                      if(Name == "" || Name == null){
                        setState(() {
                          _validateDes = false;
                        });
                      }
                      else{
                        setState(() {
                          _validateDes = true;
                        });
                      }
                    },
                    controller: IFController,
                    maxLines: 8, //or null
                    decoration: InputDecoration(hintText: "Write here...",
                    ),
                  ),
                )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 380),
              child: Center(
                child: InkWell(
                  onTap: (){SendFeedback();},
                  child: Container(
                    child: Center(child: Text("Send",style: TextStyle(color:  _validateDes?Colors.white: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold),)),
                    decoration: BoxDecoration(
                      color: _validateDes?Colors.orange.shade600: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 70,
                    width: 300,
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );

  }

  void SendFeedback() async{
    if(_validateDes == true){
      FirebaseFirestore.instance.collection("Issue_Feedback").doc(email).set({
        "Issue Or Feedback": IFController.text
      });
    }
    Utils.showSnackBar("Issue or Feedback Send", Colors.green);
  }
}