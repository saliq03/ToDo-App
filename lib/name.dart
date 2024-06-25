import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskly/home.dart';
import 'package:taskly/splash_screen.dart';

class Name extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController=TextEditingController();
    TextEditingController emailController=TextEditingController();
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
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: "Enter Email",
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
                  if(String!=''){
                    var pref= await SharedPreferences.getInstance();
                    pref.setBool(SplashScreenState.nameScreenKey, true);
                    pref.setString(SplashScreenState.nameKey, name);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home(name: name)));
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
