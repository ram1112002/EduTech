import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_tech/SubPages/Computer_1st.dart';
import 'package:edu_tech/SubPages/English_1st.dart';
import 'package:edu_tech/SubPages/Hindi_1st.dart';
import 'package:edu_tech/SubPages/Math_1st.dart';
import 'package:edu_tech/SubPages/SST_1st.dart';
import 'package:edu_tech/SubPages/Science_1st.dart';
import 'package:edu_tech/components/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Pages/Details.dart';
import '../SubPages/Common.dart';
import '../SubPages/GK_1st.dart';
import '../SubPages/PaymentPage.dart';
import '../main.dart';

class CategoryList extends StatefulWidget {


  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {

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
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    getClass().then((value){SClass = value;});
    getName().then((value){SName = value;setState(() {

    });});
    if(SClass == "1st" || SClass == "2nd" || SClass == "3rd" || SClass == "4th" || SClass == "5th" || SClass == "6th" || SClass == "7th" || SClass == "8th"){
      return GridView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.85),
          itemBuilder: (context, index) => InkWell(
            onTap: (){Sub(SClass, products[index].title, products[index].cost.toString());},
            child: CategoryCard(
              product: products[index],
            ),
          ));
    }else if(SClass == "9th" || SClass == "10th" ){
      return GridView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: products_9_10.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.85),
          itemBuilder: (context, index) => InkWell(
            onTap: (){Sub(SClass, products_9_10[index].title, products_9_10[index].cost.toString());},
            child: CategoryCard(
              product: products_9_10[index],
            ),
          ));
    }
    else{
      return Column(
        children: [
          Text("Science",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,

          ),),
          GridView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: productsSci.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.85),
              itemBuilder: (context, index) => InkWell(
                onTap: (){Sub(SClass, productsSci[index].title, productsSci[index].cost.toString());},
                child: CategoryCard(
                  product: productsSci[index],
                ),
              )),
          Text("Commerce",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,

          ),),
          GridView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: productsCom.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.85),
              itemBuilder: (context, index) => InkWell(
                onTap: (){Sub(SClass, productsCom[index].title, productsCom[index].cost.toString());},
                child: CategoryCard(
                  product: productsCom[index],
                ),
              )),
          Text("Arts",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,

          ),),
          GridView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: productsArts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.85),
              itemBuilder: (context, index) => InkWell(
                onTap: (){Sub(SClass, productsArts[index].title, productsArts[index].cost.toString());},
                child: CategoryCard(
                  product: productsArts[index],
                ),
              )),
        ],
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

        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Common(Class: Class,Subject: Subject)));


      }}else{
      navigatorKey.currentState!.popUntil((route) => route.isFirst);

      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>PaymentPage(Class: Class, Subject: Subject, Amount: Amount,Name: SName,)));

    }
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: product.color, borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          children: [
            Image.asset(
              product.image,
              height: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              product.title,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              " Rs ${product.cost} ",
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
