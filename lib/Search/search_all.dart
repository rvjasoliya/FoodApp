import 'package:flutter/material.dart';
import 'package:food/Food%20Details/food_details_screen.dart';
import 'package:food/Theme/palette.dart';

import '../Theme/images.dart';

class SlideContainer1 extends StatefulWidget {
  const SlideContainer1({Key? key}) : super(key: key);

  @override
  State<SlideContainer1> createState() => _SlideContainer1State();
}

class _SlideContainer1State extends State<SlideContainer1> {
  var Photo = [
    AppImages.breakfast,
    AppImages.lunch,
    AppImages.food8,
    AppImages.food3
  ];
  var name = ["Break Fast", "Lunch", "SendWich", "Lunch"];

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: Photo.length,
      itemBuilder: (BuildContext context, index) => Row(
        children: [
          SizedBox(
            width: w / 25,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FoodDetailsScreen(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('${Photo[index]}'),
                  )),
              height: h / 3.2,
              width: w * 0.61,
              child: Column(
                children: [
                  SizedBox(
                    height: h / 4.5,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: w / 20),
                        child: Container(
                          height: h / 17,
                          width: w / 2,
                          decoration: BoxDecoration(
                            color: Palette.color229,
                            borderRadius: BorderRadius.circular(w / 25),
                          ),
                          child: Center(
                              child: Text(
                            "${name[index]}",
                            style: TextStyle(
                                color: Palette.blackcolor,
                                fontSize: w / 17.5,
                                fontWeight: FontWeight.w700),
                          )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SlideContainer2 extends StatefulWidget {
  const SlideContainer2({Key? key}) : super(key: key);

  @override
  State<SlideContainer2> createState() => _SlideContainer2State();
}

class _SlideContainer2State extends State<SlideContainer2> {
  @override
  Widget build(BuildContext context) {
    var manphoto = [AppImages.man1, AppImages.man2];
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: manphoto.length,
      itemBuilder: (BuildContext context, index) => Row(
        children: [
          SizedBox(
            width: w / 25,
          ),
          Container(
            height: h / 6.1,
            width: w * 0.61,
            decoration: BoxDecoration(
              color: Colors.grey[350],
              // color: Color.fromARGB(
              //     255, 216, 212, 212),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: h / 120,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: w / 35,
                    ),
                    Container(
                      height: h / 13,
                      width: w / 6.3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("${manphoto[index]}"),
                        ),
                      ),
                    ),
                    Container(
                      // height: 50,
                      // color: Colors.red,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: w / 80,
                              ),
                              const Text("  "),
                              const Text("  "),
                              Text(
                                "Robin Jeans",
                                style: TextStyle(
                                    color: Palette.blackcolor,
                                    fontSize: w / 25,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "#dietician",
                                style: TextStyle(
                                    fontSize: w / 27, color: Palette.redcolor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: w / 35,
                    ),
                    const Text(
                        "Lorem ipsum dolor sit,consec\nadipisci elit. Aliquam gravida."),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: w / 35),
                    const Text(
                      "Read More",
                      style: TextStyle(color: Palette.redcolor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class ReadMore extends StatelessWidget {
//   const ReadMore({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var manphoto = [AppImages.man1, AppImages.man2];
//     var h = MediaQuery.of(context).size.height;
//     var w = MediaQuery.of(context).size.width;
//     return ListView.builder(
//       shrinkWrap: true,
//       scrollDirection: Axis.horizontal,
//       itemCount: manphoto.length,
//       itemBuilder: (BuildContext context, index) => Row(
//         children: [
//           SizedBox(
//             width: w / 25,
//           ),
//           Container(
//             height: h / 6.2,
//             width: w * 0.61,
//             decoration: BoxDecoration(
//               color: Colors.grey[350],
//               // color: Color.fromARGB(
//               //     255, 216, 212, 212),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: h / 120,
//                 ),
//                 Row(
//                   children: [
//                     SizedBox(
//                       width: w / 35,
//                     ),
//                     Container(
//                       height: h / 13,
//                       width: w / 6.3,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage("${manphoto[index]}"),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       // height: 50,
//                       // color: Colors.red,
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               SizedBox(
//                                 width: w / 80,
//                               ),
//                               Text("  "),
//                               Text("  "),
//                               Text(
//                                 "Robin Jeans",
//                                 style: TextStyle(
//                                     color: Palette.blackcolor,
//                                     fontSize: w / 25,
//                                     fontWeight: FontWeight.w700),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "#dietician",
//                                 style: TextStyle(
//                                     fontSize: w / 27, color: Palette.redcolor),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     SizedBox(
//                       width: w / 35,
//                     ),
//                     Text(
//                         "Lorem ipsum dolor sit,consec\nadipisci elit. Aliquam gravida."),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     SizedBox(width: w / 35),
//                     Text(
//                       "Read More",
//                       style: TextStyle(color: Palette.redcolor),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
