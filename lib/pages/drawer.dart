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
      color: Color(0xfffb8500)
  );
  final mySelectTextStyle = TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 18,
      color: Color(0xff219ebc)
  );
  void initState(){
    super.initState();
    _pages =[
      ScreenHiddenDrawer(ItemHiddenMenu(
        name: 'Home Page',
        selectedStyle: mySelectTextStyle,
        baseStyle: myTextStyle,
        colorLineSelected: Color(0xff8ecae6),
      ), HomePage()),
      ScreenHiddenDrawer(ItemHiddenMenu(
        name: 'Open Source',
        selectedStyle: mySelectTextStyle,
        baseStyle: myTextStyle,
        colorLineSelected:Color(0xff8ecae6),
      ), OpenSource()),
      ScreenHiddenDrawer(ItemHiddenMenu(
        name: 'Live Opportunities',
        selectedStyle: mySelectTextStyle,
        baseStyle: myTextStyle,
        colorLineSelected: Color(0xff8ecae6),
      ), LiveOpportunity()),
      ScreenHiddenDrawer(ItemHiddenMenu(
        name: 'Mentorship & Fellowship',
        selectedStyle: mySelectTextStyle,
        baseStyle: myTextStyle,
        colorLineSelected: Color(0xff8ecae6),
      ), Mentorship()),
      ScreenHiddenDrawer(ItemHiddenMenu(
        name: 'Scholarships',
        selectedStyle: mySelectTextStyle,
        baseStyle: myTextStyle,
        colorLineSelected:Color(0xff8ecae6),
      ), Scholarship()),
      ScreenHiddenDrawer(ItemHiddenMenu(
        name: 'Favourites',
        selectedStyle: mySelectTextStyle,
        baseStyle: myTextStyle,
        colorLineSelected:Color(0xff8ecae6),
      ), FavPage()),
      ScreenHiddenDrawer(ItemHiddenMenu(
        name: 'Profile',
        selectedStyle: mySelectTextStyle,
        baseStyle: myTextStyle,
        colorLineSelected:Color(0xff8ecae6),
      ), Profile()),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Color(0xff023047),
      screens: _pages,
      initPositionSelected: 0,
      withAutoTittleName: false,
      disableAppBarDefault: true,
      verticalScalePercent: 80,
      slidePercent:65,
    );
  }
}