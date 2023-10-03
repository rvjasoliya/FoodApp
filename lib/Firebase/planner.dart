import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> AddPlanner( Userid , Date,  StartDate,  EndDate,  StartTime,
    var EndTime,  var Alert, ) {
  CollectionReference Planner =
  FirebaseFirestore.instance.collection('planner');
  FirebaseAuth auth = FirebaseAuth.instance;
  var i=Planner.doc().id;

  return Planner.doc(i).set({
    'UserId': Userid,
    'id': i,
    'Date': '$Date',
    'StartDate' : '$StartDate',
    'EndDate': '$EndDate',
    'StartTime': '$StartTime',
    'EndTime': '$EndTime',
    // 'Repeat': '$Repeat',
    'Alert': '$Alert',
  }).then((value) {
    print("${i}Planner Details Added");
  });
}