import 'package:flutter/material.dart';
import 'package:food/Theme/images.dart';
import 'package:line_icons/line_icons.dart';

import '../Theme/palette.dart';

class LikeIcon extends StatefulWidget {
  const LikeIcon({Key? key}) : super(key: key);

  @override
  State<LikeIcon> createState() => _LikeIconState();
}

class _LikeIconState extends State<LikeIcon> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Positioned(
      top: h / 3.70,
      left: w / 1.37,
      child: SizedBox(
        height: h / 14,
        width: w / 6,
        child: Image.asset(AppImages.like),
      ),
    );
  }
}

class LikeContainer1 extends StatefulWidget {
  const LikeContainer1({Key? key}) : super(key: key);

  @override
  State<LikeContainer1> createState() => _LikeContainer1State();
}

class _LikeContainer1State extends State<LikeContainer1> {
  List<Color> colors = [
    const Color.fromRGBO(240, 101, 68, 1),
    const Color.fromRGBO(255, 1, 126, 1),
    const Color.fromRGBO(131, 56, 235, 1),
    const Color.fromRGBO(255, 190, 12, 1),
  ];
  List calaries = ['30', '60', '10', '0'];
  List type = ['kcal', 'gms', 'gms', 'gms'];
  List namee = ['calaries', 'Carbs', 'Protein', 'Fat'];
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w / 19),
      child: Container(
        height: h / 2.3,
        width: w,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 0.5),
          // color: Palette.whitebackground,
          borderRadius: BorderRadius.circular(w / 20),
        ),
        child: Column(
          children: [
            SizedBox(
              height: h / 28,
            ),
            Text(
              "Breakfast",
              style: TextStyle(fontSize: w / 22),
            ),
            SizedBox(
              height: h / 135,
            ),
            Text(
              "Pancake Stack",
              style: TextStyle(
                  color: Palette.blackcolor,
                  fontSize: w / 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: h / 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  backgroundColor: Palette.color2557,
                  child: Icon(
                    Icons.verified,
                    color: Palette.color0,
                    size: 20,
                  ),
                  // backgroundImage: AssetImage(AppImages.verify),
                  maxRadius: 9,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  ' Verified by Medic Diet',
                  style: TextStyle(
                      color: Palette.blackcolor, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(height: h / 100),
            GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2,
                  crossAxisSpacing: 20,
                ),
                itemCount: namee.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: h / 14,
                        width: w / 140,
                        decoration: BoxDecoration(
                          color: colors[index],
                          borderRadius: BorderRadius.circular(w / 20),
                        ),
                      ),
                      SizedBox(
                        height: h / 12.5,
                        width: w / 4,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${calaries[index]}",
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
                                    SizedBox(
                                      height: h / 50,
                                    ),
                                    Text('${type[index]}'),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "${namee[index]}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: w / 25,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class TimeContainer extends StatefulWidget {
  const TimeContainer({Key? key}) : super(key: key);

  @override
  State<TimeContainer> createState() => _TimeContainerState();
}

class _TimeContainerState extends State<TimeContainer> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      height: h / 8.3,
      width: w / 1.12,
      decoration: BoxDecoration(
        color: Palette.color255,
        borderRadius: BorderRadius.circular(w / 22),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Prep time",
            style: TextStyle(color: Palette.redcolor, fontSize: w / 30),
          ),
          const SizedBox(
            height: 5,
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
    );
  }
}

class RecipeIngredientsContainer extends StatefulWidget {
  const RecipeIngredientsContainer({Key? key}) : super(key: key);

  @override
  State<RecipeIngredientsContainer> createState() =>
      _RecipeIngredientsContainerState();
}

class _RecipeIngredientsContainerState
    extends State<RecipeIngredientsContainer> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    List image = ['im1.png', 'im2.png', 'im3.png', 'im4.png'];
    List recipename = ['Purpose Flour', 'Baking powder', 'Salt', 'White sugar'];
    List recipename1 = ['1 cups', '3 teaspoons', '1 teaspoon', '1 tablepoon'];
    return Container(
      padding: const EdgeInsets.all(15),
      height: h / 2.1,
      width: w / 1.1,
      decoration: BoxDecoration(
        color: Palette.color255,
        borderRadius: BorderRadius.circular(w / 20),
      ),
      child: Column(
        children: [
          SizedBox(
            height: h / 2.8,
            width: w / 1.2,
            child: Expanded(
              child: ListView.builder(
                itemCount: image.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: h / 65,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: h / 15,
                            width: w / 6.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w / 25),
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/images/${image[index]}'),
                                fit: BoxFit.cover,
                              ),
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
                                      '${recipename[index]}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: w / 23,
                                      ),
                                    ),
                                    const Text(" "),
                                    const Icon(LineIcons.questionCircle),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${recipename1[index]}",
                                      style: TextStyle(
                                        color: Palette.grey,
                                        fontSize: w / 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: h / 15,
                            width: w / 8,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          SizedBox(
            height: h / 95,
          ),
          Text(
            'See All Ingredients',
            style: TextStyle(color: Palette.redcolor, fontSize: w / 23),
          ),
        ],
      ),
    );
  }
}

class RecipeSteps extends StatefulWidget {
  const RecipeSteps({Key? key}) : super(key: key);

  @override
  State<RecipeSteps> createState() => _RecipeStepsState();
}

class _RecipeStepsState extends State<RecipeSteps> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    List nameee = ['Mixing Units', 'Griddle and Frying'];
    List time = ['5 mins', '10 mins'];
    List des = [
      'In a large bowl, sift together the flour, baking powder, salt and sugar. Make a well in the center and pour in the milk, egg and melted butter; mix until smooth.',
      'Heat a lightly oiled griddle or frying pan over medium -high heat. Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake. Brown on both sides and serve hot.'
    ];
    return Container(
      height: h / 2.15,
      width: w / 1.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(w / 20),
      ),
      child: Column(
        children: [
          Container(
            height: h / 2.2,
            width: w / 1.1,
            // color: Palette.color255,
            decoration: BoxDecoration(
              color: Palette.color255,
              borderRadius: BorderRadius.circular(w / 20),
            ),
            child: ListView.builder(
              itemCount: 2,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: h / 35, vertical: w / 30),
                      child: Container(
                        height: h / 4.80,
                        width: w / 1.2,
                        color: Palette.color255,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${nameee[index]}",
                                  style: TextStyle(
                                    color: Palette.blackcolor,
                                    fontWeight: FontWeight.w800,
                                    fontSize: w / 20,
                                  ),
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.delete_outline_rounded,
                                  size: w / 17,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: h / 120,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Time : ",
                                  style: TextStyle(color: Palette.grey),
                                ),
                                Text(
                                  "${time[index]}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: w / 30),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: h / 110,
                            ),
                            Text("${des[index]}"),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      color: Palette.grey,
                      thickness: 0.5,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
