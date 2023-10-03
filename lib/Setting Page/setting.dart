import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food/Api/StoreDataFirebase.dart';
import 'package:food/Setting%20Page/color.dart';
import 'package:food/Theme/images.dart';
import 'package:food/Theme/palette.dart';
import 'package:line_icons/line_icons.dart';

import '../Firebase/GetUser_Detail.dart';
import '../Login Screen/login.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isSwitched = false;
  void initState() {
    var _ = Userdetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Text(
                      "Setting",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Fire()));
                      },
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage("${userDetail?.Photo.toString()}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 60,
                  width: w,
                  child: Row(
                    children: [
                      Icon(
                          isSwitched == true
                              ? Icons.notifications
                              : Icons.notifications_off,
                          size: 33),
                      SizedBox(width: 12),
                      SettingText('Notification'),
                      Spacer(),
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                            // print(value);
                          });
                        },
                        activeTrackColor: Palette.color39,
                        activeColor: Palette.whitecolor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 23),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => colorscreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 60,
                    width: w,
                    child: Row(
                      children: [
                        Icon(Icons.color_lens, size: 33),
                        SizedBox(width: 12),
                        SettingText('Colors'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 23),
                InkWell(
                  child: Container(
                    height: 60,
                    width: w,
                    child: Row(
                      children: [
                        const Icon(LineIcons.alternateSignOut, size: 33),
                        SizedBox(width: 12),
                        SettingText('Sign Out'),
                      ],
                    ),
                  ),
                  onTap: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget SettingText(var SettingText) {
    return Text(SettingText, style: TextStyle(fontSize: 22));
  }
}
