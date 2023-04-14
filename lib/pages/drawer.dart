import"package:flutter/material.dart";
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:oppion/pages/favpage.dart';
import 'package:oppion/pages/homepage.dart';
import 'package:oppion/pages/live%20opportunity.dart';
import 'package:oppion/pages/mentorshipfellowship.dart';
import 'package:oppion/pages/opensource.dart';
import 'package:oppion/pages/profile.dart';
import 'package:oppion/pages/scholarship.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  List<ScreenHiddenDrawer> _pages =[];
  final myTextStyle = TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 18,
      color: Colors.white
  );
  final mySelectTextStyle = TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 18,
      color: Colors.white
  );
  void initState(){
    super.initState();
    _pages =[
      ScreenHiddenDrawer(ItemHiddenMenu(
        name: 'Home Page',
        selectedStyle: mySelectTextStyle,
        baseStyle: myTextStyle,
        colorLineSelected: Colors.white,
      ), HomePage()),
      ScreenHiddenDrawer(ItemHiddenMenu(
        name: 'Open Source',
        selectedStyle: mySelectTextStyle,
        baseStyle: myTextStyle,
        colorLineSelected: Colors.white,
      ), OpenSource()),
      ScreenHiddenDrawer(ItemHiddenMenu(
        name: 'Live Opportunities',
        selectedStyle: mySelectTextStyle,
        baseStyle: myTextStyle,
        colorLineSelected: Colors.white,
      ), LiveOpportunity()),
      ScreenHiddenDrawer(ItemHiddenMenu(
        name: 'Mentorship & Fellowship',
        selectedStyle: mySelectTextStyle,
        baseStyle: myTextStyle,
        colorLineSelected: Colors.white,
      ), Mentorship()),
      ScreenHiddenDrawer(ItemHiddenMenu(
        name: 'Scholarships',
        selectedStyle: mySelectTextStyle,
        baseStyle: myTextStyle,
        colorLineSelected: Colors.white,
      ), Scholarship()),
      ScreenHiddenDrawer(ItemHiddenMenu(
        name: 'Favourites',
        selectedStyle: mySelectTextStyle,
        baseStyle: myTextStyle,
        colorLineSelected: Colors.white,
      ), FavPage()),
      ScreenHiddenDrawer(ItemHiddenMenu(
        name: 'Profile',
        selectedStyle: mySelectTextStyle,
        baseStyle: myTextStyle,
        colorLineSelected: Colors.white,
      ), Profile()),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.blue,
      screens: _pages,
      initPositionSelected: 0,
      withAutoTittleName: false,
      disableAppBarDefault: true,
      verticalScalePercent: 80,
      slidePercent:60,
    );
  }
}