import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskly/home.dart';
import 'package:taskly/name.dart';

class SplashScreen extends StatefulWidget {
 
  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String nameScreenKey="nameScreenKey";
  static const String nameKey="nameKey";
  @override
  void initState() {
    super.initState();
        Timer(Duration(seconds: 1),(){
          Navigate();
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF02ABB0),
        child: Center(
          child: SizedBox(width: 270,
              child: Image.asset("assets/icons/splashlogos.png",)),
        ),
      ),
    );
  }

  Future<void> Navigate() async {
    var pref= await SharedPreferences.getInstance();
    bool? isnamingdone=pref.getBool(nameScreenKey);

    if(isnamingdone==true){
      String name=pref.getString(nameKey)!;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home(name: name)));
    }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Name()));
    }


  }
}

