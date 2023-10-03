import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> addIndgredient(
    var Id, var Name, var Image, var aisle, var possibleUnits) {
  CollectionReference users =
      FirebaseFirestore.instance.collection('addIndgredient');
  FirebaseAuth auth = FirebaseAuth.instance;

  // print(users.path);
  // users.doc(uid).update();
  return users.doc(Id).set({
    'Id': '$Id',
    'Name': '$Name',
    'Image': '$Image',
    'aisle': '$aisle',
    'possibleUnits': '$possibleUnits',
  }).then((value) {
    print("Indegredinet Added");
  });
}
