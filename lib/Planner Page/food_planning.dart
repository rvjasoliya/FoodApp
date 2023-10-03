import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';
import 'package:food/Recipe/addrecipe.dart';
import 'package:line_icons/line_icons.dart';

import '../Food_Planning/food_plan.dart';
import '../Theme/images.dart';
import '../Theme/palette.dart';

class planning extends StatefulWidget {
  planning(BuildContext context);

  @override
  State<planning> createState() => _planningState();
}

//
final _calendarControllerToday = AdvancedCalendarController.today();
final _calendarControllerCustom =
    AdvancedCalendarController.custom(DateTime(2021, 2, 16));
final List<DateTime> events = [
  DateTime.utc(2021, 08, 10, 12),
  DateTime.utc(2021, 08, 11, 12),
];

class _planningState extends State<planning> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Planner',
          style: TextStyle(
            color: Palette.blackcolor,
            fontWeight: FontWeight.w800,
            fontSize: w / 15,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: Palette.whitebackground,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Food_Planning()));
            },
            child: Container(
              height: h / 150,
              width: w / 7,
              decoration: BoxDecoration(
                color: Palette.red400,
                borderRadius: BorderRadius.circular(w / 30),
              ),
              child: const Center(
                child: Icon(
                  LineIcons.plus,
                  color: Palette.whitebackground,
                  size: 25,
                ),
              ),
            ),
          ),
          SizedBox(width: w / 30),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: h / 45,
              ),
              AdvancedCalendar(
                // onHorizontalDrag: (p0) => super,
                controller: _calendarControllerToday,
                events: events,
                startWeekDay: 1,
                weekLineHeight: h / 18,
                todayStyle: TextStyle(
                  color: Palette.blackcolor,
                  fontWeight: FontWeight.w800,
                  fontSize: w / 21,
                ),
                innerDot: true,
                dateStyle: TextStyle(
                  color: Palette.blackcolor,
                  fontWeight: FontWeight.w800,
                  fontSize: w / 21,
                ),
              ),
              SizedBox(
                height: h / 1.2,
                child: Column(
                  children: [
                    SizedBox(height: h / 26),
                    Row(
                      children: [
                        SizedBox(width: w / 20),
                        SizedBox(
                          height: h / 1.8,
                          child: Column(
                            children: [
                              CircleContainer(Palette.color251),
                              SizedBox(height: h / 55),
                              LongContainer(Palette.color251),
                              SizedBox(height: h / 40),
                              CircleContainer(Palette.color251),
                              SizedBox(height: h / 55),
                              LongContainer(Palette.color251),
                              SizedBox(height: h / 40),
                              CircleContainer(Palette.color242),
                              SizedBox(height: h / 55),
                              LongContainer(Palette.color242),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            SizedBox(
                              height: h / 1.56,
                              width: w / 1.2,
                              child: Column(
                                children: [
                                  //Food1
                                  SizedBox(height: h / 120),
                                  Container(
                                    height: h / 12.4,
                                    width: w / 1.3,
                                    color: Palette.whitebackground,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        FoodContainer(AppImages.food3),
                                        SizedBox(
                                          height: h / 25.5,
                                          width: w / 2.3,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  FoodTitle('Food Name'),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  FoodTime(
                                                      '08:00 PM to 08:15 PM'),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        FoodDeleteImage()
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: h / 100,
                                  ),
                                  Container(
                                    height: h / 15.4,
                                    width: w / 1.3,
                                    decoration: BoxDecoration(
                                      color: Palette.color192,
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(w / 32),
                                        bottomLeft: Radius.circular(w / 32),
                                        topLeft: Radius.circular(w / 32),
                                        topRight: Radius.circular(w / 100),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: w / 8,
                                          height: h / 30,
                                          child: Row(
                                            children: [
                                              KcalContainer(Palette.color240),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              FoodText('10Kcal'),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: w / 8,
                                          height: h / 30,
                                          child: Row(
                                            children: [
                                              KcalContainer(Palette.color131),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              FoodText('0gms'),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: w / 8,
                                          height: h / 30,
                                          child: Row(
                                            children: [
                                              KcalContainer(Palette.color2551),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              FoodText('25gms'),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: w / 8,
                                          height: h / 30,
                                          child: Row(
                                            children: [
                                              KcalContainer(
                                                  Palette.color255190),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              FoodText('25gms'),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //Food2
                                  SizedBox(
                                    height: h / 31,
                                  ),
                                  Container(
                                    height: h / 12.4,
                                    width: w / 1.3,
                                    color: Palette.whitebackground,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        FoodContainer(AppImages.food3),
                                        SizedBox(
                                          height: h / 25.5,
                                          width: w / 2.3,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  FoodTitle('Food Name'),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  FoodTime(
                                                      '08:00 PM to 08:15 PM'),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        FoodDeleteImage()
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: h / 100,
                                  ),
                                  Container(
                                    height: h / 15.4,
                                    width: w / 1.3,
                                    decoration: BoxDecoration(
                                      color: Palette.color192,
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(w / 32),
                                        bottomLeft: Radius.circular(w / 32),
                                        topLeft: Radius.circular(w / 32),
                                        topRight: Radius.circular(w / 100),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: w / 8,
                                          height: h / 30,
                                          child: Row(
                                            children: [
                                              KcalContainer(Palette.color240),
                                              const SizedBox(width: 5),
                                              FoodText('10Kcal'),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: w / 8,
                                          height: h / 30,
                                          child: Row(
                                            children: [
                                              KcalContainer(Palette.color131),
                                              const SizedBox(width: 5),
                                              FoodText('0gms'),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: w / 8,
                                          height: h / 30,
                                          child: Row(
                                            children: [
                                              KcalContainer(Palette.color2551),
                                              const SizedBox(width: 5),
                                              FoodText('25gms'),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: w / 8,
                                          height: h / 30,
                                          child: Row(
                                            children: [
                                              KcalContainer(
                                                  Palette.color255190),
                                              const SizedBox(width: 5),
                                              FoodText('25gms'),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //Food3
                                  SizedBox(
                                    height: h / 32,
                                  ),
                                  Container(
                                    height: h / 12.4,
                                    width: w / 1.3,
                                    color: Palette.whitebackground,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        FoodContainer(AppImages.food13),
                                        SizedBox(
                                          height: h / 25.5,
                                          width: w / 2.3,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  FoodTitle('Food Name'),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  FoodTime(
                                                      '08:00 PM to 08:15 PM'),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        FoodDeleteImage()
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: h / 100),
                                  Container(
                                    height: h / 15.4,
                                    width: w / 1.3,
                                    decoration: BoxDecoration(
                                      color: Palette.color192,
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(w / 32),
                                        bottomLeft: Radius.circular(w / 32),
                                        topLeft: Radius.circular(w / 32),
                                        topRight: Radius.circular(w / 100),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: h / 15.4,
                                          width: w / 1.3,
                                          decoration: BoxDecoration(
                                            color: Palette.color192,
                                            borderRadius: BorderRadius.only(
                                              bottomRight:
                                                  Radius.circular(w / 32),
                                              bottomLeft:
                                                  Radius.circular(w / 32),
                                              topLeft: Radius.circular(w / 32),
                                              topRight:
                                                  Radius.circular(w / 100),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              SizedBox(
                                                width: w / 7,
                                                height: h / 30,
                                                child: Row(
                                                  children: [
                                                    KcalContainer(
                                                        Palette.color0),
                                                    const SizedBox(width: 5),
                                                    FoodText('300 mg'),
                                                  ],
                                                ),
                                              ),
                                              const Text("1 Tab"),
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
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget KcalContainer(Color KcalColor) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(height: h / 40, width: w / 100, color: KcalColor);
  }

  Widget FoodContainer(var FoodImage) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
        height: h / 13.5,
        width: w / 6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: AssetImage(FoodImage), fit: BoxFit.cover)));
  }

  Widget FoodTitle(var FoodTitle) {
    var w = MediaQuery.of(context).size.width;
    return Text('$FoodTitle',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Palette.blackcolor,
            fontSize: w / 25));
  }

  Widget FoodTime(var FoodTime) {
    var w = MediaQuery.of(context).size.width;
    return Text('$FoodTime',
        style: TextStyle(color: Palette.grey, fontSize: w / 34));
  }

  Widget FoodDeleteImage() {
    var w = MediaQuery.of(context).size.width;
    return CircleAvatar(
        maxRadius: w / 19,
        backgroundColor: Palette.redcolor,
        child: CircleAvatar(
            maxRadius: w / 20,
            backgroundColor: Palette.whitebackground,
            child: const Icon(Icons.delete, color: Palette.grey)));
  }

  Widget CircleContainer(Color CircleColor) {
    return Container(
        height: 8,
        width: 8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: CircleColor));
  }

  Widget LongContainer(Color LongColor) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(height: h / 7.5, width: w / 130, color: LongColor);
  }

  Widget FoodText(var FoodText) {
    var w = MediaQuery.of(context).size.width;
    return Text("$FoodText", style: TextStyle(fontSize: w / 35));
  }
}
