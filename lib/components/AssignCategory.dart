import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_tech/SubPages/PaymentPage.dart';
import 'package:edu_tech/components/product_model.dart';
import 'package:edu_tech/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Assignment.dart';

class AssignCategory extends StatefulWidget{
  _AssignCategoryState createState() => _AssignCategoryState();
}

class _AssignCategoryState extends State<AssignCategory>{

  DateTime now = DateTime.now();
  String? email = FirebaseAuth.instance.currentUser?.email;
  String SClass = "";
  String Classs = "";
  String Name = "";
  String SName = "";
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
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    getClass().then((value) {
      SClass = value;setState(() {

      });
    });
    getName().then((value){SName = value;setState(() {

    });});
    if (SClass == "1st" || SClass == "2nd" || SClass == "3rd" ||
        SClass == "4th" || SClass == "5th" || SClass == "6th" ||
        SClass == "7th" || SClass == "8th") {
      return ListView.builder(
          itemCount: products.length, itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 5),
          child: InkWell(
            onTap: () async {
              Sub(SClass, products[index].title,
                  products[index].cost.toString());
            },
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                  color: products[index].color,
                  borderRadius: BorderRadius.circular(10.0)
              ),

              child: ListTile(
                title: Text(products[index].title),
                leading: Image.asset(products[index].image),
                subtitle: Text("Assignment"),
              ),
            ),
          ),
        );
      });
  }else if(SClass == "9th" || SClass == "10th"){
      return ListView.builder(itemCount: products_9_10.length,itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 5),
          child: InkWell(
            onTap: () async{
              Sub(SClass, products_9_10[index].title, products_9_10[index].cost.toString());
            },
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                  color: products_9_10[index].color,
                  borderRadius: BorderRadius.circular(10.0)
              ),

              child: ListTile(
                title: Text(products_9_10[index].title),
                leading: Image.asset(products_9_10[index].image),
                subtitle: Text("Assignment"),
              ),
            ),
          ),
        );
      });

    }else{
      return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 0 ,),
            Text("Science",style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,

            ),),
            SizedBox(
              width: size.width,
              child: ListView.builder(shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),itemCount: productsSci.length,itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 5),
                      child: InkWell(
                        onTap: () async{
                          Sub(SClass, productsSci[index].title, productsSci[index].cost.toString());
                        },
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                              color: productsSci[index].color,
                              borderRadius: BorderRadius.circular(10.0)
                          ),

                          child: ListTile(
                            title: Text(productsSci[index].title),
                            leading: Image.asset(productsSci[index].image),
                            subtitle: Text("Assignment"),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Text("Commerce",style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,

            ),),
            SizedBox(
              width: size.width,
              child: ListView.builder(shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),itemCount: productsCom.length,itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 5),
                      child: InkWell(
                        onTap: () async{
                          Sub(SClass, productsCom[index].title, productsCom[index].cost.toString());
                        },
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                              color: productsCom[index].color,
                              borderRadius: BorderRadius.circular(10.0)
                          ),

                          child: ListTile(
                            title: Text(productsCom[index].title),
                            leading: Image.asset(productsCom[index].image),
                            subtitle: Text("Assignment"),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Text("Arts",style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,

            ),),
            SizedBox(
              width: size.width,
              child: ListView.builder(shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),itemCount: productsArts.length,itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 5),
                      child: InkWell(
                        onTap: () async{
                          Sub(SClass, productsArts[index].title, productsArts[index].cost.toString());
                        },
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                              color: productsArts[index].color,
                              borderRadius: BorderRadius.circular(10.0)
                          ),

                          child: ListTile(
                            title: Text(productsArts[index].title),
                            leading: Image.asset(productsArts[index].image),
                            subtitle: Text("Assignment"),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      );
    }
  }
  Sub(String Class,String Subject,String Amount) async{
    showDialog(context: context,barrierDismissible: false, builder: (context) => Center(child: CircularProgressIndicator(),));
    DateTime date;
    bool sub;
    var respose = await FirebaseFirestore.instance.collection(Subject+"_"+Class).doc(email).get();
    if(respose.exists){
      date = respose.get('End Date').toDate();
      String name = respose.get('Name');
      DateTime joined = respose.get('Joined Date').toDate();
      bool teacher = respose.get('Teacher');
      if(date.compareTo(now)<=0){
        await FirebaseFirestore.instance.collection(Subject+'_'+Class).doc(email).set({
          "email" : email,
          "Name"  : name,
          "Subject" : Subject,
          "Class" : Class,
          "Joined Date" : joined,
          "End Date" : date,
          "Subscription" : false,
          "Teacher": teacher,
        });
      }
      sub = respose.get('Subscription');
      if(sub == false){
        navigatorKey.currentState!.popUntil((route) => route.isFirst);

        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>PaymentPage(Class: Class, Subject: Subject, Amount: Amount,Name: SName,)));

      }else{
        navigatorKey.currentState!.popUntil((route) => route.isFirst);

        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Assignment(teacher: teacher, Subject: Subject, Class: Class)));


      }}else{
      navigatorKey.currentState!.popUntil((route) => route.isFirst);

      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>PaymentPage(Class: Class, Subject: Subject, Amount: Amount,Name: SName,)));

    }
  }

}