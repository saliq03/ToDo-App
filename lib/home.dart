
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskly/splash_screen.dart';
import 'package:taskly/widgets/materialtab.dart';

import 'database/database.dart';


class Home extends StatefulWidget {
  final String name;

  const Home({required this.name});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool today=true,tommorrow=false,nextweek=false;
  TextEditingController addworkController=TextEditingController();


  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 17) {
      return 'Good Afternoon';
    } else if (hour >= 17 && hour < 21) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF01A4BD),Color(0xFF02ABB0),Color(0xFF035A69),],begin: Alignment.topLeft,end: Alignment.bottomRight),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 90,left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("HELLO\n${widget.name.toUpperCase()}",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text(getGreeting(),style: TextStyle(color: Colors.white70,fontSize: 22,fontWeight: FontWeight.w400),),
                  SizedBox(height: 10,),
                ],
              ),
            ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               today? MaterialTab(title: "Today"): GestureDetector(
                   onTap: (){
                     today=true;tommorrow=false;nextweek=false;
                     setState(() {});
                     }, child: MyTab(title: "Today")),
               tommorrow? MaterialTab(title: "Tomorrow"): GestureDetector(
                   onTap: (){
                     today=false;tommorrow=true;nextweek=false;
                     setState(() {});
                     },child: MyTab(title: "Tomorrow")),
               nextweek? MaterialTab(title: "Next Week"): GestureDetector(
                   onTap: (){
                     today=false;tommorrow=false;nextweek=true;
                     setState(() {});
                   },child: MyTab(title: "Next Week")),
               // Text("Next Week",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)
             ],
           ),
            SizedBox(height: 20,),
            today?
            MystreamBuilder(day: "Today"):
            tommorrow? MystreamBuilder(day: "Tomorrow"):
            MystreamBuilder(day: "NextWeek"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        OpenBox();
      },
      child: Icon(Icons.add,color: Color(0xFF035A69),size: 30,),),
    );
  }
  Future OpenBox(){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: (){Navigator.pop(context);},
                child: Icon(Icons.cancel)),
            SizedBox(width: 10,),
            Text("Add the work ToDo",style: TextStyle(fontSize: 20,color:Color(0xFF01A4BD),fontWeight: FontWeight.bold),),
          ]),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: addworkController,
              decoration: InputDecoration(
                hintText: "Add Text",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide(
                    width: 2,
                  )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(
                      width: 2,
                      color: Color(0xFF035A69),
                    ))
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap:() async {
                var pref= await SharedPreferences.getInstance();
                String? Uid=pref.getString(SplashScreenState.phoneKey);
                String id=randomAlphaNumeric(10);
                String work=addworkController.text.toString();

                today? DatabaseMethods().addTodayWork(work, id,false,Uid!):
                tommorrow?DatabaseMethods().addTomorrowWork(work, id,false,Uid!):
                DatabaseMethods().addNextweekWork(work, id,false,Uid!);
                Navigator.pop(context);
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
      );
    });
  }

}
