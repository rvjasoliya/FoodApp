import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Theme/images.dart';
import '../Theme/palette.dart';

class ProfileMedicine extends StatefulWidget {
  const ProfileMedicine({Key? key}) : super(key: key);

  @override
  State<ProfileMedicine> createState() => _ProfileMedicineState();
}

class _ProfileMedicineState extends State<ProfileMedicine> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SizedBox(
      height: h / 2,
      child: ListView.builder(
        itemCount: 4,
        itemExtent: h / 5.6,
        itemBuilder: (context, position) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                height: h / 6.3,
                width: w / 1.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w / 25),
                  image: const DecorationImage(
                    image: AssetImage(AppImages.food10),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          maxRadius: w / 20,
                          backgroundColor: Palette.color0005,
                          child: const Icon(
                            Icons.delete,
                            color: Palette.color255,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Cureveda Vision",
                          style: TextStyle(
                              color: Palette.whitecolor,
                              fontSize: w / 21,
                              fontWeight: FontWeight.w800),
                        ),
                        Container(
                          height: h / 16.5,
                          width: w / 4,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Palette.color2557,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(w / 48),
                              topLeft: Radius.circular(w / 48),
                              topRight: Radius.circular(w / 48),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: h / 43,
                                    width: w / 75,
                                    decoration: BoxDecoration(
                                      color:
                                          const Color.fromRGBO(0, 204, 45, 1),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  SizedBox(
                                    width: w / 45,
                                  ),
                                  Text(
                                    "300 Gms",
                                    style: TextStyle(
                                      fontSize: w / 30,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: w / 26,
                                  ),
                                  Text(
                                    '1 Tab',
                                    style: TextStyle(
                                      color: Palette.grey600,
                                      fontSize: w / 32,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Text(""),
                      ],
                    ),
                    const Text(""),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
