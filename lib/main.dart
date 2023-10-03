import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Firebase/GetUser_Detail.dart';
import 'Firebase/Sign_in.dart';
import 'Login Screen/login.dart';
import 'Splash_Screen/Splash.dart';

UserDetail? userDetail;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
