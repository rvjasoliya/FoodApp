import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food/Theme/images.dart';
import 'package:food/Theme/palette.dart';
import '../BottomBar/bottom_bar.dart';
import '../Login Screen/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => FirebaseAuth.instance.currentUser != null
                ? BottombarScreen()
                : LoginPage())));

    // Timer(const Duration(seconds: 2), () {
    //   Navigator.pushAndRemoveUntil(
    //       context,
    //       MaterialPageRoute(
    //         builder: (BuildContext context) => const LoginPage(),
    //       ),
    //       (route) => false);
    // });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
            height: h,
            width: w,
            color: Palette.color251,
            child: Center(
                child: SizedBox(
                    width: w / 2, child: Image.asset(AppImages.SplashLogo)))));
  }
}
