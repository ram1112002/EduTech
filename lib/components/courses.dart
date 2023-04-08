import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../SubPages/Common.dart';

class Courses extends StatefulWidget{
  List<String> courses;
  Courses({required this.courses});
  _CoursesState createState() => _CoursesState(courses: courses);
}
class _CoursesState extends State<Courses>{
  List<String> courses;
  _CoursesState({required this.courses});
  List parts = [];
  @override
  Widget build(BuildContext context) {
    for (int x = 0; x < courses.length; x++) {
      String s = courses[x];
      int idx = s.indexOf("_");
      parts.add([s.substring(0, idx).trim(), s.substring(idx + 1).trim()]);
    }
    if (courses.length == 0) {
      return Center(
        child: Column(
          children: [
              Image.asset("assets/images/empty.png"),
              Text("No Courses",style: TextStyle(
                color: Colors.grey
              ),),
          ],
        ),
      );
    }
    else {
      return Scaffold(

          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Text("Your Courses",style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.cabinSketch().fontFamily
                  ),),
                ),
              ),
              SizedBox(
                height: 700,
                child: ListView.builder(
                    itemCount: courses.length, itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Common(Class: parts[index][1],Subject: parts[index][0])));

                    },
                    child: ListTile(
                      subtitle: Text(parts[index][0]),
                      title: Text("Class " + parts[index][1]),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  );
                }),
              ),
            ],
          ));
    }
  }
}