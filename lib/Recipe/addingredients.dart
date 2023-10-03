import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/Theme/palette.dart';
import 'package:line_icons/line_icons.dart';

class adding extends StatefulWidget {
  adding(BuildContext context);

  @override
  State<adding> createState() => _addingState();
}

class _addingState extends State<adding> {
  TextEditingController nameController = TextEditingController();
  final List<String> items = [
    'Cubs',
    'Bottle',
    'piece',
    'cup',
    'tablespoon',
    'can',
    'serving',
  ];
  final List<String> items1 = [
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
  ];
  String? selectedValue;
  String? selectedValue1;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add ingredients'),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              SizedBox(
                height: h / 40,
              ),
              Row(
                children: [
                  SizedBox(
                    width: w / 1.1,
                    child: TextField(
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                      cursorColor: Palette.black45,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                          fontSize: w / 25,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(w / 5),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Palette.grey,
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.all(w / 20),
                        fillColor: const Color.fromRGBO(244, 244, 244, 1),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h / 45,
              ),
              SizedBox(
                height: h,
                width: w,
                child: ExpandableTheme(
                  data: const ExpandableThemeData(
                    iconColor: Palette.blackcolor,
                    useInkWell: true,
                  ),
                  child: ListView.builder(
                    itemCount: 6,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return ExpandableNotifier(
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              ScrollOnExpand(
                                scrollOnExpand: true,
                                scrollOnCollapse: false,
                                child: ExpandablePanel(
                                  header: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                            left: 12, top: 10),
                                        height: h / 12,
                                        decoration: BoxDecoration(
                                          color: Palette.whitebackground,
                                          borderRadius:
                                              BorderRadius.circular(w / 30),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: h / 14,
                                              width: w / 6,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        w / 23),
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/food6.png'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: w / 15,
                                            ),
                                            Text(
                                              "Purpose Flour",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: w / 25,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  collapsed: const Text(
                                    "",
                                  ),
                                  expanded: Container(
                                    padding: EdgeInsets.only(
                                        left: w / 20, right: w / 20, top: 5),
                                    height: h / 5.3,
                                    child: Column(
                                      children: [
                                        const Divider(
                                          color:
                                              Color.fromRGBO(219, 225, 234, 1),
                                          thickness: 1.5,
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              "Quantity",
                                              style: TextStyle(
                                                color: Palette.blackcolor,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 1,
                                              ),
                                            ),
                                            SizedBox(
                                              width: w / 30,
                                            ),
                                            DropdownButtonHideUnderline(
                                              child: DropdownButton2(
                                                isExpanded: true,
                                                hint: const Expanded(
                                                  child: Text(
                                                    'Cubs',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Palette.grey,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                items: items
                                                    .map((item) =>
                                                        DropdownMenuItem<
                                                            String>(
                                                          value: item,
                                                          child: Text(
                                                            item,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 15,
                                                              color: Palette
                                                                  .blackcolor,
                                                            ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ))
                                                    .toList(),
                                                value: selectedValue,
                                                onChanged: (value) {
                                                  setState(() {
                                                    selectedValue =
                                                        value as String;
                                                  });
                                                },
                                                icon: const Icon(
                                                  Icons.arrow_drop_down,
                                                ),
                                                iconSize: 14,
                                                iconEnabledColor: Palette.grey,
                                                iconDisabledColor: Colors.grey,
                                                buttonHeight: h / 20,
                                                buttonWidth: w / 4.2,
                                                buttonPadding:
                                                    const EdgeInsets.only(
                                                        left: 15, right: 14),
                                                buttonDecoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                  color: Palette.whitecolor,
                                                ),
                                                buttonElevation: 2,
                                                itemHeight: 35,
                                                itemPadding:
                                                    const EdgeInsets.only(
                                                        left: 14, right: 14),
                                                dropdownMaxHeight: 200,
                                                dropdownWidth: 150,
                                                dropdownPadding: null,
                                                selectedItemHighlightColor:
                                                    Colors.grey.shade100,
                                                dropdownDecoration:
                                                    BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Palette.whitecolor,
                                                ),
                                              ),
                                            ),
                                            const Spacer(),
                                            DropdownButtonHideUnderline(
                                              child: DropdownButton2(
                                                underline: const SizedBox(),
                                                isExpanded: true,
                                                hint: const Expanded(
                                                  child: Text(
                                                    '00',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Palette.grey,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                items: items1
                                                    .map((item) =>
                                                        DropdownMenuItem<
                                                            String>(
                                                          value: item,
                                                          child: Text(
                                                            item,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 15,
                                                              color: Palette
                                                                  .blackcolor,
                                                            ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ))
                                                    .toList(),
                                                value: selectedValue1,
                                                onChanged: (value) {
                                                  setState(() {
                                                    selectedValue1 =
                                                        value as String;
                                                  });
                                                },
                                                icon: const Icon(
                                                    Icons.arrow_drop_down),
                                                iconSize: 14,
                                                iconEnabledColor: Palette.grey,
                                                iconDisabledColor: Colors.grey,
                                                buttonHeight: h / 20,
                                                buttonWidth: w / 4.2,
                                                buttonPadding:
                                                    const EdgeInsets.only(
                                                        left: 15, right: 14),
                                                buttonDecoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                  color: Palette.whitecolor,
                                                ),
                                                buttonElevation: 2,
                                                itemHeight: 35,
                                                itemPadding:
                                                    const EdgeInsets.only(
                                                        left: 14, right: 14),
                                                dropdownMaxHeight: 200,
                                                dropdownWidth: 150,
                                                dropdownPadding: null,
                                                selectedItemHighlightColor:
                                                    Colors.grey.shade100,
                                                dropdownDecoration:
                                                    BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Palette.whitecolor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: h / 35,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: w / 2.7,
                                              height: h / 16,
                                              child: ElevatedButton(
                                                  child: const Text(
                                                    "Cancel",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Palette.blackcolor,
                                                    ),
                                                  ),
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                      const Color.fromRGBO(
                                                          245, 245, 248, 1),
                                                    ),
                                                    shape: MaterialStateProperty
                                                        .all<
                                                            RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      h / 2)),
                                                    ),
                                                  ),
                                                  onPressed: () {
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Palette.whitecolor,
                                                    ),
                                                  ),
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(Palette
                                                                .redcolor),
                                                    shape: MaterialStateProperty
                                                        .all<
                                                            RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    h / 2),
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    // Navigator.push(
                                                    //     context,
                                                    //     MaterialPageRoute(
                                                    //         builder: (context) => edit_profile(context)));
                                                  }),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
