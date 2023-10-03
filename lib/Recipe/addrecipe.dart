import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:count_stepper/count_stepper.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food/Recipe/addstep.dart';
import 'package:line_icons/line_icons.dart';
import '../Firebase/Recipe.dart';
import '../Theme/palette.dart';
import '../other/Controller.dart';
import 'addingredients.dart';

class addrecipe extends StatefulWidget {
  addrecipe(BuildContext context);

  @override
  State<addrecipe> createState() => _addrecipeState();
}

class _addrecipeState extends State<addrecipe> {
  StepperController _ServingController = StepperController();
  int ServingNum = 0;
  int selectContValue = 0;
  var c = Controller();
  List Rcip = [];

  // Photo List
  List Recipephoto = [
    'assets/images/re1.png',
    'assets/images/re2.png',
    'assets/images/re3.png',
    'assets/images/re4.png',
    'assets/images/re5.png',
    'assets/images/re6.png',
  ];

// Lunch Names et. Extra
  List name = ['Break fast', 'Lunch', 'Snack', 'Dinner'];

  // Macros
  List<Color> MacrosColors = [
    const Color.fromRGBO(240, 101, 68, 1),
    const Color.fromRGBO(255, 1, 126, 1),
    const Color.fromRGBO(131, 56, 235, 1),
    const Color.fromRGBO(255, 190, 12, 1),
  ];
  List MacrosCalaries = ['30', '60', '10', '0'];
  List MacrosType = ['kcal', 'gms', 'gms', 'gms'];
  List MacrosName = ['calaries', 'Carbs', 'Protein', 'Fat'];

  // recipe Ingredient Lists
  List IngredientsImage = ['im1.png', 'im2.png', 'im3.png', 'im4.png'];
  List IngredientsTitle = [
    'Purpose Flour',
    'Baking powder',
    'Salt',
    'White sugar'
  ];
  List IngredientsName = ['1 cups', '3 teaspoons', '1 teaspoon', '1 tablepoon'];

  // Recipe Steps
  List RecipeName = ['Mixing Units', 'Griddle and Frying'];
  List RecipeTime = ['5 mins', '10 mins'];
  List RecipeDescription = [
    'In a large bowl, sift together the flour, baking powder, salt and sugar. Make a well in the center and pour in the milk, egg and melted butter; mix until smooth.',
    'Heat a lightly oiled griddle or frying pan over medium -high heat. Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake. Brown on both sides and serve hot.'
  ];

  //

