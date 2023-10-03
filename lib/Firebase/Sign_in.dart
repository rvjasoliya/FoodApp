// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// Future<void> userSetup(String displayname)async{
//   CollectionReference users= FirebaseFirestore.instance.collection('Users');
//   FirebaseAuth auth=FirebaseAuth.instance;
//   String uid= auth.currentUser!.uid.toString();
//   users.add({
//     'displayname' : displayname,
//     'uid': uid,
//   });

// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// class DatabaseService {
//   final String uid = '';
//   DatabaseService({this.uid});

//   final CollectionReference nameCollection =
//       FirebaseStorage.instance.collection('names');
//   Future updateUserData(string name) async {
//     return await nameCollection.doc(uid).set({
//       'name'=name,
//     })
//   }
// }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

// class AddUser extends StatelessWidget {
//   final String? fullName;
//   final String? company;
//   final int? age;

//   AddUser(this.fullName, this.company, this.age);

//   @override
//   Widget build(BuildContext context) {
//     CollectionReference users = FirebaseFirestore.instance.collection('users');

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

Future<void> addUser(
    var First_Name, var Last_Name, var Gmail, var Password, var password2) {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();

  // print(users.path);
  // users.doc(uid).update();
  return users.doc(uid).set({
    'firstName': '$First_Name',
    'lastName': '$Last_Name',
    'userEmail': '$Gmail',
    'Password': '$Password',
    'password2': '$password2',
    'userID': '$uid',
  }).then((value) {
    print("User Added");
  });
}

//
//
//
//
//
//

// Facth Data

