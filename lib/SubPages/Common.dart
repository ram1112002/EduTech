import 'dart:math';
import 'dart:ui';

import 'package:edu_tech/SubPages/Notes.dart';
import 'package:edu_tech/SubPages/Math_1st.dart';
import 'package:edu_tech/SubPages/Science_1st.dart';
import 'package:flutter/material.dart';
import 'package:edu_tech/SubPages/Accountancy_11th.dart';
import 'package:edu_tech/SubPages/Accountancy_12th.dart';
import 'package:edu_tech/SubPages/BS_11th.dart';
import 'package:edu_tech/SubPages/BS_12th.dart';

import 'package:edu_tech/SubPages/Biology_10th.dart';
import 'package:edu_tech/SubPages/Biology_11th.dart';
import 'package:edu_tech/SubPages/Biology_12th.dart';
import 'package:edu_tech/SubPages/Biology_9th.dart';
import 'package:edu_tech/SubPages/Chemistry_10th.dart';
import 'package:edu_tech/SubPages/Chemistry_11th.dart';
import 'package:edu_tech/SubPages/Chemistry_12th.dart';
import 'package:edu_tech/SubPages/Chemistry_9th.dart';
import 'package:edu_tech/SubPages/Common.dart';
import 'package:edu_tech/SubPages/Computer_1st.dart';
import 'package:edu_tech/SubPages/Computer_2nd.dart';
import 'package:edu_tech/SubPages/Computer_3rd.dart';
import 'package:edu_tech/SubPages/Computer_4th.dart';
import 'package:edu_tech/SubPages/Computer_5th.dart';
import 'package:edu_tech/SubPages/Computer_6th.dart';
import 'package:edu_tech/SubPages/Computer_7th.dart';
import 'package:edu_tech/SubPages/Computer_8th.dart';
import 'package:edu_tech/SubPages/Economic_11th.dart';
import 'package:edu_tech/SubPages/Economic_12th.dart';
import 'package:edu_tech/SubPages/Economics_11th.dart';
import 'package:edu_tech/SubPages/Economics_12th.dart';
import 'package:edu_tech/SubPages/English_10th.dart';
import 'package:edu_tech/SubPages/English_11th.dart';
import 'package:edu_tech/SubPages/English_12th.dart';
import 'package:edu_tech/SubPages/English_1st.dart';
import 'package:edu_tech/SubPages/English_2nd.dart';
import 'package:edu_tech/SubPages/English_3rd.dart';
import 'package:edu_tech/SubPages/English_4th.dart';
import 'package:edu_tech/SubPages/English_5th.dart';
import 'package:edu_tech/SubPages/English_6th.dart';
import 'package:edu_tech/SubPages/English_7th.dart';
import 'package:edu_tech/SubPages/English_8th.dart';
import 'package:edu_tech/SubPages/English_9th.dart';
import 'package:edu_tech/SubPages/GK_1st.dart';
import 'package:edu_tech/SubPages/GK_2nd.dart';
import 'package:edu_tech/SubPages/GK_3rd.dart';
import 'package:edu_tech/SubPages/GK_4th.dart';
import 'package:edu_tech/SubPages/GK_5th.dart';
import 'package:edu_tech/SubPages/GK_6th.dart';
import 'package:edu_tech/SubPages/GK_8th.dart';
import 'package:edu_tech/SubPages/Geography_11th.dart';
import 'package:edu_tech/SubPages/Geography_12th.dart';
import 'package:edu_tech/SubPages/Gk_7th.dart';
import 'package:edu_tech/SubPages/Hindi_1st.dart';
import 'package:edu_tech/SubPages/Hindi_2nd.dart';
import 'package:edu_tech/SubPages/Hindi_3rd.dart';
import 'package:edu_tech/SubPages/Hindi_4th.dart';
import 'package:edu_tech/SubPages/Hindi_5th.dart';
import 'package:edu_tech/SubPages/Hindi_6th.dart';
import 'package:edu_tech/SubPages/Hindi_7th.dart';
import 'package:edu_tech/SubPages/Hindi_8th.dart';
import 'package:edu_tech/SubPages/History_11th.dart';
import 'package:edu_tech/SubPages/History_12th.dart';
import 'package:edu_tech/SubPages/IP_11th.dart';
import 'package:edu_tech/SubPages/IP_12th.dart';
import 'package:edu_tech/SubPages/Math_10th.dart';
import 'package:edu_tech/SubPages/Math_11th.dart';
import 'package:edu_tech/SubPages/Math_12th.dart';
import 'package:edu_tech/SubPages/Math_1st.dart';
import 'package:edu_tech/SubPages/Math_2nd.dart';
import 'package:edu_tech/SubPages/Math_3rd.dart';
import 'package:edu_tech/SubPages/Math_4th.dart';
import 'package:edu_tech/SubPages/Math_5th.dart';
import 'package:edu_tech/SubPages/Math_6th.dart';
import 'package:edu_tech/SubPages/Math_7th.dart';
import 'package:edu_tech/SubPages/Math_8th.dart';
import 'package:edu_tech/SubPages/Math_9th.dart';
import 'package:edu_tech/SubPages/Maths_11th.dart';
import 'package:edu_tech/SubPages/Maths_12th.dart';
import 'package:edu_tech/SubPages/Physics_10th.dart';
import 'package:edu_tech/SubPages/Physics_11th.dart';
import 'package:edu_tech/SubPages/Physics_12th.dart';
import 'package:edu_tech/SubPages/Physics_9th.dart';
import 'package:edu_tech/SubPages/SST_10th.dart';
import 'package:edu_tech/SubPages/SST_1st.dart';
import 'package:edu_tech/SubPages/SST_2nd.dart';
import 'package:edu_tech/SubPages/SST_3rd.dart';
import 'package:edu_tech/SubPages/SST_4th.dart';
import 'package:edu_tech/SubPages/SST_5th.dart';
import 'package:edu_tech/SubPages/SST_6th.dart';
import 'package:edu_tech/SubPages/SST_7th.dart';
import 'package:edu_tech/SubPages/SST_8th.dart';
import 'package:edu_tech/SubPages/SST_9th.dart';
import 'package:edu_tech/SubPages/Science_1st.dart';
import 'package:edu_tech/SubPages/Science_2nd.dart';
import 'package:edu_tech/SubPages/Science_3rd.dart';
import 'package:edu_tech/SubPages/Science_4th.dart';
import 'package:edu_tech/SubPages/Science_5th.dart';
import 'package:edu_tech/SubPages/Science_6th.dart';
import 'package:edu_tech/SubPages/Science_7th.dart';
import 'package:edu_tech/SubPages/Science_8th.dart';

