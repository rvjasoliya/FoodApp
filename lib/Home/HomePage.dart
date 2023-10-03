import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food/Home/dailyrouting.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../Firebase/GetUser_Detail.dart';
import '../Theme/images.dart';
import '../Theme/palette.dart';
import '../profile/profile1.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List Time = ["8:00 AM", "9:00 AM", "9:30AM"];

  List<Map<String, dynamic>> Routing = [
    {
      "Time": "08:00 AM",
      "planner": [
        {"Foodimage": AppImages.food2, "Foodname": "Black Tea"},
        {"Foodimage": AppImages.food5, "Foodname": "Medicines"},
        {"Foodimage": AppImages.re6, "Foodname": "raj"}
      ],
    },
    {
      "Time": "09:00 AM",
      "planner": [
        {"Foodimage": AppImages.re3, "Foodname": "Vegetable"},
        {"Foodimage": AppImages.food5, "Foodname": "Medicines"}
      ]
    },
    {
      "Time": "10:00 AM",
      "planner": [
        {"Foodimage": AppImages.re5, "Foodname": "Salad"},
        {"Foodimage": AppImages.food5, "Foodname": "Medicines"}
      ]
    }
  ];
  void initState() {
    var _ = Userdetail();
    super.initState();
  }

  // List Menu = [AppImages.food2, AppImages.re3, AppImages.re5, AppImages.re6];
  // List Menuname = ["Black Tea", "Vegetable", "Salad", "RiseDish"];
  @override
  Widget build(BuildContext context) {
    // print(Routing.keys);
    // Routing.forEach((key, value) {
    //   // print(Routing[key]![0]["Foodimage"]);
    // });
    // print(Routing.keys);
    // Routing.forEach((key, value) {
    //   print(Routing[key]![0]["Foodimage"]);
    // });
    // print(Routing["08:00 AM"]);
    TimeOfDay? pickedTime = TimeOfDay.now();
    DateTime parsedTime =
        DateFormat.jm().parse(pickedTime.format(context).toString());
    String formattedTime = DateFormat('hh:mm').format(parsedTime);
    formattedTime = '$formattedTime ${parsedTime.hour > 12 ? "PM" : "AM"}';
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(w / 32),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Today',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: w / 13,
                        color: Palette.color023,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        // print("planning.....");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => profile1(context)));
                      },
                      child: Container(
                        height: h / 18,
                        width: w / 7.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(w / 25),
                          image: DecorationImage(
                            image:
                                NetworkImage("${userDetail?.Photo.toString()}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "22, Dec",
                      style: TextStyle(
                          fontSize: w / 24, color: Palette.color131146),
                    ),
                  ],
                ),
                SizedBox(
                  height: h / 55,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CirclePercantage(
                        '1450', 0.5, '725', 'Calories', Palette.color240),
                    CirclePercantage(
                        '17g', 0.9, '15g', 'Carbs', Palette.color2551),
                    CirclePercantage(
                        '200g', 0.75, '50g', 'Prortien', Palette.color131),
                    CirclePercantage(
                        '150g', 0.65, '90g', 'Fats', Palette.color255190),
                  ],
                ),
                SizedBox(
                  height: h / 35,
                ),
                Row(
                  children: [
                    Text(
                      'Daily',
                      style: TextStyle(fontSize: w / 17, letterSpacing: 2),
                    ),
                    Text(
                      ' Routing',
                      style: TextStyle(
                        fontSize: w / 17,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w700,
                        color: Palette.color023,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: h / 50,
                ),
                SizedBox(
                    height: h / 0.5,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      // NeverScrollableScrollPhysics(),
                      itemCount: Routing.length,
                      itemBuilder: (BuildContext context, int index) {
                        String key = Routing[index]['Time'];
                        return Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: h / 100,
                                  width: w / 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Palette.redcolor,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "${key}",
                                    style: TextStyle(
                                        fontSize: w / 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            for (int i = 0;
                                i < Routing[index]['planner'].length;
                                i++)
                              Row(
                                children: [
                                  SizedBox(
                                    width: w / 50,
                                  ),
                                  Container(
                                    height: h / 4,
                                    width: w / 150,
                                    color: Colors.green,
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: h / 4.2,
                                    width: w / 1.16,
                                    decoration: BoxDecoration(
                                      color: Palette.color229,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Row(
                                      children: [
                                        const Expanded(
                                            child: Padding(
                                          padding: EdgeInsets.only(top: 15),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional.topCenter,
                                            child: Icon(
                                              Icons.access_time,
                                              color: Palette.color0,
                                              size: 17,
                                            ),
                                          ),
                                        )),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              right: 15, bottom: 20),
                                          height: h / 4,
                                          width: w / 1.5,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: DecorationImage(
                                              image: AssetImage(Routing[index]
                                                  ['planner'][i]["Foodimage"]),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: h / 20,
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: w / 8),
                                                  child: Text(
                                                    Routing[index]['planner'][i]
                                                        ["Foodname"],
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        color: Palette.color255,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: w / 25),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: h / 140,
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: w / 8),
                                                  child: Text(
                                                    "08:00 AM to 08:15 AM",
                                                    style: TextStyle(
                                                        color: Palette.color255,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: w / 35),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: h / 58,
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(13),
                                                height: h / 10,
                                                width: w / 2,
                                                decoration: BoxDecoration(
                                                    color: Palette.color2557,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        KcalContainer(
                                                            Palette.color240),
                                                        SizedBox(width: w / 40),
                                                        KcalText('1 kcal'),
                                                        SizedBox(width: w / 10),
                                                        KcalContainer(
                                                            Palette.color2551),
                                                        SizedBox(width: w / 40),
                                                        KcalText('0 kcal'),
                                                      ],
                                                    ),
                                                    SizedBox(height: h / 73.5),
                                                    Row(
                                                      children: [
                                                        KcalContainer(
                                                            Palette.color131),
                                                        SizedBox(width: w / 40),
                                                        KcalText('1 kcal'),
                                                        SizedBox(width: w / 10),
                                                        KcalContainer(Palette
                                                            .color255190),
                                                        SizedBox(width: w / 40),
                                                        KcalText('0 kcal'),
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
                                ],
                              ),
                          ],
                        );
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget CirclePercantage(var MiddelName, var Percantage, var BottomName,
      var CircleName, Color CircleColor) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      height: h / 6.3,
      width: w / 4.8,
      decoration: BoxDecoration(
          color: Palette.color229, borderRadius: BorderRadius.circular(w / 8)),
      child: Column(
        children: [
          SizedBox(
            height: h / 145,
          ),
          CircularPercentIndicator(
            radius: w / 12,
            lineWidth: 5,
            animation: true,
            percent: Percantage,
            center: Text(
              "$MiddelName",
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: CircleColor,
          ),
          SizedBox(
            height: h / 125,
          ),
          Text(
            '$BottomName',
            style: const TextStyle(
                color: Palette.color023, fontWeight: FontWeight.bold),
          ),
          Text(
            '$CircleName',
            style: TextStyle(
              fontSize: w / 33,
              color: Palette.color023,
            ),
          ),
        ],
      ),
    );
  }

  Widget KcalContainer(Color KcalColor) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      height: h / 38,
      width: w / 60,
      decoration: BoxDecoration(
        color: KcalColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget KcalText(var KcalText) {
    return Text(
      '$KcalText',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget tex(var text) {
    var w = MediaQuery.of(context).size.width;
    return Text(
      text,
      style: TextStyle(
        fontSize: w / 20,
        letterSpacing: 1,
        fontWeight: FontWeight.w700,
        color: Palette.color023,
      ),
    );
  }
}
