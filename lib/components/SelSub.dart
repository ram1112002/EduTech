import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_tech/components/AssignCategory.dart';
import 'package:edu_tech/components/Assignment.dart';
import 'package:edu_tech/components/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../SubPages/PaymentPage.dart';
import '../main.dart';

class SelSub extends StatefulWidget{
  @override
  State<SelSub> createState() => _SelSubState();
}

class _SelSubState extends State<SelSub> {
  DateTime now = DateTime.now();
  String? email = FirebaseAuth.instance.currentUser?.email;
  String SClass = "";
  String Classs = "";
  Future<String> getClass() async{
    var respose = await FirebaseFirestore.instance.collection("Users").doc(email).get();
    if(respose.exists){
      Classs = respose.get("Class").toString();
    }
    return Classs;
  }
  @override
  Widget build(BuildContext context) {
    getClass().then((value){SClass = value;});
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Center(
                child: Text("Homework",style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.cabinSketch().fontFamily
                ),),
              ),
              SizedBox(height: 15,),

              SizedBox(height: 680,child: AssignCategory()),
            ],
          ),
        ),
      ),
    );
  }

}
