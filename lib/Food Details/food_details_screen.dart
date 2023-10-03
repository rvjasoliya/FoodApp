import 'package:flutter/material.dart';
import 'package:food/Food%20Details/likecontainer.dart';
import 'package:food/Food_Planning/food_plan.dart';
import 'package:food/Theme/images.dart';
import 'package:line_icons/line_icons.dart';

import '../Theme/palette.dart';

class FoodDetailsScreen extends StatefulWidget {
  const FoodDetailsScreen({Key? key}) : super(key: key);

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 246, 249),
      // backgroundColor: Color.fromARGB(255, 212, 212, 216),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: h / 2.3,
                width: w,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImages.breakfast),
                      fit: BoxFit.cover),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: h / 33,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w / 50,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Palette.blackcolor,
                          size: 25,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Spacer(),
                      Text(
                        "Pancake Stack",
                        style: TextStyle(
                            color: Palette.whitebackground,
                            fontSize: w / 17,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Palette.red100,
                        child: Container(
                          // height: 42,
                          // width: 39,
                          decoration: BoxDecoration(
                            color: Palette.black45,
                            borderRadius: BorderRadius.circular(26),
                            image: const DecorationImage(
                              image: AssetImage(AppImages.edit),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: w / 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h / 4.5,
                  ),
                  const LikeContainer1(),
                  SizedBox(
                    height: h / 53,
                  ),
                  const TimeContainer(),
                  SizedBox(height: h / 55),
                  Row(
                    children: [
                      SizedBox(width: w / 25),
                      Text(
                        "Video",
                        style: TextStyle(
                            color: Palette.blackcolor,
                            fontSize: w / 15,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(height: h / 60),
                  Container(
                    height: h / 4,
                    width: w / 1.12,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(w / 22),
                        image: const DecorationImage(
                            image: AssetImage(AppImages.video),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(height: h / 45),
                  Row(
                    children: [
                      SizedBox(width: w / 25),
                      Text(
                        "Recipe Ingredients",
                        style: TextStyle(
                            color: Palette.blackcolor,
                            fontSize: w / 15,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(height: h / 45),
                  const RecipeIngredientsContainer(),
                  SizedBox(height: h / 45),
                  Row(
                    children: [
                      SizedBox(width: w / 25),
                      Text(
                        "Recipe Steps",
                        style: TextStyle(
                            color: Palette.blackcolor,
                            fontSize: w / 15,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(height: h / 45),
                  const RecipeSteps(),
                  Container(
                    height: h / 14,
                    width: w / 1.12,
                    decoration: BoxDecoration(
                      color: Palette.color255,
                      borderRadius: BorderRadius.circular(w / 22),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: h / 70,
                        ),
                        Text(
                          'See All Steps',
                          style: TextStyle(
                              color: Palette.redcolor, fontSize: w / 23),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: h / 35),
                  Container(
                    height: h / 15,
                    width: w / 1.12,
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
                        children: const [
                          Text(
                            "Add to Planner",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  side: const BorderSide(color: Colors.red)))),
                      onPressed: () {
                        Navigator.push((context), MaterialPageRoute(builder: (context) => Food_Planning()));
                      },
                    ),
                  ),
                ],
              ),
              const LikeIcon(), //Positioned ma che aetle like icon niche che coding ma
            ],
          ),
        ),
      ),
    );
  }
}
