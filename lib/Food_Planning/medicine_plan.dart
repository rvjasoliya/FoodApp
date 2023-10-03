// ignore_for_file: non_constant_identifier_names

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';
import 'package:food/Theme/images.dart';
import 'package:food/Theme/palette.dart';

class Medicine_Planning extends StatefulWidget {
  @override
  State<Medicine_Planning> createState() => _Medicine_PlanningState();
}

final _calendarControllerToday = AdvancedCalendarController.today();
final _calendarControllerCustom =
    AdvancedCalendarController.custom(DateTime(2021, 2, 16));
final List<DateTime> events = [
  DateTime.utc(2021, 08, 10, 12),
  DateTime.utc(2021, 08, 11, 12),
];

final List<String> items = [
  '01:00',
  '02:00',
  '03:00',
  '04:00',
  '05:00',
  '06:00',
  '07:00',
  '08:00',
  '09:00',
  '10:00',
  '11:00',
  '12:00',
];
final List<String> items1 = [
  '01:00',
  '02:00',
  '03:00',
  '04:00',
  '05:00',
  '06:00',
  '07:00',
  '08:00',
  '09:00',
  '10:00',
  '11:00',
  '12:00',
];
String? selectedValue;
String? selectedValue1;

class _Medicine_PlanningState extends State<Medicine_Planning> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add To Planner"),
        titleTextStyle: TextStyle(
            color: Palette.blackcolor,
            fontWeight: FontWeight.w700,
            fontSize: w / 22),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Palette.blackcolor,
            size: w / 17,
          ),
        ),
        backgroundColor: Palette.whitebackground,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: h / 42,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: h / 10,
                  width: w / 1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(w / 26),
                    color: Colors.grey,
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(AppImages.food15),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Tylenol",
                          style: TextStyle(
                            color: Palette.whitecolor,
                            fontWeight: FontWeight.w800,
                            fontSize: w / 22,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "650 gms, 1 Tab",
                          style: TextStyle(
                            color: Palette.grey500,
                            fontWeight: FontWeight.w800,
                            fontSize: w / 38,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: h / 45),
            Row(
              children: [
                SizedBox(width: w / 25),
                text(20, 'Select Date'),
              ],
            ),
            SizedBox(height: h / 45),
            Container(
              padding: EdgeInsets.all(w / 35),
              child: Card(
                child: AdvancedCalendar(
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
              ),
            ),
            SizedBox(height: h / 45),
            Row(
              children: [
                SizedBox(
                  width: w / 23,
                ),
                text(20, "Select Time")
              ],
            ),
            SizedBox(height: h / 45),
            SizedBox(
              height: h / 10.8,
              width: w / 1.08,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(w / 25),
                ),
                child: Row(
                  children: [
                    SizedBox(width: w / 11),
                    text(20, "Select Time"),
                    SizedBox(width: w / 5),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: const Expanded(
                          child: Text(
                            '09:00',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Palette.blackcolor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        items: items
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Palette.blackcolor,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value as String;
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          size: 20,
                          color: Palette.blackcolor,
                        ),
                        iconEnabledColor: Palette.grey,
                        iconDisabledColor: Colors.grey,
                        buttonHeight: h / 20,
                        buttonWidth: w / 4.2,
                        buttonPadding:
                            const EdgeInsets.only(left: 10, right: 10),
                        buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Palette.whitecolor,
                        ),
                        buttonElevation: 2,
                        itemHeight: 35,
                        itemPadding: const EdgeInsets.only(left: 14, right: 14),
                        dropdownMaxHeight: 200,
                        dropdownWidth: 150,
                        dropdownPadding: null,
                        selectedItemHighlightColor: Colors.grey.shade100,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Palette.whitecolor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: h / 45),
            SizedBox(
              height: h / 10.8,
              width: w / 1.08,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(w / 25),
                ),
                child: Row(
                  children: [
                    SizedBox(width: w / 10),
                    text(20, "End Time"),
                    SizedBox(width: w / 3.9),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: const Expanded(
                          child: Text(
                            '09:00',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Palette.blackcolor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        items: items1
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Palette.blackcolor,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        value: selectedValue1,
                        onChanged: (value) {
                          setState(() {
                            selectedValue1 = value as String;
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          size: 20,
                          color: Palette.blackcolor,
                        ),
                        iconEnabledColor: Palette.grey,
                        iconDisabledColor: Colors.grey,
                        buttonHeight: h / 20,
                        buttonWidth: w / 4.2,
                        buttonPadding:
                            const EdgeInsets.only(left: 10, right: 10),
                        buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Palette.whitecolor,
                        ),
                        buttonElevation: 2,
                        itemHeight: 35,
                        itemPadding: const EdgeInsets.only(left: 14, right: 14),
                        dropdownMaxHeight: 200,
                        dropdownWidth: 150,
                        dropdownPadding: null,
                        selectedItemHighlightColor: Colors.grey.shade100,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Palette.whitecolor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: h / 45),
            Row(
              children: [
                SizedBox(width: w / 25),
                text(20, "Repeat"),
                Text(
                  ' (options)',
                  style: TextStyle(color: Palette.grey, fontSize: w / 25),
                ),
              ],
            ),
            SizedBox(height: h / 45),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomCard('Never', Palette.redcolor, Palette.whitecolor),
                CustomCard('Every Day', Palette.whitecolor, Palette.blackcolor),
                CustomCard(
                    'Every Week', Palette.whitecolor, Palette.blackcolor),
              ],
            ),
            SizedBox(height: h / 75),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomCard(
                    'Every 2 Weeks', Palette.whitecolor, Palette.blackcolor),
                CustomCard(
                    'Every Month', Palette.whitecolor, Palette.blackcolor),
                CustomCard(
                    'Every Year', Palette.whitecolor, Palette.blackcolor),
              ],
            ),
            SizedBox(height: h / 40),
            Row(
              children: [
                SizedBox(width: w / 25),
                text(20, "Alert"),
                Text(
                  ' (options)',
                  style: TextStyle(color: Palette.grey, fontSize: w / 25),
                ),
              ],
            ),
            SizedBox(height: h / 40),
            Card(
              child: Container(
                height: h / 3.3,
                width: w / 1.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w / 20),
                  color: Palette.whitebackground,
                ),
                child: CupertinoPicker(
                    children: const [
                      Text("5 Minutes"),
                      Text("10 Minutes"),
                      Text("15 Minutes"),
                      Text("20 Minutes"),
                      Text("25 Minutes"),
                      Text("30 Minutes"),
                      Text("35 Minutes"),
                      Text("40 Minutes"),
                      Text("45 Minutes"),
                      Text("50 Minutes"),
                      Text("55 Minutes")
                    ],
                    onSelectedItemChanged: (value) {
                      // print(value);
                    },
                    itemExtent: h / 25,
                    magnification: 1,
                    diameterRatio: 1,
                    squeeze: 1.3),
              ),
            ),
            SizedBox(height: h / 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: w / 2.4,
                  height: h / 15.3,
                  child: ElevatedButton(
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Palette.blackcolor,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(245, 245, 248, 1),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            18,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(
                  width: w / 2.4,
                  height: h / 15.3,
                  child: ElevatedButton(
                    child: const Text(
                      "Set",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Palette.whitecolor),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Palette.redcolor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SizedBox(height: h / 24),
          ],
        ),
      ),
    );
  }

  Widget text(var l, var text) {
    var w = MediaQuery.of(context).size.width;
    return Text(
      "$text",
      style: TextStyle(
          color: Palette.blackcolor,
          fontWeight: FontWeight.w700,
          fontSize: w / l),
    );
  }

  Widget CustomCard(var tx, Color ContColor, Color TextColor) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Card(
      child: Container(
        decoration: BoxDecoration(
            color: ContColor, borderRadius: BorderRadius.circular(w / 25)),
        height: h / 17.6,
        width: w / 3.5,
        child: Center(
          child: Text(
            '$tx',
            style: TextStyle(color: TextColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
