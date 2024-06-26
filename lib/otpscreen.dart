import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskly/splash_screen.dart';

import 'home.dart';

class Otpscreencreen extends StatefulWidget {
final String verificationID;

  const Otpscreencreen({required this.verificationID});

  @override
  State<Otpscreencreen> createState() => _OtpScreencreenState();
}

class _OtpScreencreenState extends State<Otpscreencreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController otpController=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verfication"),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: otpController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  hintText: "Enter OTP",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  )),
            ),
          ),
          SizedBox(height: 40,),
          ElevatedButton(onPressed: ()async{
            var pref= await SharedPreferences.getInstance();
            String? name=pref.getString(SplashScreenState.nameKey);
            try{
              PhoneAuthCredential credential= await PhoneAuthProvider.credential(
                  verificationId: widget.verificationID,
                  smsCode: otpController.text.toString());
              FirebaseAuth.instance.signInWithCredential(credential).then((onValue){
                pref.setBool(SplashScreenState.nameScreenKey, true);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home(name: name!)));
              });
            }
            catch(ex){
              print('Exception: ${ex.toString()}');
            }



          }, child: Text("Verify OTP"))
        ],
      ),
    );
  }
}
