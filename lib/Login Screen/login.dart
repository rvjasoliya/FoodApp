import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food/Theme/palette.dart';
import '../Sign_Up/sign_up.dart';
import '../Theme/images.dart';
import '../BottomBar/bottom_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    // For Email Validation _formkey
    final _formKey = GlobalKey<FormState>();
    // For Password Validation _fromkey1
    final _formKey1 = GlobalKey<FormState>();
    // Controller
    TextEditingController _emailTextController = TextEditingController();
    TextEditingController _passwordTextController = TextEditingController();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        controller: ScrollController(),
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
                //   height: h / 3.2,
                // ),
                const Expanded(
                  flex: 7,
                  child: SizedBox(),
                ),
                Container(
                  padding: EdgeInsets.all(w / 30),
                  // height: h / 10,
                  // width: w / 1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(w / 23),
                    color: Palette.color2557,
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: w / 32,
                          ),
                          Text(
                            "Login",
                            style: TextStyle(
                                letterSpacing: 2,
                                fontSize: w / 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h / 30,
                      ),
                      Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: _emailTextController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Username';
                            }
                            return null;
                          },
                          onChanged: (text) {
                            if (_formKey.currentState!.validate()) {}
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Palette.blue50,
                            hintText: "Username",
                            prefixIcon: const Icon(
                              Icons.account_circle_rounded,
                              color: Palette.redcolor,
                            ),
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusColor: Palette.redcolor,
                          ),
                          enableInteractiveSelection: false,
                          autofocus: false,
                          cursorColor: Palette.grey,
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      SizedBox(
                        height: h / 50,
                      ),
                      Form(
                        key: _formKey1,
                        child: TextFormField(
                          controller: _passwordTextController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                          onChanged: (text) {
                            if (_formKey1.currentState!.validate()) {}
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Palette.blue50,
                            hintText: "Password",
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Palette.redcolor,
                            ),
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusColor: Palette.redcolor,
                          ),
                          enableInteractiveSelection: false,
                          autofocus: false,
                          cursorColor: Palette.grey,
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      SizedBox(
                        height: h / 35,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: h / 13,
                            width: w / 30,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  fontSize: w / 30),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: h / 19,
                            width: w / 4.8,
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Palette.color251,
                                  blurRadius: 15.0,
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                                child: const Icon(Icons.arrow_forward_sharp),
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                      Palette.whitebackground,
                                    ),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Palette.redcolor),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18),
                                            side: const BorderSide(
                                                color: Palette.redcolor)))),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {}
                                  if (_formKey1.currentState!.validate()) {}
                                  // bool emailValid = RegExp(
                                  //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  //     .hasMatch(_emailTextController.text);
                                  // if (emailValid == true) {
                                  //   print("Valid Email");
                                  // }
                                  // Pattern pattern =
                                  //     r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                  //     r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                  //     r"{0,253}[a-zA-Z0-9])?)*$";
                                  // if (_emailTextController.text == pattern) {
                                  //   return;
                                  // } else {
                                  //   () {
                                  //     print("Enter Valid Email ");
                                  //     return 'Enter Valid Email';
                                  //   };
                                  // }

                                  FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: _emailTextController.text,
                                          password:
                                              _passwordTextController.text)
                                      .then((value) {
                                    print("Account Open...");
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BottombarScreen()));
                                  }).catchError((e) {
                                    print("Error : ${e}");
                                    // print("Error : ${e}");
                                    if (_emailTextController.text.isEmpty ||
                                        _passwordTextController.text.isEmpty) {
                                    } else {
                                      // _showToast(context, e.code);
                                      // _showToast(context, e.code);
                                      if (e.code == "user-not-found") {
                                        _showToast(context, "User Not Found");
                                      }
                                      if (e.code == "invalid-email") {
                                        _showToast(context,
                                            "Please enter a Correct Username");
                                      }
                                      if (e.code == "wrong-password") {
                                        _showToast(context, "Wrong Password !");
                                      }
                                    }

                                    // if (_emailTextController.text.isEmpty) {
                                    //   _showToast(context, 'Please Enter Email');
                                    // } else {
                                    //   if (_emailTextController.text.length <
                                    //       9) {
                                    //     _showToast(context,
                                    //         'Please Enter Valid Email');
                                    //   }
                                    // }
                                  });
                                }),
                          ),
                          SizedBox(
                            width: w / 35,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                // SizedBox(
                //   height: h / 20,
                // ),
                Container(
                  // color: Colors.red,
                  height: h / 4.5,
                  width: w / 1.2,
                  child: Column(
                    children: [
                      SizedBox(
                        height: h / 100,
                      ),
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
                          SizedBox(
                            width: w / 39,
                          ),
                          Text(
                            "OR",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: w / 23),
                          ),
                          SizedBox(
                            width: w / 39,
                          ),
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
                      SizedBox(
                        height: h / 30,
                      ),
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
                          SizedBox(
                            width: w / 20,
                          ),
                          Container(
                            height: h / 18,
                            width: w / 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.asset(
                              AppImages.facebook,
                            ),
                          ),
                          SizedBox(
                            width: w / 20,
                          ),
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
                          // Text("${userDetail?.name}"),
                        ],
                      ),
                      SizedBox(
                        height: h / 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => signup(context)));
                          // Userdetail();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    fontSize: w / 30),
                              ),
                            ),
                            Text(
                              " Create Account",
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

//   Future<void> main() async {
//     WidgetsFlutterBinding.ensureInitialized();
//     await Firebase.initializeApp();

// // Ideal time to initialize
//     await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
// //...
//   }
  void _showToast(BuildContext context, var error) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        padding: EdgeInsets.only(top: 15),
        backgroundColor: Palette.red400,
        duration: Duration(seconds: 2),
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
}
