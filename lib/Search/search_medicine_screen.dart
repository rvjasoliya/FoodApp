import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:food/Theme/images.dart';
import 'package:food/Theme/palette.dart';

class SearchMedicineScreen extends StatefulWidget {
  const SearchMedicineScreen({Key? key}) : super(key: key);

  @override
  State<SearchMedicineScreen> createState() => _SearchMedicineScreenState();
}

class _SearchMedicineScreenState extends State<SearchMedicineScreen> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        children: [
          SizedBox(height: h / 60),
          Container(
            // padding: EdgeInsets.all(10),
            height: h / 7.3,
            width: w / 1.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(w / 15),
              image: const DecorationImage(
                  image: AssetImage(AppImages.food10), fit: BoxFit.cover),
            ),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Column(
                  children: [
                    SizedBox(height: h / 25),
                    Row(
                      children: [
                        SizedBox(width: w / 30),
                        TitleText("Tylenol"),
                        const Spacer(),
                        Container(
                          height: h / 20,
                          width: w / 4,
                          decoration: BoxDecoration(
                            color: Palette.color229,
                            borderRadius: BorderRadius.circular(w / 25),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Containe(Palette.color0),
                              ContainerText("300 Gms"),
                            ],
                          ),
                        ),
                        SizedBox(width: w / 25),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget TitleText(var titleText) {
    var w = MediaQuery.of(context).size.width;
    return SizedBox(
      width: w / 4,
      child: Text(
        titleText,
        style: TextStyle(
            color: Palette.whitecolor,
            fontSize: w / 17.5,
            fontWeight: FontWeight.w800),
      ),
    );
  }

  Widget Containe(Color ContainerColor) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Container(
        height: h / 38,
        width: w / 70,
        decoration: BoxDecoration(
            color: ContainerColor,
            borderRadius: BorderRadius.circular(w / 25)));
  }
  Widget ContainerText(var ContainerText){
    var w = MediaQuery.of(context).size.width;
    return Text(
      ContainerText,
      style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: w / 30),
    );
  }
}
