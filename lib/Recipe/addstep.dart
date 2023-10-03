import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

import '../Firebase/Steps.dart';
import '../Theme/palette.dart';
import '../other/Controller.dart';

class addstep extends StatefulWidget {
  addstep(BuildContext context);

  @override
  State<addstep> createState() => _addstepState();
}

var c = Controller();

class _addstepState extends State<addstep> {
  TextEditingController nameController = TextEditingController();
  DateTime _dateTime = DateTime.now();
  var StepHour;
  var StepMinutes;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Steps'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Palette.blackcolor,
          fontWeight: FontWeight.bold,
          fontSize: w / 23,
        ),
        backgroundColor: Palette.whitebackground,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Palette.blackcolor,
            size: w / 21,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: h / 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: h / 1.4,
                width: w / 1.15,
                padding: EdgeInsets.all(w / 28),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w / 22),
                  color: Palette.whitebackground,
                ),
                child: Column(
                  children: [
                    SizedBox(height: h / 110),
                    TextField(
                      controller: c.EnterStep,
                      decoration: InputDecoration(
                        labelText: 'Enter Step Title',
                        labelStyle: TextStyle(
                          color: Palette.grey,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          fontSize: w / 20,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                    SizedBox(height: h / 85),
                    const Divider(
                      color: Palette.grey,
                      thickness: 0.4,
                    ),
                    SizedBox(height: h / 45),
                    Container(
                      height: h / 4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: h / 4.2,
                            width: w / 3,
                            child: CupertinoPicker(
                              children: [
                                for (var Hour = 0; Hour <= 12; Hour++)
                                  (Hour <= 9
                                      ? Text("0${Hour}")
                                      : Text("${Hour}")),
                              ],
                              onSelectedItemChanged: (value) {
                                setState(() {
                                  StepHour = value;
                                });
                              },
                              itemExtent: h / 25,
                              magnification: 1,
                              diameterRatio: 1,
                              squeeze: 1.3,
                            ),
                          ),
                          Text(
                            "h",
                            style: TextStyle(
                              color: Palette.grey,
                              fontSize: w / 20,
                            ),
                          ),
                          Container(
                            height: h / 4.2,
                            width: w / 3,
                            child: CupertinoPicker(
                              children: [
                                for (var Minutes = 1; Minutes <= 60; Minutes++)
                                  (Minutes <= 9
                                      ? Text("0${Minutes}")
                                      : Text("${Minutes}")),
                              ],
                              onSelectedItemChanged: (value) {
                                StepMinutes = value;
                              },
                              itemExtent: h / 25,
                              magnification: 1,
                              diameterRatio: 1,
                              squeeze: 1.3,
                            ),
                          ),
                          Text(
                            "m",
                            style: TextStyle(
                              color: Palette.grey,
                              fontSize: w / 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: h / 45),
                    Row(
                      children: [
                        SizedBox(width: w / 29),
                        TitleText('Description'),
                      ],
                    ),
                    SizedBox(
                      height: h / 5.6,
                      width: w / 1.2,
                      child: TextFormField(
                        controller: c.StepDecription,
                        minLines: 5,
                        maxLines: 20,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          hintText: 'Enter Step Description here...',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: h / 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: w / 2.7,
                height: h / 16,
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
                          borderRadius: BorderRadius.circular(h / 2),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => edit_profile(context)));
                    }),
              ),
              SizedBox(
                width: w / 2.6,
                height: h / 16,
                child: ElevatedButton(
                  child: const Text(
                    "Add",
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
                        borderRadius: BorderRadius.circular(h / 2),
                      ),
                    ),
                  ),
                  onPressed: () {
                    // FirebaseAuth auth = FirebaseAuth.instance;
                    // String Recipeid = auth.currentUser!.uid.toString();
                    // Future<DocumentSnapshot<Map<String, dynamic>>> k =
                    //     FirebaseFirestore.instance
                    //         .collection("Recipes")
                    //         .doc("id")
                    //         .get();
                    CollectionReference Recipes =
                        FirebaseFirestore.instance.collection('Recipes');

                    FirebaseAuth auth = FirebaseAuth.instance;
                    String Recipeid = auth.currentUser!.uid.toString();

                    String Rcipeid = Recipes.doc().id;

                    //2
                    // print(Recipeid);

                    AddSteps(
                      Recipeid,
                      c.EnterStep.text,
                      StepHour,
                      StepMinutes,
                      c.StepDecription.text,
                    );
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => edit_profile(context)));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget hourMinute15Interval() {
    return TimePickerSpinner(
      spacing: 40,
      is24HourMode: false,
      isForce2Digits: true,
      time: DateTime.now(),
      highlightedTextStyle:
          const TextStyle(fontWeight: FontWeight.w600, fontSize: 27),
      normalTextStyle: const TextStyle(color: Palette.grey, fontSize: 20),
      minutesInterval: 1,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }

  Widget TitleText(var TitleText) {
    var w = MediaQuery.of(context).size.width;
    return Text(
      TitleText,
      style: TextStyle(
        fontSize: w / 25,
        fontWeight: FontWeight.bold,
        color: Palette.blackcolor,
      ),
    );
  }
}

// User Detaile Login Time Signup Time
// User? user = FirebaseAuth.instance.currentUser;
