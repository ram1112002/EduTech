import 'dart:io';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:edu_tech/Pages/AboutUs.dart';
import 'package:edu_tech/Pages/IssueFeedback.dart';
import 'package:edu_tech/Routes/MyRoutes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_tech/SubPages/Common.dart';
import 'package:edu_tech/SubPages/Math_1st.dart';
import 'package:edu_tech/SubPages/PaymentPage.dart';
import 'package:edu_tech/SubPages/Science_1st.dart';
import 'package:edu_tech/components/ProfilePage.dart';
import 'package:edu_tech/components/SelSub.dart';
import 'package:edu_tech/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../SubPages/constants.dart';
import '../components/category.dart';
import '../components/courses.dart';
import '../components/offers.dart';

class HomePage extends StatefulWidget{
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
  int _currentIndex = 0;
  late PageController _pageController;


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  String? email = FirebaseAuth.instance.currentUser?.email;

  List<GlobalKey> dayKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),

  ];



  List<String> map = [
    "Math_1st",
    "Science_1st",
    "Accountancy_11th",
    "Accountancy_12th",
    "Biology_9th",
    "Biology_10th",
    "Biology_11th",
    "Biology_12th",
    "BS_11th",
    "BS_12th",
    "Chemistry_9th",
    "Chemistry_10th",
    "Chemistry_11th",
    "Chemistry_12th",
    "Computer_1st",
    "Computer_2nd" ,
    "Computer_3rd",
    "Computer_4th",
    "Computer_5th",
    "Computer_6th" ,
    "Computer_7th",
    "Computer_8th",
    "Economic_11th",
    "Economic_12th",
    "Economics_11th",
    "Economics_12th",
    "English_1st",
    "English_2nd",
    "English_3rd",
    "English_4th",
    "English_5th",
    "English_6th",
    "English_7th",
    "English_8th",
    "English_9th",
    "English_10th",
    "English_11th",
    "English_12th",
    "Geography_11th",
    "Geography_12th",
    "GK_1st",
    "GK_2nd",
    "GK_3rd",
    "GK_4th",
    "GK_5th",
    "GK_6th",
    "GK_7th",
    "GK_8th",
    "Hindi_1st",
    "Hindi_2nd",
    "Hindi_3rd",
    "Hindi_4th",
    "Hindi_5th" ,
    "Hindi_6th" ,
    "Hindi_7th",
    "Hindi_8th",
    "History_11th",
    "History_12th",
    "IP_11th",
    "IP_12th",
    "Math_2nd",
    "Math_3rd",
    "Math_4th",
    "Math_5th",
    "Math_6th",
    "Math_7th",
    "Math_8th",
    "Math_9th",
    "Math_10th",
    "Math_11th",
    "Math_12th",
    "Maths_11th",
    "Maths_12th"
        "Physics_9th",
    "Physics_10th",
    "Physics_11th",
    "Physics_12th",
    "Science_2nd",
    "Science_3rd",
    "Science_4th",
    "Science_5th",
    "Science_6th",
    "Science_7th",
    "Science_8th",
    "SST_1st",
    "SST_2nd",
    "SST_3rd",
    "SST_4th",
    "SST_5th",
    "SST_6th",
    "SST_7th",
    "SST_8th",
    "SST_9th",
    "SST_10th",
  ];
  List<String> courses = [];
  Future<void> getData(String Collection) async{
    var docSnapshot = await FirebaseFirestore.instance.collection(Collection).doc(email).get();
    if(docSnapshot.exists){
      if(!courses.contains(Collection)){
        courses.add(Collection);
      }
    }
  }
  String SClass = "";
  late String Classs;
  late String Name;
  String SName ="";
  Future<String> getClass() async{
    var respose = await FirebaseFirestore.instance.collection("Users").doc(email).get();
    if(respose.exists){
      Classs = respose.get("Class").toString();
    }
    return Classs;
  }
  Future<String> getName() async{
    var respose = await FirebaseFirestore.instance.collection("Users").doc(email).get();
    if(respose.exists){
      Name = respose.get("Name").toString();
    }
    return Name;
  }
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  void _scrollToDay(int day) {
    Scrollable.ensureVisible(dayKeys[day].currentContext!,
        duration: const Duration(milliseconds: 300));
  }
  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    getClass().then((value){SClass = value;setState(() {

    });});
    getName().then((value){SName = value;setState(() {

    });});
    for(int i = 0;i<map.length;i++){
      getData(map[i]);
    }
    final size = MediaQuery.of(context).size;
    return Container(
      child: Scaffold(
        key: _globalKey,
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  Container(
                    color: Colors.grey.shade200,
                    height: 200,
                    width: 600,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10,bottom: 30),
                          child: Container(

                              child: Image.asset("assets/images/smile.jpg",height:80,alignment: Alignment.centerLeft,)),
                        ),
                        SizedBox(width: 20,),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 30,),
                              Text(SName,overflow:TextOverflow.ellipsis,style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 25
                              ),),
                              SizedBox(height: 10,),
                              Text(email!,overflow:TextOverflow.ellipsis,style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12
                              ),),
                              SizedBox(height: 8,),
                              Text("Class "+ SClass,overflow:TextOverflow.fade,style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12
                              ),),
                              SizedBox(height: 8,),
                              InkWell(
                                onTap:(){Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ProfilePage(Class: SClass,Name: SName,)));},
                                child: Container(
                                  child: Row(
                                    children: [Text("Edit Profile",style: TextStyle(
                                        color: Colors.deepOrange,
                                        fontSize: 15
                                    ),),
                                      Icon(Icons.arrow_forward_ios_outlined,size: 10,color: Colors.deepOrange,)
                                    ]

                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  buildMenuItems(context)
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) { setState(() =>
            _currentIndex = index);
            _pageController.jumpToPage(index);
          },
          items: [
            BottomNavyBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                activeColor: kpink,
                inactiveColor: Colors.grey[300]),
            BottomNavyBarItem(
              icon: Icon(Icons.auto_stories_sharp),
              title: Text('Homework'),
              inactiveColor: Colors.grey[300],
              activeColor: kpink,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.play_circle_outline_rounded),
              title: Text('Courses'),
              inactiveColor: Colors.grey[300],
              activeColor: kpink,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
              inactiveColor: Colors.grey[300],
              activeColor: kpink,
            ),
          ],
        ),
        body:SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: <Widget>[SafeArea(
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: size.width*0.90),
                        child: IconButton(
                            onPressed: () {
                              _globalKey.currentState!.openDrawer();
                            },
                            icon: const Icon(
                              Icons.dashboard_rounded,
                              color: kblue,
                              size: 40,
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  [
                                    Container(
                                      width: 280,
                                      child: Text("Hi " +  SName,overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                      width: 280,
                                      child: Text(
                                        "Today is a good day\nto learn something new!",
                                        style: TextStyle(
                                          color: Colors.black54,
                                          wordSpacing: 2.5,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          color: kpurple,
                                          borderRadius: BorderRadius.circular(15.0)),
                                      child: Image.asset(
                                        "assets/images/profile.png",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            //sorting
                            Offers(),
                            //category list
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Courses",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                              ],
                            ),

                            const SizedBox(
                              height: 20,
                            ),

                            CategoryList(),
                            const SizedBox(
                              height: 40,
                            ),
                            Container(
                              color: Colors.deepOrange,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 30,),
                                  Center(child: Text("Speak to our Experts!",style: TextStyle(
                                      fontWeight: FontWeight.bold,fontSize: 30,
                                    color: Colors.white
                                  ),)),
                                  SizedBox(height: 20,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30,right: 20),
                                    child: Center(child: Text("Get more details about EduTech courses by booking a FREE counselling session with our experts",style: TextStyle(
                                        fontSize: 15,
                                      color: Colors.white
                                    ),)),
                                  ),
                                  SizedBox(height: 40,),
                                  InkWell(
                                    onTap:() async {
                                      final url = 'mailto:sirusinfo9@gmail.com?subject=${Uri
                                          .encodeFull(
                                          'Book Counselling Session')}&body=${Uri
                                          .encodeFull(
                                          'To know more about application and company services and education I want to book a FREE counselling session')}';
                                          if(await canLaunch(url)){
                                            await launch(url);
                                      }
                                        },

                                    child: Container(
                                      height: 40,
                                      width: 350,
                                      decoration:BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(15.0)
                                    ),child: Padding(
                                      padding: const EdgeInsets.only(left:60),
                                      child: Row(
                                        children: [
                                          Center(
                                            child: Text("Book a free counselling session",style: TextStyle(
                                                color: Colors.white,
                                              fontSize: 12
                                            ),),
                                          ),
                                          SizedBox(width: 20,),
                                          Center(child: Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,))
                                        ],
                                      ),
                                    ),
                                    ),
                                  ),
                                  SizedBox(height: 40,),
                                  Image.asset("assets/images/experts.png")

                                ],
                              ),
                            )

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              SelSub(),
              Courses(courses: courses,),
              ProfilePage(Class: SClass,Name: SName,)
          ]),
        ),



    ));
  }

  Widget buildHeader(BuildContext context) => Container(
    color: Color(0xFF0072A0),
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).padding.top,
    ),
    child: Column(
      children: [
        CircleAvatar(radius: 52,
          child: Image.asset("assets/images/smile.jpg",)
        ),
        SizedBox(height: 30),
        Text(email.toString(),style: TextStyle(fontSize: 20,color: Colors.green,fontFamily: GoogleFonts.montserratAlternates().fontFamily)),
        SizedBox(height: 20,)
      ]
    )
  );

  Widget buildMenuItems(BuildContext context) => Container(
    padding: const EdgeInsets.all(10),

      child: Wrap(
        runSpacing: 20,
        children: [
          ListTile(
              leading: Icon(Icons.play_circle_outline_rounded),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              title: const Text('Your Courses',style: TextStyle(color: Colors.black,fontSize:15)),
              subtitle: Text("Know which courses you can currently access",style: TextStyle(color:Colors.grey,fontSize: 9)),

              onTap:(){Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Courses(courses: courses,)));}
          ),
          ListTile(
              leading: Icon(Icons.auto_stories_sharp),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              title: const Text('Assignments',style: TextStyle(color: Colors.black,fontSize:15)),
              subtitle: Text("Complete you homework as assigned by owr teachers",style: TextStyle(color:Colors.grey,fontSize: 9)),

              onTap:(){Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SelSub()));}
          ),
          ListTile(
            leading: Icon(Icons.calendar_today_outlined),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            title: const Text('Book a Demo',style: TextStyle(color: Colors.black,fontSize:15)),
            subtitle: Text("Book a free counselling session with owr experts",style: TextStyle(color:Colors.grey,fontSize: 9)),

            onTap:()async {
              final url = 'mailto:sirusinfo9@gmail.com?subject=${Uri
                  .encodeFull(
                  'Book Counselling Session')}&body=${Uri
                  .encodeFull(
                  'To know more about application and company services and education I want to book a FREE counselling session')}';
              if(await canLaunch(url)){
                await launch(url);
              }
            },
      ),
          ListTile(
              leading: Icon(Icons.message),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              title: const Text('Share Issue or Feedback',style: TextStyle(color: Colors.black,fontSize:15)),
              subtitle: Text("Share issue or feedback with us so that we can improve",style: TextStyle(color:Colors.grey,fontSize: 9)),

              onTap:(){Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>IssueFeedback()));}
          ),
          ListTile(
              leading: Icon(Icons.people_alt_rounded),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              title: const Text('About Us',style: TextStyle(color: Colors.black,fontSize:15)),
              subtitle: Text("Join us in this journey and know about us",style: TextStyle(color:Colors.grey,fontSize: 9)),

              onTap:(){Navigator.of(context).push(MaterialPageRoute(builder: (ctz)=>AboutUs()));}
          ),
          ListTile(
              leading: Icon(Icons.logout,color: Colors.red,),
              trailing: const Icon(Icons.arrow_forward_ios_outlined,color: Colors.red,),
              title: const Text('Log Out',style: TextStyle(color: Colors.red,fontSize:15)),
              subtitle: Text("Get back to login",style: TextStyle(color:Colors.redAccent,fontSize: 9)),

              onTap:(){FirebaseAuth.instance.signOut();}
          ),

        ]
      ),

  );
  


}