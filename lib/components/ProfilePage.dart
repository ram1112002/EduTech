import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_tech/Pages/HomePage.dart';
import 'package:edu_tech/SubPages/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatefulWidget{
  String Class,Name;
  ProfilePage({required this.Class,required this.Name});
  _ProfilePageState createState() => _ProfilePageState(Class: Class,Name: Name);
 }
 class _ProfilePageState extends State<ProfilePage>{
  String? email = FirebaseAuth.instance.currentUser?.email;
   String Class,Name;
   _ProfilePageState({required this.Class,required this.Name});
   List<String> items = ['1st',"2nd","3rd","4th","5th","6th","7th","8th","9th","10th","11th","12th"];
   Widget textfield({@required hintText,@required value}) {
     return Material(

       elevation: 4,
       shadowColor: Colors.deepOrange,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(10),
       ),
       child: TextFormField(
         initialValue: value,
         enabled: false,
         decoration: InputDecoration(
           labelText: hintText,
             hintText: hintText,
             hintStyle: TextStyle(
               letterSpacing: 2,
               color: Colors.black54,
               fontWeight: FontWeight.bold,
             ),
             fillColor: Colors.white30,
             filled: true,
             border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(10.0),
                 borderSide: BorderSide.none)),
       ),
     );
   }
  String? selectedIteam;
  void initState(){
     super.initState();
     selectedIteam = Class;
   }

  @override
   Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations([
       DeviceOrientation.portraitUp,
       DeviceOrientation.portraitDown,
     ]);
     return Scaffold(
       appBar: AppBar(
         elevation: 0.0,
         backgroundColor: Colors.deepOrangeAccent,
         leading: IconButton(
           icon: Icon(
             Icons.arrow_back,
             color: Colors.white,
           ),
           onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> HomePage()));},
         ),
       ),
       body: Stack(
         alignment: Alignment.center,
         children: [
           Column(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [

               Container(
                 height: 450,
                 width: double.infinity,
                 margin: EdgeInsets.symmetric(horizontal: 10),
                 child: Column(
                   children: [
                     SizedBox(height: 60,),
                     textfield(
                       hintText: 'Name',
                       value: Name
                     ),
                     SizedBox(height: 40,),
                     textfield(
                       hintText: 'Email',
                       value: email
                     ),
                     SizedBox(height: 150,),

                   ],
                 ),
               )
             ],
           ),
           CustomPaint(
             child: Container(
               width: MediaQuery.of(context).size.width,
               height: MediaQuery.of(context).size.height,
             ),
             painter: HeaderCurvedContainer(),
           ),
           Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Padding(
                 padding: EdgeInsets.all(20),
                 child: Text(
                   "Profile",
                   style: TextStyle(
                     fontSize: 35,
                     letterSpacing: 1.5,
                     color: Colors.white,
                     fontWeight: FontWeight.w600,
                   ),
                 ),
               ),
               Container(
                 padding: EdgeInsets.all(10.0),
                 width: MediaQuery.of(context).size.width / 2,
                 height: MediaQuery.of(context).size.width / 2,
                 decoration: BoxDecoration(
                   border: Border.all(color: Colors.white, width: 5),
                   shape: BoxShape.circle,
                   color: Colors.white,
                   image: DecorationImage(
                     fit: BoxFit.cover,
                     image: AssetImage('assets/images/smile.jpg'),
                   ),
                 ),
               ),

             ],
           ),
           Padding(
             padding: const EdgeInsets.only(top: 620),
             child: Container(
               height: 55,
               width: 400,
               child: ElevatedButton(
                 onPressed: () {
                   FirebaseFirestore.instance.collection("Users").doc(email).update({"Class": selectedIteam});
                   Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>HomePage()));
                 },
                 style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.deepOrangeAccent
                 ),
                 child: Center(
                   child: Text(
                     "Update",
                     style: TextStyle(
                       fontSize: 23,
                       color: Colors.white,
                     ),
                   ),
                 ),
               ),
             ),
           ),

           Padding(
             padding: const EdgeInsets.only(top: 420),
             child: Row(

               children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 20),
                   child: Text("Class",style: TextStyle(
                     fontSize: 30,
                     fontWeight: FontWeight.w500
                   ),),
                 ),
                 SizedBox(width: 40,),
                 Material(
                   elevation: 4,
                   shadowColor: Colors.deepOrange,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10),
                   ),
                   child: SizedBox(
                     width: 150,
                     child: DropdownButtonFormField<String>(
                       decoration: InputDecoration(
                         border: InputBorder.none,
                           enabledBorder: OutlineInputBorder
                             (
                               borderRadius: BorderRadius.circular(12),
                               borderSide: BorderSide(width: 3,color: Colors.white)
                           )
                       ),
                       value: selectedIteam,
                       items: items.map((item) => DropdownMenuItem<String>(value: item,
                           child: Text(item,style: TextStyle(fontSize: 24))))
                           .toList(),
                       onChanged: (item)=> setState(() {
                         selectedIteam = item;
                       }),
                     ),
                   ),
                 ),
               ],
             ),
           ),
         ],
       ),
     );
   }
 }



class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.deepOrangeAccent;
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

