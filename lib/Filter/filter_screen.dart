import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food/other/Controller.dart';
import '../Theme/palette.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String? CuisineSelected;
  String? DietSelected;
  TextEditingController carb = TextEditingController();

  final List<String> CuisineItems = [
    'Italian',
    'Indian',
    'Mexican',
    'Middle Eastern',
    'American',
    'Punjabi',
  ];
  final List<String> DietItems = [
    'Vegetarian',
    'Carbs',
    'Protein',
    'Caloris',
    'American',
    'Punjabi',
  ];

  var c = Controller();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Filter",
          style: TextStyle(
              color: Palette.blackcolor,
              fontSize: 20,
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                // Diet
                //
                Card(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 2,
                  child: Container(
                    height: h / 3.5,
                    width: w,
                    color: Colors.white,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Textt('Cuisine'),
                        ),
                        Row(
                          children: [
                            Container(
                              height: h / 15,
                              width: w / 1.28,
                              margin: const EdgeInsets.all(15),
                              color: Palette.whitecolor,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  isExpanded: true,
                                  hint: const Expanded(
                                    child: Text(
                                      'Choose',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Palette.grey,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  items: CuisineItems.map(
                                      (item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 15,
                                                color: Palette.blackcolor,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )).toList(),
                                  value: CuisineSelected,
                                  onChanged: (value) {
                                    setState(() {
                                      CuisineSelected = value as String;
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
                                  buttonPadding: const EdgeInsets.only(
                                      left: 15, right: 14),
                                  buttonDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Palette.whitecolor,
                                  ),
                                  buttonElevation: 2,
                                  itemHeight: 35,
                                  itemPadding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  dropdownMaxHeight: 200,
                                  dropdownWidth: 150,
                                  dropdownPadding: null,
                                  selectedItemHighlightColor:
                                      Colors.grey.shade100,
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Palette.whitecolor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: h / 100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FilterContainer(' Italian'),
                              FilterContainer(' Indian'),
                              FilterContainer('Mexican')
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Row(
                            children: [FilterContainer(' Italian')],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Textt('Diet'),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Container(
                      height: h / 15,
                      width: w / 1.28,
                      margin: const EdgeInsets.all(15),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: const Expanded(
                            child: Text(
                              'Choose',
                              style: TextStyle(
                                fontSize: 17,
                                color: Palette.grey,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          items:
                              DietItems.map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Palette.blackcolor,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )).toList(),
                          value: DietSelected,
                          onChanged: (value) {
                            setState(() {
                              DietSelected = value as String;
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
                              const EdgeInsets.only(left: 15, right: 14),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Palette.whitecolor,
                          ),
                          buttonElevation: 2,
                          itemHeight: 35,
                          itemPadding:
                              const EdgeInsets.only(left: 14, right: 14),
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
                    ),
                  ],
                ),
                //
                // 1 Carbs
                //
                Size(),
                Textt('Carbs'),
                Size(),
                Row(
                  children: [
                    MinTextField('Min', '01', c.Carbs_Min),
                    const Spacer(),
                    MaxTextField('Max', '10', c.Carbs_Max),
                  ],
                ),
                //
                // 2 Protein
                //
                Size(),
                Textt('Protein'),
                Size(),
                Row(
                  children: [
                    MinTextField('Min', '01', c.Protein_Min),
                    const Spacer(),
                    MaxTextField('Max', '09', c.Protein_Max),
                  ],
                ),
                //
                // 3 Calories
                //
                Size(),
                Textt('Calories'),
                Size(),
                Row(
                  children: [
                    MinTextField('Min', '50', c.Calories_Min),
                    const Spacer(),
                    MaxTextField('Max', '150', c.Calories_Max),
                  ],
                ),
                //
                // 4 Fat
                //
                Size(),
                Textt('Fat'),
                Size(),
                Row(
                  children: [
                    MinTextField('Min', '01', c.Fat_Min),
                    const Spacer(),
                    MaxTextField('Max', '10', c.Fat_Max),
                  ],
                ),
                //
                // 5 Calcium
                //
                Size(),
                Textt('Calcium'),
                Size(),
                Row(
                  children: [
                    MinTextField('Min', '10', c.Calcium_Min),
                    const Spacer(),
                    MaxTextField('Max', '100', c.Calcium_Max),
                  ],
                ),
                //
                // 6 Cholesterols
                //
                Size(), Textt('Cholesterols'),
                Size(),
                Row(
                  children: [
                    MinTextField('Min', '01', c.Cholesterols_Min),
                    const Spacer(),
                    MaxTextField('Max', '10', c.Cholesterols_Max),
                  ],
                ),
                //
                // 7 Fluoride
                //
                Size(), Textt('Fluoride'),
                Size(),
                Row(
                  children: [
                    MinTextField('Min', '01', c.Fluoride_Min),
                    const Spacer(),
                    MaxTextField('Max', '10', c.Fluoride_Max),
                  ],
                ),
                //
                // 8 Fiber
                //
                Size(),
                Textt('Fiber'),
                Size(),
                Row(
                  children: [
                    MinTextField('Min', '01', c.Fiber_Min),
                    const Spacer(),
                    MaxTextField('Max', '10', c.Fiber_Max),
                  ],
                ),
                //
                // 9 Folicacid
                //
                SizedBox(height: h / 40),
                Textt('Folicacid'),
                SizedBox(height: h / 40),
                Row(
                  children: [
                    MinTextField('Min', '01', c.Folicacid_Min),
                    const Spacer(),
                    MaxTextField('Max', '10', c.Folicacid_Max),
                  ],
                ),
                //
                // 10 Lodine
                //
                Size(),
                Textt('Lodine'),
                Size(),
                Row(
                  children: [
                    MinTextField('Min', '01', c.Lodine_Min),
                    const Spacer(),
                    MaxTextField('Max', '10', c.Lodine_Max),
                  ],
                ),
                //
                // 11 Magnesium
                //
                Size(),
                Textt('Magnesium'),
                Size(),
                Row(
                  children: [
                    MinTextField('Min', '01', c.Magnesium_Min),
                    const Spacer(),
                    MaxTextField('Max', '10', c.Magnesium_Max),
                  ],
                ),
                //
                // 12 Phosphorus
                //
                Size(),
                Textt('Phosphorus'),
                Size(),
                Row(
                  children: [
                    MinTextField('Min', '01', c.Phosphorus_Min),
                    const Spacer(),
                    MaxTextField('Max', '10', c.Phosphorus_Max),
                  ],
                ),
                //
                // 13 Potassium
                //
                Size(),
                Textt('Potassium'),
                Size(),
                Row(
                  children: [
                    MinTextField('Min', '01', c.Potassium_Min),
                    const Spacer(),
                    MaxTextField('Max', '10', c.Potassium_Max),
                  ],
                ),
                //
                // 14 Sodium
                //
                Size(),
                Textt('Sodium'),
                Size(),
                Row(
                  children: [
                    MinTextField('Min', '01', c.Sodium_Min),
                    const Spacer(),
                    MaxTextField('Max', '10', c.Sodium_Max),
                  ],
                ),
                //
                // 15 Sugar
                //
                Size(),
                Textt('Sugar'),
                Size(),
                Row(
                  children: [
                    MinTextField('Min', '01', c.Sugar_Min),
                    const Spacer(),
                    MaxTextField('Max', '10', c.Sugar_Max),
                  ],
                ),
                //
                // 16 Zinc
                //
                Size(),
                Textt('Zinc'),
                Size(),
                Row(
                  children: [
                    MinTextField('Min', '01', c.Zinc_Min),
                    const Spacer(),
                    MaxTextField('Max', '10', c.Zinc_Max),
                  ],
                ),
                //
                // Filter Field Finish !
                //
                // Bottom Here
                SizedBox(height: h / 32),
                Row(
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: w / 2.4,
                      height: h / 15.3,
                      child: ElevatedButton(
                        child: const Text(
                          "Add",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Palette.whitecolor,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Palette.redcolor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                        onPressed: () {
                          // print('done');
                          print(c.Cholesterols_Min.text);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: h / 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget FilterContainer(var FilterText) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Container(
        height: h / 25,
        width: w / 4.14,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
        child: Row(children: [
          const SizedBox(width: 5),
          Text(FilterText, style: const TextStyle(fontSize: 15)),
          const Spacer(),
          Icon(Icons.cancel, color: Palette.grey700),
          const SizedBox(width: 2)
        ]));
  }

  Widget MinTextField(var MinHintText, var MinSuffixText, var MinTextContol) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
            height: h / 16,
            width: w / 2.5,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: TextField(
                controller: MinTextContol,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: MinHintText,
                    contentPadding: const EdgeInsets.all(15),
                    border: InputBorder.none,
                    suffixText: MinSuffixText,
                    suffixStyle: const TextStyle(
                        color: Palette.blackcolor,
                        fontWeight: FontWeight.bold)))));
  }

  Widget MaxTextField(var MaxHintText, var MaxSuffixText, var MaxTextContol) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
            height: h / 16,
            width: w / 2.5,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: TextField(
                controller: MaxTextContol,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: MaxHintText,
                    contentPadding: const EdgeInsets.all(15),
                    border: InputBorder.none,
                    suffixText: MaxSuffixText,
                    suffixStyle: const TextStyle(
                        color: Palette.blackcolor,
                        fontWeight: FontWeight.bold)))));
  }

  Widget Size() {
    var h = MediaQuery.of(context).size.height;
    return SizedBox(height: h / 40);
  }

  Widget Textt(var label) {
    return Row(
      children: [
        Text(
          "$label",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
