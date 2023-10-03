import 'package:flutter/material.dart';

import '../Theme/palette.dart';

class colorscreen extends StatefulWidget {
  colorscreen({Key? key}) : super(key: key);

  @override
  State<colorscreen> createState() => _colorscreenState();
}

List ListText = [
  'Calories',
  'Protiens',
  'Carbs',
  'Fats',
  'Medicine',
  'Meat',
  'Vegies'
];
List ListColor = [
  Palette.color240,
  Palette.color131,
  Palette.color2551,
  Palette.color255190,
  Palette.color242,
  Palette.color251,
  Palette.color39
];

class _colorscreenState extends State<colorscreen> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Colors",
          style: TextStyle(
              color: Palette.blackcolor,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Palette.blackcolor,
            size: 25,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Palette.background,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: h,
              width: w / 1.1,
              child: ListView.builder(
                itemCount: ListText.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 57,
                            width: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ListColor[index],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            ListText[index],
                            style: const TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
