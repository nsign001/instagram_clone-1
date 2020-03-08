import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreProvider{
  Future<void> sendData(){
    return Firestore.instance
        .collection('Users')
        .document('123123123')
        .setData({'email': 'hacyeal@naver.com', 'author': 'author'});
  }

  Stream<dynamic> getData(){
    Firestore.instance
        .collection('Users')
        .document('123123123')
        .get()
        .then((DocumentSnapshot ds){
          print(ds.data);
         });
  }
}

FirestoreProvider firestoreProvider = FirestoreProvider();