  @override
  Widget build(BuildContext context) {
    // print("servingggg ${_ServingController.currentValue}");
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Palette.whitebackground,
            title: const Text("Add Recipe"),
            titleTextStyle: TextStyle(
              color: Palette.blackcolor,
              fontWeight: FontWeight.bold,
              fontSize: w / 20,
            ),
            centerTitle: true,
            actions: [
              CircleAvatar(
                backgroundColor: Palette.backcolor,
                maxRadius: w / 19,
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    size: w / 17,
                    color: Palette.redcolor,
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 15),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DottedBorder(
                              dashPattern: const [5],
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(18),
                              color: Palette.redcolor,
                              child: Container(
                                height: h / 6.1,
                                width: w / 1.2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: Palette.red50,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: h / 17,
                                      width: w / 7.5,
                                      decoration: BoxDecoration(
                                        color: Palette.red100,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: const Icon(
                                        LineIcons.plus,
                                        color: Palette.redcolor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: h / 85,
                                    ),
                                    const Text(
                                      "Add Images",
                                      style: TextStyle(
                                        color: Palette.redcolor,
                                        letterSpacing: 1,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h / 42,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: h / 10,
                              width: w,
                              child: ListView.builder(
                                itemCount: Recipephoto.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return Row(
                                    children: [
                                      SizedBox(width: w / 50),
                                      Stack(
                                        children: [
                                          SizedBox(
                                            height: h / 9,
                                            width: w / 4.5,
                                          ),
                                          Positioned(
                                            top: h / 135,
                                            child: Container(
                                              height: h / 11.5,
                                              width: w / 5.1,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        w / 32),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    '${Recipephoto[index]}',
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: w / 6.4,
                                            child: Container(
                                              height: h / 40,
                                              width: w / 18,
                                              child: Icon(
                                                Icons.close,
                                                size: w / 24,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Palette.whitebackground,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: h / 52),
                        const Divider(thickness: 1),
                        SizedBox(height: h / 65),
                        //
                        SizedBox(
                          height: h / 7.2,
                          child: ListView.builder(
                            itemCount: name.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  const SizedBox(width: 12),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectContValue = index;
                                        // print(value);
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(w / 35),
                                      height: h / 7.2,
                                      width: w / 4.5,
                                      decoration: BoxDecoration(
                                        color: index == selectContValue
                                            ? Palette.redcolor
                                            : Palette.color255,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "${name[index]}",
                                            style: TextStyle(
                                              color: index == selectContValue
                                                  ? Palette.whitebackground
                                                  : Palette.blackcolor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: w / 22,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),

                        SizedBox(height: h / 40),
                        Container(
                          padding: EdgeInsets.only(
                              left: w / 17, top: w / 17, bottom: w / 17),
                          width: w / 1.1,
                          height: h / 10,
                          decoration: BoxDecoration(
                            color: Palette.color255,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Servings",
                                style: TextStyle(
                                  color: Palette.grey,
                                  fontSize: w / 21,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: minus,
                                  icon: Icon(
                                    LineIcons.minus,
                                    color: ServingNum > 0
                                        ? Palette.redcolor
                                        : Palette.grey,
                                  )),
                              Text('$ServingNum',
                                  style: const TextStyle(fontSize: 15)),
                              IconButton(
                                onPressed: add,
                                icon: const Icon(LineIcons.plus,
                                    color: Palette.redcolor),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: h / 38),
                        Container(
                          height: h / 7.5,
                          width: w / 1.1,
                          decoration: BoxDecoration(
                            color: Palette.color255,
                            borderRadius: BorderRadius.circular(w / 22),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Prep time",
                                style: TextStyle(
                                    color: Palette.redcolor, fontSize: w / 30),
                              ),
                              Text(
                                "2h 30m",
                                style: TextStyle(
                                  color: Palette.blackcolor,
                                  fontSize: w / 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: h / 45,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: w / 22,
                            ),
                            TitleText('Youtube Link'),
                          ],
                        ),
                        SizedBox(
                          height: h / 45,
                        ),
                        SizedBox(
                          width: w / 1.1,
                          child: TextField(
                            controller: c.Link,
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'Link here...',
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
                              filled: true,
                              contentPadding: EdgeInsets.all(w / 20),
                              fillColor: Palette.color255,
                            ),
                          ),
                        ),
                        SizedBox(height: h / 40),
                        Row(
                          children: [
                            SizedBox(width: w / 22),
                            TitleText('Macros'),
                          ],
                        ),
                        SizedBox(width: w / 22),
                        GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.all(w / 45),
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 2.1,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: MacrosCalaries.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: h / 14,
                                  width: w / 140,
                                  decoration: BoxDecoration(
                                    color: MacrosColors[index],
                                    borderRadius: BorderRadius.circular(w / 20),
                                  ),
                                ),
                                SizedBox(
                                  height: h / 14,
                                  width: w / 4,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "${MacrosCalaries[index]}",
                                            style: TextStyle(
                                              color: Palette.blackcolor,
                                              fontSize: w / 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                            children: [
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text('${MacrosType[index]}'),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${MacrosName[index]}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: w / 25),
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

                        SizedBox(height: h / 45),
                        Row(
                          children: [
                            SizedBox(width: w / 22),
                            TitleText('Recipe ingredients'),
                          ],
                        ),
                        SizedBox(height: h / 45),
                        if (IngredientsTitle.isEmpty)
                          Container(
                            height: 100,
                            child: const Center(
                              child: Text('No Data Found !'),
                            ),
                          ),
                        for (int r = 0; r < IngredientsTitle.length; r++)
                          Container(
                            decoration: BoxDecoration(
                                color: Palette.color255,
                                borderRadius: BorderRadius.circular(w / 20)),
                            child: Column(
                              children: [
                                SizedBox(height: h / 75),
                                (Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: h / 15,
                                      width: w / 6.5,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(w / 25),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/${IngredientsImage[r]}'),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    SizedBox(
                                      height: h / 14,
                                      width: w / 2.2,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                '${IngredientsTitle[r]}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: w / 23),
                                              ),
                                              const Text(" "),
                                              const Icon(
                                                  LineIcons.questionCircle),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "${IngredientsName[r]}",
                                                style: TextStyle(
                                                    color: Palette.grey,
                                                    fontSize: w / 24),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: h / 15,
                                      width: w / 8,
                                      child: Center(
                                        child: Icon(Icons.delete_outline,
                                            size: w / 13),
                                      ),
                                    ),
                                  ],
                                )),
                              ],
                            ),
                          ),
                        const Divider(thickness: 1),
                        SizedBox(height: h / 75),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => adding(context),
                                ));
                          },
                          child: AddButton('Add ingredients'),
                        ),
                      ],
                    ),
                  ),
                ),
                // New //
                SizedBox(height: h / 40),
                Row(
                  children: [
                    SizedBox(
                      width: w / 22,
                    ),
                    TitleText('Recipe Steps'),
                  ],
                ),
                SizedBox(height: h / 55),
                // if (RecipeName.isEmpty)
                //   Container(
                //     height: 100,
                //     child: const Center(
                //       child: Text('No Data Found !'),
                //     ),
                //   ),
                for (int r = 0; r < RecipeName.length; r++)
                  Container(
                    padding: EdgeInsets.only(
                        right: w / 25, top: w / 28, left: w / 20),
                    height: h / 5.5,
                    width: w / 1.2,
                    color: Palette.color255,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "${RecipeName[r]}",
                              style: TextStyle(
                                color: Palette.blackcolor,
                                fontWeight: FontWeight.w800,
                                fontSize: w / 20,
                              ),
                            ),
                            const Spacer(),
                            Icon(Icons.delete_outline_rounded, size: w / 17),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Text(
                              "Time : ",
                              style: TextStyle(color: Palette.grey),
                            ),
                            Text(
                              "${RecipeTime[r]}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: w / 30),
                            ),
                          ],
                        ),
                        const SizedBox(height: 9),
                        Expanded(
                          child: Text("${RecipeDescription[r]}"),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: h / 45),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => addstep(context),
                        ));
                  },
                  child: AddButton('Add Steps'),
                ),
                SizedBox(height: h / 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: h / 13,
                      width: w / 2.5,
                      child: ElevatedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Save",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Palette.blackcolor,
                              ),
                            ),
                          ],
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Palette.color255,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(h / 2),
                            ),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      height: h / 13,
                      width: w / 2.5,
                      child: ElevatedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Save and Add",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Palette.whitebackground,
                              ),
                            ),
                          ],
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Palette.redcolor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(h / 2),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          // RecipePhotosList
                          List RecipePhotosList = [];
                          for (var One = 0; One < Recipephoto.length; One++) {
                            RecipePhotosList.add(Recipephoto[One]);
                          }
                          // MacrosColorList
                          // List MacrosColorList = [];
                          // for (var Two = 0; Two < MacrosColors.length; Two++) {
                          //   MacrosColorList.add(MacrosColors[Two]);
                          // }

                          // FirebaseAuth auth = FirebaseAuth.instance;
                          // String userId = auth.currentUser!.uid.toString();

                          // FirebaseAuth auth = FirebaseAuth.instance;
                          // String userId = auth.currentUser!.uid.toString();
                          FirebaseAuth auth = FirebaseAuth.instance;
                          String uid = ''; //auth.currentUser!.uid.toString();

                          AddRecipe(
                            RecipePhotosList,
                            selectContValue,
                            '$ServingNum',
                            c.Link.text,
                            'RecipeIngredient',
                            'RecipeSteps',
                          );
                          // await users
                          //     .doc('${uid}')
                          //     .update({
                          //   'Servings': '${ServingNum}',
                          //   'YouTubeLink': '${c.Link}',
                          // });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: h / 35),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget TitleText(var Title) {
    var w = MediaQuery.of(context).size.width;
    return Text("$Title",
        style: TextStyle(fontWeight: FontWeight.w800, fontSize: w / 23));
  }

  Widget AddButton(var AddText) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: h / 15.8,
          width: w / 7.3,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(240, 240, 240, 1),
            borderRadius: BorderRadius.circular(w / 25),
          ),
          child: const Center(
            child: Icon(
              LineIcons.plus,
              color: Palette.redcolor,
            ),
          ),
        ),
        Text(
          '$AddText',
          style: TextStyle(
              color: Palette.redcolor,
              fontSize: w / 22,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(
          width: w / 6,
        ),
      ],
    );
  }

  void add() {
    setState(() {
      ServingNum++;
    });
  }

  void minus() {
    setState(() {
      if (ServingNum != 0) ServingNum--;
    });
  }
}
