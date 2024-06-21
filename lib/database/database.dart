import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
  Future addTodayWork(String work,String id,bool done) async {
   return await FirebaseFirestore.instance.collection("Today").doc(id).set({
      "Id": id,
      "Work": work,
       "Done": done
    });
  }

  Future addTomorrowWork(String work,String id,bool done) async {
    return await FirebaseFirestore.instance.collection("Tomorrow").doc(id).set({
      "Id": id,
      "Work": work,
      "Done": done
    });
  }

  Future addNextweekWork(String work,String id,bool done) async {
    return await FirebaseFirestore.instance.collection("NextWeek").doc(id).set({
      "Id": id,
      "Work": work,
      "Done": done
    });
  }

  Future updateIfTicked(String day,String id)async{
    return await FirebaseFirestore.instance.collection(day).doc(id).update({"Done": true});
  }
}