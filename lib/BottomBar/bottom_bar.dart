import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food/Planner%20Page/food_planning.dart';
import 'package:food/Recipe/addrecipe.dart';
import 'package:food/Search/search_screen.dart';
import 'package:food/Setting%20Page/setting.dart';
import 'package:line_icons/line_icons.dart';
import '../Food_Planning/food_plan.dart';
import '../Home/HomePage.dart';
import '../Theme/palette.dart';

class BottombarScreen extends StatefulWidget {
  @override
  State<BottombarScreen> createState() => _BottombarScreenState();
}

class _BottombarScreenState extends State<BottombarScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          height: 75,
          backgroundColor: Palette.color24,
          color: Palette.whitecolor,
          animationDuration: const Duration(milliseconds: 500),
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          items: const [
            Icon(LineIcons.list, color: Palette.color023),
            Icon(LineIcons.search, color: Palette.color131146),
            Icon(LineIcons.plus, color: Palette.redcolor, size: 42),
            Icon(LineIcons.shoppingBag, color: Palette.color131146),
            Icon(Icons.more_horiz_rounded, color: Palette.color131146),
          ],
        ),
        body: _selectedIndex == 0
            ? const HomePage()
            : _selectedIndex == 1
                ? const SearchScreen()
                : (_selectedIndex == 2
                    ? addrecipe(context)
                    : (_selectedIndex == 3
                        ? planning(context)
                        : _selectedIndex == 4
                            ? const SettingScreen()
                            : const HomePage())));
  }
}
