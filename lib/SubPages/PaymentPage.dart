import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_tech/Pages/HomePage.dart';
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
import 'package:edu_tech/SubPages/constants.dart';
import 'package:edu_tech/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PaymentPage extends StatefulWidget{
  String Class,Subject,Amount,Name;
  PaymentPage({required this.Class,required this.Subject,required this.Amount,required this.Name});
  _PaymentPageState createState() => _PaymentPageState(Class,Subject,Amount,Name);
}

class _PaymentPageState extends State<PaymentPage>{

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
  DateTime now = new DateTime.now();
  TextEditingController name = TextEditingController();
  String Class,Subject,Amount,Name;
  _PaymentPageState(this.Class,this.Subject,this.Amount,this.Name);
  String? Uemail = FirebaseAuth.instance.currentUser?.email;
  Map<String,dynamic>? paymentIntent;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFF5F4EF),
          image: DecorationImage(
            image: AssetImage("assets/images/payment.png"),
            alignment: Alignment.topRight,
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20, top: 50, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                    ],
                  ),
                  SizedBox(height: 30),
                  ClipPath(

                    child: Container(
                      color: kBestSellerColor,
                      padding: EdgeInsets.only(
                          left: 10, top: 5, right: 20, bottom: 5),
                      child: Text(
                        "Certified Course ".toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(Subject, style: kHeadingextStyle),
                  SizedBox(height: 16),
                  Text("Class " + Class, style: kHeadingextStyle),
                  SizedBox(height: 16),
                  Row(
                    children: <Widget>[
                      Image.asset("assets/images/star.png"),
                      SizedBox(width: 5),
                      Text("Live Session"),
                      SizedBox(width: 15),
                      Image.asset("assets/images/star.png"),
                      SizedBox(width: 5),
                      Text("Low Cost")
                    ],
                  ),
                  SizedBox(height: 40),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Rs. " + Amount,
                          style: kHeadingextStyle.copyWith(fontSize: 32),
                        ),
                        TextSpan(
                          text: "Rs. " + Amount + "0",
                          style: TextStyle(
                            color: kTextColor.withOpacity(.5),
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                            initialValue: Uemail,
                            decoration: InputDecoration(
                                labelText: "Email",
                                enabled: false,
                                prefixIcon: Icon(Icons.mail),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0)
                                )
                            ),
                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                            initialValue: Name,
                            enabled: false,
                            decoration: InputDecoration(

                              labelText: "Name",
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0)
                              ),

                            ),
                            autovalidateMode: AutovalidateMode
                                .onUserInteraction,
                            validator: (value) =>
                            value != null
                                ? null
                                : 'Enter Name First',

                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            initialValue: Class,
                            enabled: false,
                            decoration: InputDecoration(
                                labelText: "Class",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0)
                                )
                            ),
                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                              initialValue: Subject,
                              enabled: false,
                              decoration: InputDecoration(
                                  labelText: "Subject",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),

                                  )
                              )
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 50,
                              color: kTextColor.withOpacity(.1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(14),
                              height: 56,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFEDEE),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Image.asset(
                                  "assets/images/shopping-bag.png"),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  await payment();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: kBlueColor,
                                  ),
                                  child: Text(
                                    "Buy Now at Rs. ${Amount}",
                                    style: kSubtitleTextSyule.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
    Future<void> payment() async {
      showDialog(context: context,barrierDismissible: false, builder: (context) => Center(child: CircularProgressIndicator(),));

      try {
        paymentIntent = await createPaymentIntent(Amount, 'INR');
        //Payment Sheet
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
                paymentIntentClientSecret: paymentIntent!['client_secret'],
                style: ThemeMode.dark,

                merchantDisplayName: 'Sirus InfoTech')).then((value){
        });


        displayPaymentSheet();
        navigatorKey.currentState!.popUntil((route) => route.isFirst);

      } catch (e, s) {
        print('exception:$e$s');
      }
    }

    displayPaymentSheet() async {
      try {
        await Stripe.instance.presentPaymentSheet(
        ).then((value) async {
          await FirebaseFirestore.instance.collection(Subject+'_'+Class).doc(Uemail).set({
            "email" : Uemail,
            "Name"  : Name,
            "Subject" : Subject,
            "Class" : Class,
            "Joined Date" : now,
            "End Date" : DateTime(now.year,now.month+3,now.day),
            "Subscription" : true,
            "Teacher": false,
          });
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.check_circle, color: Colors.green,),
                        Text("Payment Successfull"),
                      ],
                    ),
                  ],
                ),
              ));
          // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("paid successfully")));

          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Common(Class: Class,Subject: Subject)));
          paymentIntent = null;

        }).onError((error, stackTrace){
          print('Error is:--->$error $stackTrace');
        });


      } on StripeException catch (e) {
        print('Error is:---> $e');
        showDialog(
            context: context,
            builder: (_) => const AlertDialog(
              content: Text("Cancelled "),
            ));
      } catch (e) {
        print('$e');
      }

    }

    //  Future<Map<String, dynamic>>
    createPaymentIntent(String amount, String currency) async {
      try {
        Map<String, dynamic> body = {
          'amount': calculateAmount(amount),
          'currency': currency,
          'payment_method_types[]': 'card'
        };

        var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          headers: {
            'Authorization': 'Bearer sk_test_51MhnKuSEVMo4lT9kwSfMnMpMmWZ2Ux1rgBmpAaTePFZRCxPNa2FG4x57XZDkQfPh0Dmt1JWC8nmr6eZaZaMyWxYc00wjOXGUFp',
            'Content-Type': 'application/x-www-form-urlencoded'
          },
          body: body,
        );
        // ignore: avoid_print
        print('Payment Intent Body->>> ${response.body.toString()}');
        return jsonDecode(response.body);
      } catch (err) {
        // ignore: avoid_print
        print('err charging user: ${err.toString()}');
      }
    }

    calculateAmount(String amount) {
      final calculatedAmout = (int.parse(amount)) * 100 ;
      return calculatedAmout.toString();
    }
  }




