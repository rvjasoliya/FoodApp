import 'package:flutter/material.dart';
import '../Theme/images.dart';
import '../Theme/palette.dart';

class SearchRecipes extends StatefulWidget {
  const SearchRecipes({Key? key}) : super(key: key);

  @override
  State<SearchRecipes> createState() => _SearchRecipesState();
}

class _SearchRecipesState extends State<SearchRecipes> {
  List foodName = ['Food1', 'Food2', 'Food3', 'Food4'];

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SizedBox(
      height: h / 2,
      child: ListView.builder(
        itemCount: foodName.length,
        itemExtent: h / 4.9,
        itemBuilder: (
          context,
          position,
        ) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                height: h / 5.3,
                width: w / 1.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w / 25),
                  image: const DecorationImage(
                    image: AssetImage(AppImages.food7),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          maxRadius: w / 20,
                          backgroundColor: Palette.color0005,
                          child: const Icon(
                            Icons.delete,
                            color: Palette.color255,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TitleText("${foodName[position]}"),
                        const Spacer(),
                        Container(
                          height: h / 9.5,
                          width: w / 1.9,
                          decoration: const BoxDecoration(
                            color: Palette.color231,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              topLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: h / 55),
                              Row(
                                children: [
                                  SizedBox(width: w / 14),
                                  KcalContainer(Palette.color240),
                                  SizedBox(width: w / 40),
                                  KcalText('1 kcal'),
                                  SizedBox(width: w / 10),
                                  KcalContainer(Palette.color255190),
                                  SizedBox(width: w / 40),
                                  KcalText('0 gms'),
                                ],
                              ),
                              SizedBox(height: h / 50),
                              Row(
                                children: [
                                  SizedBox(width: w / 14),
                                  KcalContainer(Palette.color131),
                                  SizedBox(width: w / 40),
                                  KcalText('1 gms'),
                                  SizedBox(width: w / 10),
                                  KcalContainer(Palette.color2551),
                                  SizedBox(width: w / 40),
                                  KcalText('0 gms'),
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
            ],
          );
        },
      ),
    );
  }

  Widget KcalText(var kcalText) {
    return Text(
      kcalText,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget TitleText(var titleText) {
    var w = MediaQuery.of(context).size.width;
    return Text(
      titleText,
      style: TextStyle(
          color: Palette.whitecolor,
          fontSize: w / 22,
          fontWeight: FontWeight.w800),
    );
  }

  Widget KcalContainer(Color containerColor) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      height: h / 38,
      width: w / 60,
      decoration: BoxDecoration(
          color: containerColor, borderRadius: BorderRadius.circular(10)),
    );
  }
}
