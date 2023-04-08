import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_tech/Pages/VerifyEmailPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class Details extends StatefulWidget{
  String email;
  Details({required this.email});
  _DetailsState createState() => _DetailsState(email: email);
}

class _DetailsState extends State<Details>{
  String email;
  DateTime now = DateTime.now();
  _DetailsState({required this.email});
  final formKey = GlobalKey<FormState>();
  List<bool> isCardEnabled = [];
  bool check = false;
  bool checkName = false;
  int Class = 0;
  TextEditingController Name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 70),
                  child: Text("Enter Student's Name" ,textAlign: TextAlign.left,style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: 390,
                  child: TextFormField(
                    controller: Name,
                    onChanged: (String Name) async{
                      if(Name == "" || Name == null){
                        setState(() {
                          checkName = false;
                        });
                      }
                      else{
                        setState(() {
                          checkName = true;
                        });
                      }
                    },
                    decoration: InputDecoration(
                    label: Text("For eg. Ram Sharma"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0)
                    ),
                  ),),
                ),
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.only(right: 190),
                  child: Text("Select Class" ,style: TextStyle(

                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 500,
                  width: 500,
                  child: GridView.builder(
                      padding: const EdgeInsets.all(15),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10
                      ),
                      itemCount: 12,
                      itemBuilder: (BuildContext context, int index){
                        isCardEnabled.add(false);
                        return GestureDetector(
                            onTap: (){
                              isCardEnabled.replaceRange(0, isCardEnabled.length, [for(int i = 0; i < isCardEnabled.length; i++)false]);
                              isCardEnabled[index]=true;
                              check = true;
                              Class = index+1;
                              setState(() {});
                            },
                            child: SizedBox(
                              height: 40,
                              width: 90,
                              child: Card(
                                color: isCardEnabled[index]?Colors.orange.shade400:Colors.grey.shade200,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: Center(
                                  child: Text('Class ' + (index+1).toString(),
                                    style: TextStyle(
                                        color: isCardEnabled[index]?Colors.white:Colors.black,
                                        fontSize: 18
                                    ),
                                  ),
                                ),
                              ),
                            )
                        );
                      }),

                ),
                InkWell(
                  onTap: ()async{
                    if(check  == true && checkName == true){
                      String SClass = "";
                      if(Class == 1){
                        SClass = Class.toString() + "st";
                      }
                      else if(Class == 2){
                        SClass = Class.toString() + "nd";
                      }
                      else if(Class == 3){
                        SClass = Class.toString() + "rd";
                      }
                      else{
                        SClass = Class.toString() + "th";
                      }

                      await FirebaseFirestore.instance.collection("Users").doc(email).set({
                        "Name" : Name.text,
                        "Class" : SClass,
                        "JoinedDate": now,
                        "Email": email
                      });
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> VerifyEmailPage()));
                    }

                  },
                  child: Container(
                    child: Center(child: Text("Continue",style: TextStyle(color: check && checkName?Colors.white: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold),)),
                    decoration: BoxDecoration(
                      color: check && checkName?Colors.orange.shade600: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 70,
                    width: 300,
                  ),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }

}