import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskly/database/database.dart';

class MaterialTab extends StatelessWidget {
  final String title;
  MaterialTab({ required this.title});
  @override
  Widget build(BuildContext context) {
    return   Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          decoration: BoxDecoration(
              color: Color(0xFF46CDCF),
              borderRadius: BorderRadius.circular(20)
          ),
          child: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
    );
  }
}

class MyTab extends StatelessWidget {
final String title;
MyTab({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),);
  }

}

class MystreamBuilder extends StatefulWidget {

  final String day;
  const MystreamBuilder({ required this.day});
  @override
  State<MystreamBuilder> createState() => MystreamBuilderState();
}

class MystreamBuilderState extends State<MystreamBuilder> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection(widget.day).snapshots(),
            builder: (context,snapshot){
              if(snapshot.connectionState==ConnectionState.active){
                if(snapshot.hasData){
                  return ListView.builder(itemBuilder: (context,index){
                    return ListTile(

                        leading: Checkbox(
                          value: snapshot.data!.docs[index]["Done"],
                          onChanged: (newval){
                          DatabaseMethods().updateIfTicked(widget.day,snapshot.data!.docs[index]["Id"]);
                          setState(() {});
                        },),
                        title: Text("${snapshot.data!.docs[index]["Work"]}"),
                        trailing: IconButton(icon: Icon(Icons.delete,color: Colors.white,),
                          onPressed: () {  },)
                    );
                  },
                    itemCount:snapshot.data!.docs.length,
                  );
                }
                else if(snapshot.hasError){
                  return Text("${snapshot.error}");
                }
                else{
                  return Center(child: Text("No Data found"),);
                }
              }
              else{
                return Center(child: CircularProgressIndicator(),);
              }
            }
        ),
      ),
    );
  }
}





