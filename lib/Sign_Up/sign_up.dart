import 'dart:async';
import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:food/Firebase/Sign_in.dart';
import 'package:food/Theme/images.dart';
import 'package:line_icons/line_icons.dart';
import '../Login Screen/login.dart';
import '../Theme/palette.dart';
import '../profile/edit_profile.dart';

class signup extends StatefulWidget {
  signup(BuildContext context);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    final FName_Form = GlobalKey<FormState>();
    final LName_Form = GlobalKey<FormState>();
    final Email_Form = GlobalKey<FormState>();
    final Password_Form = GlobalKey<FormState>();
    final RePassword_Form = GlobalKey<FormState>();
    final referencesDatase = FirebaseDatabase.instance;
    // FirebaseDatabase database = FirebaseDatabase.getInstance();
    // DatabaseReference myRef = database.getReference("message");

    TextEditingController _firstnameTextController = TextEditingController();
    TextEditingController _lastnameTextController = TextEditingController();
    TextEditingController _emailTextController = TextEditingController();
    TextEditingController _passwordTextController = TextEditingController();
    TextEditingController _password2TextController = TextEditingController();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final ref = referencesDatase.reference();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: h,
          width: w,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.food1),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // SizedBox(
                //   height: h / 10,
                // ),
                const Expanded(
                  flex: 7,
                  child: SizedBox(),
                ),
                Container(
                  padding: EdgeInsets.all(w / 30),
                  // height: h / 1.8,
                  // width: w / 1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(w / 23),
                    color: const Color.fromRGBO(255, 255, 255, 0.7),
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: w / 33),
                          Text(
                            "Sign Up",
                            style: TextStyle(
                                letterSpacing: 2,
                                fontSize: w / 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: h / 42),
                      Form(
                        key: FName_Form,
                        child: TextFormField(
                          controller: _firstnameTextController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter First Name';
                            }
                            return null;
                          },
                          onChanged: (text) {
                            if (FName_Form.currentState!.validate()) {}
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Palette.blue50,
                            hintText: "First Name",
                            prefixIcon: const Icon(
                              Icons.account_circle_outlined,
                              color: Palette.redcolor,
                            ),
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusColor: Palette.redcolor,
                          ),
                          enableInteractiveSelection: false,
                          autofocus: false,
                          cursorColor: Palette.grey,
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      SizedBox(height: h / 80),
                      Form(
                        key: LName_Form,
                        child: TextFormField(
                          controller: _lastnameTextController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Last Name';
                            }
                            return null;
                          },
                          onChanged: (text) {
                            if (LName_Form.currentState!.validate()) {}
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Palette.blue50,
                            hintText: "Last Name",
                            prefixIcon: const Icon(
                              Icons.account_circle_outlined,
                              color: Palette.redcolor,
                            ),
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusColor: Palette.redcolor,
                          ),
                          enableInteractiveSelection: false,
                          autofocus: false,
                          cursorColor: Palette.grey,
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      SizedBox(height: h / 80),
                      Form(
                        key: Email_Form,
                        child: TextFormField(
                          controller: _emailTextController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Email';
                            }
                            return null;
                          },
                          onChanged: (text) {
                            if (Email_Form.currentState!.validate()) {}
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Palette.blue50,
                            hintText: "Email",
                            prefixIcon: const Icon(
                              Icons.mail_outlined,
                              color: Palette.redcolor,
                            ),
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusColor: Palette.redcolor,
                          ),
                          enableInteractiveSelection: false,
                          autofocus: false,
                          cursorColor: Colors.grey,
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      SizedBox(height: h / 80),
                      Form(
                        key: Password_Form,
                        child: TextFormField(
                          controller: _passwordTextController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                          onChanged: (text) {
                            if (Password_Form.currentState!.validate()) {}
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue.shade50,
                            hintText: "Password",
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.red,
                            ),
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusColor: Colors.red,
                          ),
                          enableInteractiveSelection: false,
                          autofocus: false,
                          cursorColor: Colors.grey,
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                      ),
                      SizedBox(height: h / 80),
                      Form(
                        key: RePassword_Form,
                        child: TextFormField(
                          controller: _password2TextController,
                          validator: (value) {
                            if (_passwordTextController.text !=
                                _password2TextController.text) {
                              // if (RePassword_Form.currentState!.validate()) {}
                              return 'Password Not Match';
                            }
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Re-Password';
                            }
                          },
                          onChanged: (text) {
                            if (RePassword_Form.currentState!.validate()) {}
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue.shade50,
                            hintText: "Confirm Password",
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.red,
                            ),
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusColor: Colors.red,
                          ),
                          enableInteractiveSelection: false,
                          autofocus: false,
                          cursorColor: Colors.grey,
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                      ),
                      SizedBox(height: h / 35),
                      Container(
                        height: h / 17,
                        width: w / 1.5,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(251, 73, 61, 1),
                              blurRadius: 15.0,
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Create Account",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 10),
                                Icon(
                                  LineIcons.arrowRight,
                                  size: w / 18,
                                ),
                              ],
                            ),
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18),
                                        side: const BorderSide(
                                            color: Colors.red)))),
                            onPressed: () {
                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(_emailTextController.text);
                              if (emailValid == true) {
                                print("Valid Email");
                              }
                              if (FName_Form.currentState!.validate()) {}
                              if (LName_Form.currentState!.validate()) {}
                              if (Email_Form.currentState!.validate()) {}
                              if (Password_Form.currentState!.validate()) {}
                              if (RePassword_Form.currentState!.validate()) {}
                              // users.add({
                              //   'First Name': '${_firstnameTextController.text}',
                              //   'Last Name': '${_lastnameTextController.text}',
                              //   'Gmail': '${_emailTextController.text}'
                              // }).then((value) => print("User Added SuccessFully ! "));

                              FirebaseAuth.instance
                                  .applyActionCode(AutofillHints.name);
                              FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: _emailTextController.text,
                                      password: _passwordTextController.text)
                                  .then((value) {
                                print("Create New Account");
                                addUser(
                                  '${_firstnameTextController.text}',
                                  '${_lastnameTextController.text}',
                                  '${_emailTextController.text}',
                                  '${_passwordTextController.text}',
                                  '${_password2TextController.text}',
                                );
                                // FirebaseAuth auth = FirebaseAuth.instance;
                                // String uid = auth.currentUser!.uid.toString();
                                // print('Users Here is : ${uid}');
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            edit_profile(context)));
                              }).catchError((e) {
                                print("Error ${e.toString()}");
                                if (_firstnameTextController.text.isEmpty ||
                                    _lastnameTextController.text.isEmpty ||
                                    _emailTextController.text.isEmpty ||
                                    _password2TextController.text.isEmpty ||
                                    _password2TextController.text.isEmpty) {
                                } else {
                                  // _showToast(context, e.code);
                                  // Email Done
                                  if (e.code == "email-already-in-use") {
                                    _showToast(
                                        context, "already exists an account");
                                  }
                                  if (e.code == "invalid-email") {
                                    _showToast(context,
                                        "Please enter a valid email address");
                                  }
                                  // Email Finish
                                  if (e.code == "weak-password") {
                                    _showToast(
                                        context, "Your password is too short");
                                  }
                                  if (_passwordTextController.text ==
                                      _password2TextController.text) {
                                    print("trueeeee");
                                  }
                                }
                              });
                              // Finish !
                            }),
                      ),
                      SizedBox(width: w / 35)
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                // SizedBox(
                //   height: h / 16,
                // ),
                SizedBox(
                  height: h / 4.5,
                  width: w / 1.2,
                  child: Column(
                    children: [
                      SizedBox(height: h / 100),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: h / 300,
                            width: w / 4,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Palette.color246,
                                  Palette.redcolor,
                                ],
                                begin: FractionalOffset(0.0, 0.0),
                                end: FractionalOffset(1.0, 0.0),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp,
                              ),
                            ),
                          ),
                          SizedBox(width: w / 39),
                          Text(
                            "OR",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: w / 23),
                          ),
                          SizedBox(width: w / 39),
                          Container(
                            height: h / 300,
                            width: w / 4,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Palette.redcolor,
                                  Palette.color246,
                                ],
                                begin: FractionalOffset(0.0, 0.0),
                                end: FractionalOffset(1.0, 0.0),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: h / 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: h / 16,
                            width: w / 7.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset(
                              AppImages.apple,
                            ),
                          ),
                          SizedBox(width: w / 20),
                          Container(
                            height: h / 17,
                            width: w / 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.asset(
                              AppImages.facebook,
                            ),
                          ),
                          SizedBox(width: w / 20),
                          Container(
                            height: h / 17,
                            width: w / 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.asset(
                              AppImages.google,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: h / 30),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "Already have an account?",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    fontSize: w / 30),
                              ),
                            ),
                            Text(
                              " Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  color: Palette.redcolor,
                                  fontSize: w / 30),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showToast(BuildContext context, var error) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        padding: EdgeInsets.only(top: 15),
        backgroundColor: Palette.red400,
        duration: Duration(seconds: 3),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${error}',
              style: const TextStyle(
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget FromTxtField(var Form, var cont) {
  //   return Form(
  //     key: Form,
  //     child: TextFormField(
  //       controller: cont,
  //       validator: (value) {
  //         if (value == null || value.isEmpty) {
  //           return 'Please Enter First Name';
  //         }
  //         return null;
  //       },
  //       onChanged: (text) {
  //         if (Form.currentState!.validate()) {}
  //       },
  //       decoration: InputDecoration(
  //         filled: true,
  //         fillColor: Palette.blue50,
  //         hintText: "First Name",
  //         prefixIcon: const Icon(
  //           Icons.account_circle_outlined,
  //           color: Palette.redcolor,
  //         ),
  //         alignLabelWithHint: true,
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(15),
  //         ),
  //         focusColor: Palette.redcolor,
  //       ),
  //       enableInteractiveSelection: false,
  //       autofocus: false,
  //       cursorColor: Palette.grey,
  //       textAlign: TextAlign.left,
  //       keyboardType: TextInputType.name,
  //     ),
  //   );
  // }
}
