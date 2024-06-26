import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskly/otpscreen.dart';
import 'package:taskly/splash_screen.dart';

class Name extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController=TextEditingController();
    TextEditingController phoneController=TextEditingController();
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Enter Your First Name:",style: TextStyle(color: Color(0xFF01A4BD),fontSize: 25,fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,top: 20),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Enter name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11)
                    )
                  ),
                ),
              ),
              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,top: 20),
                child: TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                      hintText: "Enter Mobile Number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11)
                      )
                  ),
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap:() async {
                  String name=nameController.text.toString();
                  String phone=phoneController.text.toString();
                  if(name!=''&& phone!=''){
                    var pref= await SharedPreferences.getInstance();
                    pref.setString(SplashScreenState.nameKey, name);
                    pref.setString(SplashScreenState.phoneKey, phone);
                    await FirebaseAuth.instance.verifyPhoneNumber(
                        verificationCompleted: (PhoneAuthCredential credential){},
                        verificationFailed: (FirebaseException ex){},
                        codeSent: (String verificationid,int? resendtoken){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Otpscreencreen(verificationID: verificationid,)));
                        },
                        codeAutoRetrievalTimeout: (String verificationid){},
                        phoneNumber: phoneController.text.toString());

                  }

                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 3),
                  decoration: BoxDecoration(
                      color: Color(0xFF035A69),
                      borderRadius: BorderRadius.circular(11)
                  ),child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
