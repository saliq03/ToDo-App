import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
  Future addTodayWork(String work,String id,bool done,String UID) async {
   return await FirebaseFirestore.instance.collection("Users").doc(UID).collection("Today").doc(id).set({
      "Id": id,
      "Work": work,
       "Done": done
    });
  }

  Future addTomorrowWork(String work,String id,bool done,String UID) async {
    return await FirebaseFirestore.instance.collection("Users").doc(UID).collection("Tomorrow").doc(id).set({
      "Id": id,
      "Work": work,
      "Done": done
    });
  }

  Future addNextweekWork(String work,String id,bool done,String UID) async {
    return await FirebaseFirestore.instance.collection("Users").doc(UID).collection("NextWeek").doc(id).set({
      "Id": id,
      "Work": work,
      "Done": done
    });
  }

  Future updateIfTicked(String day,String id,String UID)async{
    return await FirebaseFirestore.instance.collection("Users").doc(UID).collection(day).doc(id).update({"Done": true});
  }

  Future deleteWork(String day,String id,String UID)async{
    return await FirebaseFirestore.instance.collection("Users").doc(UID).collection(day).doc(id).delete();
  }

}