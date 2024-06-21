import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
  Future addTodayWork(String work,String id) async {
   return await FirebaseFirestore.instance.collection("Today").doc(id).set({
      "Id": id,
      "Work": work
    });
  }

  Future addTomorrowWork(String work,String id) async {
    return await FirebaseFirestore.instance.collection("Tomorrow").doc(id).set({
      "Id": id,
      "Work": work
    });
  }

  Future addNextweekWork(String work,String id) async {
    return await FirebaseFirestore.instance.collection("NextWeek").doc(id).set({
      "Id": id,
      "Work": work
    });
  }
}