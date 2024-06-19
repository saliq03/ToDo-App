
import 'package:flutter/material.dart';
import 'package:taskly/widgets/materialtab.dart';


class Home extends StatefulWidget {
  final String name;

  const Home({required this.name});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool today=true,tommorrow=false,nextweek=false;
  TextEditingController addworkController=TextEditingController();
  bool chekboxValue=false;
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
                  Text("Good Morning",style: TextStyle(color: Colors.white70,fontSize: 22,fontWeight: FontWeight.w400),),
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
            CheckboxListTile(
              activeColor: Color(0xFF035A69),
                title: Text("Go to Gym",style: TextStyle(color: Colors.white,fontSize: 20),),
                value: chekboxValue, onChanged: (newValue){
              setState(() {
                chekboxValue=newValue!;});},
            controlAffinity: ListTileControlAffinity.leading,
            )
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
              onTap:(){
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
