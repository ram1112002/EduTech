import 'package:edu_tech/Pages/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatefulWidget{
  _AboutUsState createState() => _AboutUsState();
}
class _AboutUsState extends State<AboutUs>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        title: Text("About Us",style: TextStyle(
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
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 40),
        child: Text("Edu Tech is a one stop solution for all your education \n" + "\n"
            "We provide best platform for education and provide notes form owr experts and classes also we had platform for homework also "
            "which gives daily practice to students.",style: TextStyle(
            fontSize: 18,
          fontFamily: GoogleFonts.dekko().fontFamily,
          fontWeight: FontWeight.w800
        ),),
      ),
    );
  }

}