import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:count_stepper/count_stepper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:food/Theme/images.dart';
import 'package:food/other/Controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import '../BottomBar/bottom_bar.dart';
import '../Firebase/GetUser_Detail.dart';
import '../Theme/palette.dart';

class edit_profile extends StatefulWidget {
  edit_profile(BuildContext context);

  @override
  State<edit_profile> createState() => _edit_profileState();
}

class _edit_profileState extends State<edit_profile> {
  StepperController _WeightController = StepperController();
  StepperController _HeightController = StepperController();

  var c = Controller();
  bool set = false;
  XFile? image;
  final ImagePicker? _picker = ImagePicker();
  // String imageUrl = "";

  @override
  void initState() {
    var _ = Userdetail();
    super.initState();
  }

// var _ = Userdetail();
//     setState(() {
//     });

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(child: SizedBox(height: h, width: w)),
          Positioned(
              child: Container(
                  height: h / 2,
                  width: w,
                  decoration: BoxDecoration(
                      color: Palette.redcolor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(w / 10),
                          bottomRight: Radius.circular(w / 10)),
                      image: const DecorationImage(
                          image: AssetImage(AppImages.food6),
                          fit: BoxFit.cover)),
                  child: Column(children: [
                    SizedBox(height: h / 14),
                    Text("Profile",
                        style: TextStyle(
                            fontSize: w / 24,
                            color: Palette.whitebackground,
                            fontWeight: FontWeight.bold))
                  ]))),
          Positioned(
            top: h / 5,
            left: w / 18,
            child: Container(
              padding: const EdgeInsets.all(15),
              height: h / 3.1,
              width: w / 1.13,
              decoration: BoxDecoration(
                  color: Palette.color2557,
                  borderRadius: BorderRadius.circular(w / 15)),
              child: Column(
                children: [
                  SizedBox(height: h / 15),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text("Add Image",
                        style: TextStyle(
                          fontSize: w / 25,
                          fontWeight: FontWeight.w500,
                          color: Palette.color131146,
                        ))
                  ]),
                  Row(
                    children: [
                      // Text("${userDetail?.FName}"),
                      SizedBox(
                        width: w / 1.9,
                        height: h / 23,
                        child: TextFormField(
                          controller: c.Edit_F_Name,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "${userDetail?.FName}",
                            hintStyle: const TextStyle(
                                fontSize: 15, color: Palette.color131146),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: h / 120),
                  Row(
                    children: [
                      SizedBox(
                        width: w / 1.9,
                        height: h / 23,
                        child: TextFormField(
                          controller: c.Edit_L_Name,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "${userDetail?.LName}",
                            hintStyle: const TextStyle(
                              fontSize: 15,
                              color: Palette.color131146,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: h / 45),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 5, right: 15),
                        height: h / 14,
                        width: w / 1.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Weight",
                                  style: TextStyle(
                                    fontSize: w / 27,
                                    color: Palette.color131146,
                                  ),
                                ),
                                CountStepper(
                                  controller: _WeightController,
                                  defaultValue: 0,
                                  max: 50,
                                  min: 0,
                                  space: w / 25,
                                  splashRadius: 10,
                                  iconDecrement: const Icon(
                                    LineIcons.minus,
                                    color: Palette.grey,
                                  ),
                                  iconIncrement: const Icon(
                                    LineIcons.plus,
                                    color: Palette.grey,
                                  ),
                                  onPressed: (value) {},
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Height",
                                  style: TextStyle(
                                    fontSize: w / 27,
                                    color: Palette.color131146,
                                  ),
                                ),
                                CountStepper(
                                  controller: _HeightController,
                                  defaultValue: 0,
                                  max: 50,
                                  min: 0,
                                  space: w / 25,
                                  splashRadius: 10,
                                  iconDecrement: const Icon(
                                    LineIcons.minus,
                                    color: Palette.grey,
                                  ),
                                  iconIncrement: const Icon(
                                    LineIcons.plus,
                                    color: Palette.grey,
                                  ),
                                  onPressed: (value) {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: h / 7.5,
            left: w / 2.8,
            child: CircleAvatar(
              backgroundColor: Palette.grey500,
              maxRadius: h / 15.5,
              child: CircleAvatar(
                maxRadius: h / 16.5,
                backgroundImage: image == null
                    ? const ExactAssetImage(
                        AppImages.profile,
                      ) as ImageProvider
                    : FileImage(
                        File(image!.path),
                      ),
              ),
            ),
          ),
          Positioned(
            top: h / 4.62,
            left: w / 1.9,
            child: IconButton(
              onPressed: () {
                bottomsheet();
              },
              icon:
                  Icon(LineIcons.edit, size: w / 14, color: Palette.blackcolor),
            ),
          ),
          Positioned(
            top: h / 1.85,
            child: Container(
              height: h / 2.1,
              width: w,
              color: Palette.whitebackground,
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text('About you',
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: w / 28))
                  ]),
                  SizedBox(height: h / 70),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: h / 5,
                        width: w / 1.2,
                        child: TextFormField(
                          controller: c.DescriptionController,
                          minLines: 5,
                          maxLines: 20,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintText: 'Enter Step Description here...',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, top: 3, right: 10),
                    height: h / 12,
                    width: w / 1.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(w / 25),
                      color: const Color.fromRGBO(24, 43, 73, 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: h / 15,
                            width: w / 2.5,
                            decoration: BoxDecoration(
                                color: Palette.color023,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text('Carb Preferences',
                                    style: TextStyle(
                                        color: Palette.whitebackground,
                                        fontSize: w / 27)))),
                        SizedBox(
                          height: h / 15,
                          width: w / 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          set = true;
                                        });
                                      },
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text("Low",
                                                style: TextStyle(
                                                    fontWeight: set == true
                                                        ? FontWeight.bold
                                                        : FontWeight.normal,
                                                    color: set == true
                                                        ? Palette
                                                            .whitebackground
                                                        : Palette.blackcolor)),
                                            const SizedBox(height: 8),
                                            Container(
                                                height: h / 250,
                                                width: w / 120,
                                                color: set == true
                                                    ? Palette.whitebackground
                                                    : Colors.transparent)
                                          ])),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        set = false;
                                      });
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("Medium",
                                            style: TextStyle(
                                                fontWeight: set == false
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                                color: set == false
                                                    ? Palette.whitebackground
                                                    : Palette.blackcolor)),
                                        const SizedBox(height: 8),
                                        Container(
                                            height: h / 250,
                                            width: w / 120,
                                            color: set == false
                                                ? Palette.whitebackground
                                                : Colors.transparent),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: h / 22),
                  InkWell(
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 10, top: 3, right: 10),
                      height: h / 13,
                      width: w / 1.2,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(color: Palette.color251, blurRadius: 20.0)
                        ],
                        borderRadius: BorderRadius.circular(w / 23),
                        color: Palette.color251,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Save & Continue",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Palette.whitebackground,
                                  fontSize: w / 30)),
                          const SizedBox(width: 10),
                          Icon(LineIcons.arrowRight,
                              size: w / 18, color: Palette.whitebackground)
                        ],
                      ),
                    ),
                    onTap: () async {
                      // ImageUrl
                      FirebaseStorage storage = FirebaseStorage.instance;
                      Reference ref =
                          storage.ref().child('User/${DateTime.now()}');
                      await ref.putFile(File(image!.path));
                      // imageUrl = (await ref.getDownloadURL()).toString();
                      String imageUrl = await ref.getDownloadURL();
                      //
                      FirebaseAuth auth = FirebaseAuth.instance;
                      String uid = auth.currentUser!.uid.toString();

                      if (_WeightController.currentValue == 0) {
                        _showToast(context, "Please Enter Your Weight");
                      } else {
                        if (_HeightController.currentValue == 0) {
                          _showToast(context, "Please Enter Your Height");
                        } else {
                          if (c.DescriptionController.text.isEmpty) {
                            _showToast(context, "Please Enter Description");
                          } else {
                            if (image!.path.isEmpty) {
                              _showToast(context, "Please Select Image");
                            }
                          }
                        }
                      }
                      var users =
                          FirebaseFirestore.instance.collection('users');
                      // users.add({'Weight': '21'}).then(
                      //     (value) => print("User adddddddddd"));
                      // print(uid);

                      await users
                          .doc(uid)
                          .update({
                            'firstName': c.Edit_F_Name.text,
                            'lastName': c.Edit_L_Name.text,
                            'weight': '${_WeightController.currentValue}',
                            'height': '${_HeightController.currentValue}',
                            'about': c.DescriptionController.text,
                            // 'photoUrl': image!.path,
                            'photoUrl': imageUrl,
                          })
                          .then(
                            (_) => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BottombarScreen())),
                          )
                          .catchError((error) => {});

                      // var user = Firebase.auth.currentUser;
                      // addUser(
                      //     '',
                      //     '',
                      //     '',
                      //     '',
                      //     '$_WeightController',
                      //     '$_HeightController',
                      //     '${_DescriptionController.text}');
                      // collection
                      //     .doc('doc_id')
                      //     .update({
                      //       'Weight': '$_WeightController'
                      //     }) // <-- Updated data
                      //     .then((_) => print('Success'))
                      //     .catchError((error) => print('Failed: $error'));

                      // Userdetail();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bottomsheet() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Column(mainAxisSize: MainAxisSize.min, children: [
            InkWell(
                onTap: () {
                  gallery();
                  Navigator.pop(context);
                },
                child: const ListTile(
                    title: Text("Gallery"), leading: Icon(Icons.image))),
            InkWell(
                onTap: () {
                  camera();
                  Navigator.pop(context);
                },
                child: const ListTile(
                    title: Text("Camera"), leading: Icon(Icons.camera))),
            const SizedBox(height: 30)
          ]);
        });
  }

  gallery() async {
    final XFile? sImage = await _picker?.pickImage(
        source: ImageSource.gallery,
        imageQuality: 25,
        maxHeight: 230,
        maxWidth: 300);

    setState(() {
      image = sImage;
      // print(image);
    });
  }

  camera() async {
    final XFile? sImage = await _picker?.pickImage(
        source: ImageSource.camera,
        imageQuality: 25,
        maxHeight: 230,
        maxWidth: 300);

    setState(() {
      image = sImage;
    });
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
}
