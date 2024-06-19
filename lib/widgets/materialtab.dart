import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

