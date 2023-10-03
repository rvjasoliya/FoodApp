import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

UserDetail? userDetail;
Future<void> Userdetail() async {
  final ref = FirebaseDatabase.instance.ref();

  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();
  print('user UID : ${uid}');
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  final DocumentReference document = users.doc(uid);

  return await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
    // print(snapshot.data);
    dynamic data = snapshot.data();
    var userData = UserDetail.fromJson(data);
    userDetail = userData;
    print(userDetail?.FName ?? '');
    print(userDetail?.LName ?? '');
    print(userDetail?.Email ?? '');
    print("Photo : ${userDetail?.Photo ?? ''}");
    print(userDetail?.Weight ?? '');
    print(userDetail?.Height ?? '');
    print(userDetail?.Description ?? '');
  });

  // final snapshot = await ref.child('users/$uid').get();
  // List itemlist = [];
  // try {
  //   await snapshot.then((QuerySnapshot) {
  //     QuerySnapshot.docs.forEach((element) {
  //       itemlist.add(element.data());
  //     });
  //     print("done");
  //   });
  // } catch (e) {
  //   print("Faild");
  // }
  // if (snapshot.exists) {
  //   print(snapshot.value);
  // } else {
  //   print('No data available.');
  // }
}

class UserDetail {
  String? FName;
  String? LName;
  String? Email;
  String? Photo;
  String? Weight;
  String? Height;
  String? Description;

  UserDetail({
    this.FName,
    this.LName,
    this.Email,
    this.Photo,
    this.Weight,
    this.Height,
    this.Description,
  });

  UserDetail.fromJson(Map<String, dynamic> json) {
    FName = json['firstName'];
    LName = json['lastName'];
    Email = json['userEmail'];
    Photo = json['photoUrl'];
    Weight = json['weight'];
    Height = json['height'];
    Description = json['about'];
    // name = json['First Name'];
    // name = json['First Name'];
    // name = json['First Name'];
    // name = json['First Name'];
    // name = json['First Name'];
    // name = json['First Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = FName;
    data['lastName'] = LName;
    data['userEmail'] = Email;
    data['photoUrl'] = Photo;
    data['weight'] = Weight;
    data['height'] = Height;
    data['about'] = Description;

    return data;
  }
}

// Edit_Screen Data Fetch

Future<void> getUserData() async {}
