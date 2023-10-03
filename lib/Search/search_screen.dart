import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food/Search/search_all.dart';
import 'package:food/Search/search_medicine_screen.dart';
import 'package:food/Search/serach_recipes.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../Filter/filter_screen.dart';
import '../Theme/images.dart';
import '../Theme/palette.dart';
import '../profile/profile1.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var Photo = [
    AppImages.breakfast,
    AppImages.lunch,
    AppImages.food8,
    AppImages.food3
  ];
  var name = ["Break Fast", "Lunch", "SendWich", "Lunch"];
  var manphoto = [AppImages.man1, AppImages.man2];

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Search",
          style: TextStyle(
              color: Palette.blackcolor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          // InkWell(
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => const FilterScreen()));
          //   },
          //   child: CircleAvatar(
          //     backgroundColor: Palette.red100,
          //     child: Container(
          //       height: 42,
          //       width: 39,
          //       decoration: BoxDecoration(
          //         color: Palette.red100,
          //         borderRadius: BorderRadius.circular(26),
          //         image: const DecorationImage(
          //           image: AssetImage(AppImages.sort),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // const SizedBox(
          //   width: 20,
          // ),
        ],
        backgroundColor: Palette.whitebackground,
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: h / 15,
                width: w / 1.1,
                margin: EdgeInsets.all(w / 25),
                decoration: BoxDecoration(
                    color: Palette.whitecolor,
                    border: Border.all(color: Palette.black45),
                    borderRadius: BorderRadius.circular(h / 2)),
                child: TextField(
                  autocorrect: false,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search for Pies Sushi Tacos...',
                    hintStyle: TextStyle(
                        color: Palette.blackcolor.withOpacity(0.3),
                        fontSize: 15),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Palette.blackcolor.withOpacity(0.7),
                    ),
                  ),
                  cursorColor: Palette.blackcolor,
                ),
              ),
            ),
            SizedBox(height: h / 150),
            DefaultTabController(
              length: 3, // length of tabs
              initialIndex: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: Material(
                      child: TabBar(
                        indicatorColor: Colors.green,
                        tabs: const [
                          Tab(text: 'All'),
                          Tab(text: 'Recipes'),
                          Tab(text: 'Medicines'),
                        ],
                        labelColor: Colors.black,
                        indicator: DotIndicator(
                          color: Colors.red,
                          distanceFromCenter: 16,
                          radius: 3,
                          paintingStyle: PaintingStyle.fill,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: h / 1.78, //height of TabBarView
                    decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.grey, width: 0.5))),
                    child: TabBarView(
                      children: <Widget>[
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: h / 32),
                              Row(
                                children: [
                                  SizedBox(width: w / 25),
                                  Text(
                                    "Recipes",
                                    style: TextStyle(
                                        color: Palette.blackcolor,
                                        fontSize: w / 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: h / 2.70,
                                child: const SlideContainer1(),
                              ),
                              Row(
                                children: [
                                  SizedBox(width: w / 25),
                                  Text(
                                    "Verified Dietitians",
                                    style: TextStyle(
                                        color: Palette.blackcolor,
                                        fontSize: w / 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: h / 5,
                                // color: Colors.red,
                                child: const SlideContainer2(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: const SearchRecipes(),
                        ),
                        Container(
                          child: ListView.builder(
                              itemCount: 3,
                              itemBuilder: (BuildContext context, int index) {
                                return const SearchMedicineScreen();
                              }),
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
    );
  }
}
