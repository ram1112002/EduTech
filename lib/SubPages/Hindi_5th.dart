import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_tech/Pages/HomePage.dart';
import 'package:edu_tech/SubPages/constants.dart';
import 'package:edu_tech/SubPages/video_conference_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:google_fonts/google_fonts.dart';

class Hindi_5th extends StatefulWidget{
  _Hindi_5thState createState() => _Hindi_5thState();

}
class _Hindi_5thState extends State<Hindi_5th> {
  String Subject = "Hindi";
  String Class = "5th";
  List<String> Main = ["Mobile friendly","Dought Clearing","Downloadable Content","Beginner Friendly","Learn Online"];
  List<String> Sub = ["No laptop? no problem","Daily Basis","With lifetime access","No prior knowledge required","Easy learning"];
  List<String> img = ["MF.png","DC.png","DCC.png","BF.png","LO.png"];
  String? email = FirebaseAuth.instance.currentUser?.email;
  late String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 120, 10, 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: Text("Congratulations",style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 28,fontFamily: GoogleFonts.aclonica().fontFamily,color: Colors.pink
            ),),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 40, 0),
            child: Text("You have successfully enrolled into a great course of $Subject for a student of $Class Class",style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 20,
            ),),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 65, 0),
            child: Text("Course Highlights",style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,

            ),textAlign: TextAlign.left,),
          ),

          Container(
            height: 450,
            child: ListView.builder(itemCount: 5,itemBuilder:(context,index){
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: ListTile(
                  title: Text(Main[index]),
                  subtitle: Text(Sub[index]),
                  leading: Image.asset("assets/images/"+img[index]),
                ),
              );
            }),
          ),
          SizedBox(height: 50,),



          Row(
            children: <Widget>[

              SizedBox(width: 20),
              Expanded(
                child: InkWell(
                  onTap: ()async{var res = await FirebaseFirestore.instance.collection(Subject+"_"+Class).doc(email).get();
                  name = res.get("Name");
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return VideoConferencePage(
                            Email: email.toString(),
                            Name: name,conferenceID: Subject+"_"+Class
                        );}));},
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 40, 0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.orange,
                      ),
                      child: Text(
                        "JOIN",
                        style: kSubtitleTextSyule.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),

        ],
      ),
    );

  }


}

