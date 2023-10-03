import 'dart:ffi';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';
import 'package:food/Firebase/planner.dart';
import 'package:food/Food_Planning/medicine_plan.dart';
import 'package:food/Theme/images.dart';
import 'package:food/Theme/palette.dart';
import 'package:intl/intl.dart';

class Food_Planning extends StatefulWidget {
  @override
  State<Food_Planning> createState() => _Food_PlanningState();
}

//final _calendarControllerToday = AdvancedCalendarController.today();

final _calendarControllerCustom =
    AdvancedCalendarController.custom(DateTime(2021, 2, 16));
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

final List<int> alertOptins = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55];
final List<String> repeatOptions = [
  'Never',
  'Every Day',
  'Every Week',
  'Every 2 Weeks',
  'Every Month',
  'Every Year'
];

class _Food_PlanningState extends State<Food_Planning> {
  String? selectedValue;
  String? selectedValue1;
  var Minit = '5';
  var repeatValue = 0;

  @override
  Widget build(BuildContext context) {
    //   for(var i=1; i<=12; i++)
    //     {
    //     i<9 ? print("0${i}:00") : print(":${i}:00");
    // };
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
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Medicine_Planning()));
                  },
                  child: Container(
                    height: h / 10,
                    width: w / 1.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(w / 26),
                      color: Colors.grey,
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(AppImages.food14),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Pancake Stack",
                        style: TextStyle(
                          color: Palette.whitecolor,
                          fontWeight: FontWeight.w800,
                          fontSize: w / 22,
                          letterSpacing: 1,
                        ),
                      ),
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
            SizedBox(height: h / 65),
            Container(
              height: h / 2.3,
              padding: EdgeInsets.all(w / 35),
              child: Card(
                child: ListView(
                  children: <Widget>[
                    _buildDefaultRangeDatePickerWithValue(), // calander aayathi aave che
                  ],
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
            Container(
              height: h / 10.8,
              width: w / 1.08,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(w / 25),
                ),
                child: Row(
                  children: [
                    SizedBox(width: w / 11),
                    text(20, "Start Time"),
                    SizedBox(width: w / 4.3),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: const Expanded(
                          child: Text(
                            '00:00',
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
                          // if(selectedValue == null){
                          //   _showToast(context,"Please Select Date");
                          //   return;
                          // }
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
                            '00:00',
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
                          // if(selectedValue1 == null){
                          //   _showToast(context,"Please Select eeDate");
                          //   return;
                          // }
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
                    children: [
                      for (var repet = 0;
                          repet <= alertOptins.length - 1;
                          repet++)
                        Text("${alertOptins[repet]} Minutes"),
                    ],
                    onSelectedItemChanged: (value) {
                      setState(() {
                        // Minit = "${repeatOptions[value]}";
                        // if(Minit.isEmpty)
                        //   {
                        //     Minit="${alertOptins[0]} Minutes";
                        //     print(Minit);
                        //   }
                        Minit = "${alertOptins[value]}";
                        print(Minit);
                      });
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
                        color: Palette.whitecolor,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Palette.redcolor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            18,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      // if(rang1 == null || .){}
                      // else if(){}

                      DateTime? start;
                      DateTime? end;
                      print(_rangeDatePickerValueWithDefaultValue.length);
                      if (_rangeDatePickerValueWithDefaultValue.length > 0) {
                        // print(start);
                        start = _rangeDatePickerValueWithDefaultValue[0];
                      }
                      print(_rangeDatePickerValueWithDefaultValue.length);
                      if (_rangeDatePickerValueWithDefaultValue.length > 1) {
                        // print(end);
                        end = _rangeDatePickerValueWithDefaultValue[1];
                      } else {
                        // print(start);
                        end = start;
                      }
                      int? rang1 = start?.millisecondsSinceEpoch;
                      // print(rang1);
                      int? end1 = end?.millisecondsSinceEpoch;
                      // print(end1);

                      //Tostbar start code
                      if (start == null) {
                        if (selectedValue == null) {
                          if (selectedValue1 == null) {
                            _showToast(context, "Please Add Planner Details");
                          }
                        }
                      } else if (start == null) {
                        _showToast(context, "Please Select Date");
                      } else if (selectedValue == null) {
                        _showToast(context, "Please Select StartTime");
                      } else if (selectedValue1 == null) {
                        _showToast(context, "Please Select EndTime");
                      } else if (Minit == null) {
                        _showToast(context, "Please Select Alert Minutes");
                      }
                      //DateTime? rang= _rangeDatePickerValueWithDefaultValue as DateTime?;
                      // DateTime? end= _rangeDatePickerValueWithDefaultValue as DateTime?;

                      else {
                        // firebase data print code
                        FirebaseAuth auth = FirebaseAuth.instance;
                        AddPlanner(auth.currentUser!.uid.toString(), timestamp,
                            rang1, end1, selectedValue, selectedValue1, Minit);
                        // AddPlanner(auth.currentUser!.uid.toString(), today, rang!, end!, Minit);
                        //AddPlanner(_calendarControllerToday.value, selectedValue, selectedValue1, Minit, auth.currentUser!.uid.toString(),);
                      }
                    },
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
        fontSize: w / l,
      ),
    );
  }

  Widget CustomCard(var tx, Color ContColor, Color TextColor) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Card(
      child: InkWell(
        onTap: (){
          repeatValue == 0 ? Palette.redcolor : repeatValue == 1 ? Palette.redcolor : repeatValue == 2 ? Palette.redcolor :repeatValue == 3 ? Palette.redcolor:repeatValue == 4 ? Palette.redcolor:repeatValue == 5 ? Palette.redcolor :repeatValue;
        },

        child: Container(
          decoration: BoxDecoration(
            color: ContColor,
            borderRadius: BorderRadius.circular(w / 25),
          ),
          height: h / 17.6,
          width: w / 3.5,
          child: Center(
            child: Text(
              '$tx',
              style: TextStyle(
                color: TextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  //calander Widget code start

  List<DateTime?> _rangeDatePickerValueWithDefaultValue = [
    // DateTime(1999, 5, 6),
    // DateTime(1999, 5, 21),
  ];
  //var today = DateUtils.dateOnly(DateTime.now());
  int timestamp = DateTime.now().millisecondsSinceEpoch;

  String _getValueText(
    CalendarDatePicker2Type datePickerType,
    List<DateTime?> values,
  ) {
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    if (datePickerType == CalendarDatePicker2Type.multi) {
      valueText = values.isNotEmpty
          ? values
              .map((v) => v.toString().replaceAll('00:00:00.000', ''))
              .join(', ')
          : 'null';
    } else if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        var startDate = values[0].toString().replaceAll('00:00:00.000', '');
        var endDate = values.length > 1
            ? values[1].toString().replaceAll('00:00:00.000', '')
            : 'null';
        valueText = '$startDate to $endDate';
      } else {
        return 'null';
      }
    }
    return valueText;
  }

  Widget _buildDefaultRangeDatePickerWithValue() {
    var config = CalendarDatePicker2Config(
      calendarType: CalendarDatePicker2Type.range,
      selectedDayHighlightColor: Colors.red,
      weekdayLabelTextStyle: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      controlsTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CalendarDatePicker2(
          config: config,
          initialValue: _rangeDatePickerValueWithDefaultValue,
          onValueChanged: (values) =>
              setState(() => _rangeDatePickerValueWithDefaultValue = values),
        ),
      ],
    );
  }

  // Toastbar start
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
