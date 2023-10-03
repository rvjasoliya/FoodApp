import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/Search/serach_recipes.dart';
import 'package:food/Theme/images.dart';
import 'package:food/profile/profile_medicine.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../Firebase/GetUser_Detail.dart';
import '../Theme/palette.dart';

class profile1 extends StatefulWidget {
  const profile1(BuildContext context);

  @override
  State<profile1> createState() => profile1State();
}

class profile1State extends State<profile1> {
  bool set = false;
  int value = 1;
  void initState() {
    var _ = Userdetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    height: h / 1.45,
                    width: w,
                  ),
                ),
                Positioned(
                  child: Container(
                    height: h / 2.1,
                    width: w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppImages.food6),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: h / 20),
                        Row(
                          children: [
                            SizedBox(width: 15),
                            IconButton(
                                icon: const Icon(Icons.arrow_back_ios_new),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                            Spacer(),
                            CircleAvatar(
                              maxRadius: w / 19,
                              backgroundColor: Palette.color0005,
                              child: Icon(
                                Icons.edit,
                                size: w / 20,
                                color: Palette.color255,
                              ),
                            ),
                            SizedBox(width: 15),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: w / 2.4),
                            Text(
                              "Profile",
                              style: TextStyle(
                                color: Palette.whitecolor,
                                fontSize: w / 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(width: w / 5),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: h / 5,
                  left: w / 21,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: h / 2.1,
                    width: w / 1.1,
                    decoration: BoxDecoration(
                      color: Palette.color2557,
                      borderRadius: BorderRadius.circular(w / 20),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: h / 13),
                        Text(
                          "${userDetail?.FName} ${userDetail?.LName}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: w / 19),
                        ),
                        SizedBox(height: h / 100),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircleAvatar(
                              backgroundColor: Palette.color2557,
                              backgroundImage: AssetImage(AppImages.verify),
                              maxRadius: 9,
                            ),
                            Text(
                              'Verified by Medic Diet',
                              style: TextStyle(
                                  color: Palette.blackcolor,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(height: h / 80),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LeftGridentContiner(),
                            RightGridentContiner(),
                          ],
                        ),
                        SizedBox(height: h / 45),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TitleText('Email'),
                            TitleAnswer('${userDetail?.Email}'),
                          ],
                        ),
                        SizedBox(height: h / 70),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TitleText('Weight'),
                            // TitleAnswer('60 Kg'),
                            TitleAnswer('${userDetail?.Weight} Kg'),
                          ],
                        ),
                        SizedBox(height: h / 70),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TitleText('Height'),
                            // TitleAnswer("5'2''"),
                            TitleAnswer("${userDetail?.Height}'0'"),
                          ],
                        ),
                        SizedBox(height: h / 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LeftGridentContiner(),
                            RightGridentContiner(),
                          ],
                        ),
                        SizedBox(height: h / 80),
                        Text(
                          "About",
                          style: TextStyle(
                            color: Palette.blackcolor,
                            fontSize: w / 29,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: h / 80),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                          style: TextStyle(
                            fontSize: w / 33,
                            color: Palette.grey500,
                          ),
                        ),
                        SizedBox(height: h / 140),
                        Text(
                          "Aliquam gravida bibendum dapibus.",
                          style: TextStyle(
                            fontSize: w / 33,
                            color: Palette.grey500,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 10, top: 3, right: 10),
                          height: h / 12,
                          width: w / 1.2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w / 25),
                              color: const Color.fromRGBO(24, 43, 73, 1)),
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
                                              color: Palette.whitecolor,
                                              fontSize: w / 27)))),
                              SizedBox(
                                height: h / 15,
                                width: w / 3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text("Low",
                                                      style: TextStyle(
                                                          fontWeight: set ==
                                                                  true
                                                              ? FontWeight.bold
                                                              : FontWeight
                                                                  .normal,
                                                          color: set == true
                                                              ? Palette
                                                                  .whitecolor
                                                              : Palette
                                                                  .blackcolor)),
                                                  const SizedBox(height: 8),
                                                  Container(
                                                    height: h / 250,
                                                    width: w / 120,
                                                    color: set == true
                                                        ? Palette.redcolor
                                                        : Colors.transparent,
                                                  )
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
                                                          ? Palette.whitecolor
                                                          : Palette
                                                              .blackcolor)),
                                              const SizedBox(height: 8),
                                              Container(
                                                height: h / 250,
                                                width: w / 120,
                                                color: set == false
                                                    ? Palette.redcolor
                                                    : Colors.transparent,
                                              ),
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
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: h / 7.5,
                  left: w / 2.8,
                  child: CircleAvatar(
                    backgroundColor: Palette.whitecolor,
                    maxRadius: h / 15.2,
                    child: Container(
                      height: h / 8.3,
                      width: w / 3.8,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("${userDetail?.Photo.toString()}"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(55),
                        color: Palette.color2557,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: w / 18),
                  height: 50,
                  width: w,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(width: w / 15),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            value = 1;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SelectText('My Recipes', 1),
                            SelectContainer(1),
                          ],
                        ),
                      ),
                      SizedBox(width: w / 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            value = 2;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SelectText('My Medicine', 2),
                            SelectContainer(2),
                          ],
                        ),
                      ),
                      SizedBox(width: w / 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            value = 3;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SelectText('Favorite', 3),
                            SelectContainer(3),
                          ],
                        ),
                      ),
                      SizedBox(width: w / 15),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 12, color: Palette.grey),
            value == 1
                ? const SearchRecipes()
                : const SizedBox(height: 0, width: 0),
            value == 2
                ? const ProfileMedicine()
                : const SizedBox(height: 0, width: 0),
          ],
        ),
      ),
    );
  }

  Widget SelectText(var SelectText, var val) {
    var w = MediaQuery.of(context).size.width;
    return Text(
      "$SelectText",
      style: TextStyle(
        fontSize: w / 24,
        fontWeight: value == val ? FontWeight.bold : FontWeight.normal,
        color: value == val ? Palette.blackcolor : Palette.grey600,
      ),
    );
  }

  Widget SelectContainer(var val1) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      height: h / 170,
      width: w / 75,
      decoration: BoxDecoration(
        color: value == val1 ? Palette.redcolor : Palette.whitecolor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget TitleText(var TitleName) {
    var w = MediaQuery.of(context).size.width;
    return Text("$TitleName",
        style: TextStyle(
            color: Palette.color131146,
            fontWeight: FontWeight.w600,
            fontSize: w / 30));
  }

  Widget TitleAnswer(var TitleAns) {
    var w = MediaQuery.of(context).size.width;
    return Text(
      "$TitleAns",
      style: TextStyle(
        color: Palette.blackcolor,
        fontSize: w / 29,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget LeftGridentContiner() {
    var w = MediaQuery.of(context).size.width;
    return Container(
        height: 0.6,
        width: w / 3,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Palette.color0000,
                  Palette.color0001,
                ],
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 2.0],
                tileMode: TileMode.clamp)));
  }

  Widget RightGridentContiner() {
    var w = MediaQuery.of(context).size.width;
    return Container(
        height: 0.6,
        width: w / 3,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Palette.color0001, Palette.color0000],
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 2.0],
                tileMode: TileMode.clamp)));
  }
}