class Common extends StatefulWidget{
  String Class, Subject;
  Common({required this.Class,required this.Subject});
  _CommonState createState() => _CommonState(Class: Class,Subject: Subject);

}
class _CommonState extends State<Common> with SingleTickerProviderStateMixin{
  Map<String, dynamic> map = {
    "Math_1st" : Math_1st(),
    "Science_1st" : Science_1st(),
    "Accountancy_11th" : Accountancy_11th(),
    "Accountancy_12th" : Accountancy_12th(),
    "Biology_9th" : Biology_9th(),
    "Biology_10th" : Biology_10th(),
    "Biology_11th" : Biology_11th(),
    "Biology_12th" : Biology_12th(),
    "BS_11th" : BS_11th(),
    "BS_12th" : BS_12th(),
    "Chemistry_9th": Chemistry_9th(),
    "Chemistry_10th" : Chemistry_10th(),
    "Chemistry_11th" : Chemistry_11th(),
    "Chemistry_12th" : Chemistry_12th(),
    "Computer_1st" : Computer_1st(),
    "Computer_2nd" : Computer_2nd(),
    "Computer_3rd" : Computer_3rd(),
    "Computer_4th" : Computer_4th(),
    "Computer_5th" : Computer_5th(),
    "Computer_6th" : Computer_6th(),
    "Computer_7th" : Computer_7th(),
    "Computer_8th" : Computer_8th(),
    "Economic_11th" : Economic_11th(),
    "Economic_12th" : Economic_12th(),
    "Economics_11th" : Economics_11th(),
    "Economics_12th" : Economics_12th(),
    "English_1st": English_1st(),
    "English_2nd" : English_2nd(),
    "English_3rd" : English_3rd(),
    "English_4th" : English_4th(),
    "English_5th" : English_5th(),
    "English_6th" : English_6th(),
    "English_7th" : English_7th(),
    "English_8th" : English_8th(),
    "English_9th" : English_9th(),
    "English_10th" : English_10th(),
    "English_11th" : English_11th(),
    "English_12th" : English_12th(),
    "Geography_11th" : Geography_11th(),
    "Geography_12th" :Geography_12th(),
    "GK_1st" : GK_1st(),
    "GK_2nd" : GK_2nd(),
    "GK_3rd" : GK_3rd(),
    "GK_4th" : GK_4th(),
    "GK_5th" : GK_5th(),
    "GK_6th" : GK_6th(),
    "GK_7th" : GK_7th(),
    "GK_8th" : GK_8th(),
    "Hindi_1st" : Hindi_1st(),
    "Hindi_2nd": Hindi_2nd(),
    "Hindi_3rd" : Hindi_3rd(),
    "Hindi_4th" : Hindi_4th(),
    "Hindi_5th" : Hindi_5th(),
    "Hindi_6th" : Hindi_6th(),
    "Hindi_7th" : Hindi_7th(),
    "Hindi_8th" : Hindi_8th(),
    "History_11th" : History_11th(),
    "History_12th" : History_12th(),
    "IP_11th" : IP_11th(),
    "IP_12th" : IP_12th(),
    "Math_2nd" : Math_2nd(),
    "Math_3rd" : Math_3rd(),
    "Math_4th" : Math_4th(),
    "Math_5th" : Math_5th(),
    "Math_6th" : Math_6th(),
    "Math_7th" : Math_7th(),
    "Math_8th" : Math_8th(),
    "Math_9th" : Math_9th(),
    "Math_10th" : Math_10th(),
    "Math_11th" : Math_11th(),
    "Math_12th" : Math_12th(),
    "Maths_11th" : Maths_11th(),
    "Maths_12th" : Maths_12th(),
    "Physics_9th" : Physics_9th(),
    "Physics_10th" : Physics_10th(),
    "Physics_11th" : Physics_11th(),
    "Physics_12th" : Physics_12th(),
    "Science_2nd" : Science_2nd(),
    "Science_3rd" : Science_3rd(),
    "Science_4th" : Science_4th(),
    "Science_5th" : Science_5th(),
    "Science_6th" : Science_6th(),
    "Science_7th" : Science_7th(),
    "Science_8th" : Science_8th(),
    "SST_1st" : SST_1st(),
    "SST_2nd": SST_2nd(),
    "SST_3rd" : SST_3rd(),
    "SST_4th" : SST_4th(),
    "SST_5th" : SST_5th(),
    "SST_6th" : SST_6th(),
    "SST_7th" : SST_7th(),
    "SST_8th" : SST_8th(),
    "SST_9th" : SST_9th(),
    "SST_10th" : SST_10th(),

  };
  late AnimationController _animationController;
  late Animation<double> _animationTextRotate;
  void setUpAnimation(){
    _animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 300));
    _animationTextRotate = Tween<double>(begin: 0,end: 90).animate(_animationController);
  }
  void updateView(){
    setState((){
      _isStorage = !_isStorage;
    });
    _isStorage ? _animationController.forward(): _animationController.reverse();
  }
  String Class, Subject;
  _CommonState({required this.Class,required this.Subject});
  bool _isStorage = false;

  @override
  void initState(){
    setUpAnimation();
    super.initState();
  }

  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
        body: AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            return Stack(
                children: [

                  AnimatedPositioned(
                      duration: Duration(milliseconds: 300),
                      width: _size.width * 0.88,
                      height: _size.height,
                      left: _isStorage ? -_size.width * 0.76 : 0,

                      child: Container(
                        child: map[Subject + "_" + Class],
                        color: Colors.white,
                      )),
                  AnimatedPositioned(
                      duration: Duration(milliseconds: 300),
                      width: _size.width * 0.88,
                      height: _size.height,
                      left: _isStorage ? _size.width * 0.12 : _size.width *
                          0.88,
                      child: Container(
                        child: Notes(Class: Class,Subject: Subject),
                        color: Colors.white ,
                      )),
                  AnimatedPositioned(
                      duration: Duration(milliseconds: 300),
                      top:  _isStorage ? _size.height /2 +70 : _size
                          .height *0.05,
                      left: _isStorage ? 0 : _size.width * 0.44 - 80,


                          child: AnimatedDefaultTextStyle(
                            duration: Duration(milliseconds: 300),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: _isStorage ? 20 : 32,
                              fontWeight: FontWeight.bold,
                              color: _isStorage ? Colors.red : Colors.green,

                            ),child: Transform.rotate(angle: -_animationTextRotate.value * pi / 180,
                              alignment: Alignment.topLeft,


                            
                              child: InkWell(
                              onTap: (){
                                if(_isStorage){
                                  updateView();
                              }
                              },
                                child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 16.0 * 0.75),
                                    width: 160,
                                  child: Text("Class".toUpperCase(),
                                  ),
                                ),
                              )),
                            ),
                          ),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 300),
                    top: !_isStorage ? _size.height /2 +70 : _size
                        .height *0.05,
                    right: _isStorage ? _size.width * 0.44 - 80: 0,


                    child: AnimatedDefaultTextStyle(
                      duration: Duration(milliseconds: 300),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: !_isStorage ? 20 : 32,
                        fontWeight: FontWeight.bold,
                        color: !_isStorage ? Colors.red : Colors.green,

                      ),child: Transform.rotate(angle: (90-_animationTextRotate.value) * pi / 180,
                        alignment: Alignment.topRight,



                        child: InkWell(
                          onTap: (){
                            if(_isStorage){

                            }else{
                              updateView();
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 16.0 * 0.75),
                            width: 160,
                            child: Text("Notes".toUpperCase(),
                            ),
                          ),
                        )),
                    ),
                  ),






                ]
            );

          }
        )
    );
  }


}
