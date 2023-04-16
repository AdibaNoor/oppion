import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oppion/notificationServices.dart';
import 'package:oppion/pages/live%20opportunity.dart';
import 'package:oppion/pages/mentorshipfellowship.dart';
import 'package:oppion/pages/opensource.dart';
import 'package:oppion/pages/profile.dart';
import 'package:oppion/pages/scholarship.dart';

import '../utils/Card_custom.dart';
import 'drawer.dart';

class HomePage extends StatefulWidget {
   const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NotificationServices notificationServices = NotificationServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationServices.requestNotificationPermissions();
    notificationServices.firebaseInit(context);
    notificationServices.setUpInteractMessage(context);
    notificationServices.getDeviceToken().then((value){
      print("Device token");
      print(value);
    });
    notificationServices.isTokenRefresh();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xff023047),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff023047),
        title: Text('Home',style: TextStyle(color: Color(0xfffb8500),fontSize: 24),),
        leading: GestureDetector(
          onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CustomDrawer()));
          },
          child: Icon(
            Icons.dashboard,
            color: Color(0xff8ecae6),
          ),
        ),

      ),
        body: Padding(
          padding: EdgeInsets.all(28),
          child: Column(
            children: [
              Image.asset('assets/logo.png',
                scale: 3,),

              //main category card
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Scholarship()));
                        },
                        child: Container(
                          child: Center(
                              child: Text(
                                'Scholarship',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              )),
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xff8ecae6),
                                  Color(0xffbde0f5),
                                  Color(0xfff1f6f6)
                                ]
                              ),
                              borderRadius: BorderRadius.circular(12),
                          border:Border(top: BorderSide(color: Colors.white,width: 2),
                              right: BorderSide(color: Colors.white,width: 2),
                          left: BorderSide(color: Colors.white,width: 2),
                          bottom: BorderSide(color: Colors.white,width: 2)),
                          boxShadow: [
                            BoxShadow(color: Color(0xff8ecae6),
                            offset: Offset(2,2),
                            blurRadius: 2,
                            spreadRadius: 2)
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Mentorship()));
                        },
                        child: Container(
                          child: Center(
                              child: Text(
                                'Mentorship & Fellowship',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              )),
                          width: 140,
                          height: 170,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xff8ecae6),
                                    Color(0xffbde0f5),
                                    Color(0xfff1f6f6)
                                  ]
                              ),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(color: Color(0xff8ecae6),
                                    offset: Offset(2,2),
                                    blurRadius: 2,
                                    spreadRadius: 2)
                              ],
                            border:Border(top: BorderSide(color: Colors.white,width: 2),
                                right: BorderSide(color: Colors.white,width: 2),
                                left: BorderSide(color: Colors.white,width: 2),
                                bottom: BorderSide(color: Colors.white,width: 2)),),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 15,),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LiveOpportunity()));
                        },
                        child: Container(
                          child: Center(
                              child: Text(
                                'Live Opportunities',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              )),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xff8ecae6),
                                    Color(0xffbde0f5),
                                    Color(0xfff1f6f6)
                                  ]
                              ),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(color: Color(0xff8ecae6),
                                    offset: Offset(2,2),
                                    blurRadius: 2,
                                    spreadRadius: 2)
                              ],
                            border:Border(top: BorderSide(color: Colors.white,width: 2),
                              right: BorderSide(color: Colors.white,width: 2),
                              left: BorderSide(color: Colors.white,width: 2),
                              bottom: BorderSide(color: Colors.white,width: 2)),),
                          width: 140,
                          height: 170,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OpenSource()));
                        },
                        child: Container(
                          child: Center(
                              child: Text(
                                'Open Source',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              )),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xff8ecae6),
                                  Color(0xffbde0f5),
                                  Color(0xfff1f6f6)
                                ]
                            ),

                            borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(color: Color(0xff8ecae6),
                                    offset: Offset(2,2),
                                    blurRadius: 2,
                                    spreadRadius: 2)
                              ],
                            border:Border(top: BorderSide(color: Colors.white,width: 2),
                                right: BorderSide(color: Colors.white,width: 2),
                                left: BorderSide(color: Colors.white,width: 2),
                                bottom: BorderSide(color: Colors.white,width: 2)),
                          ),
                          width: 140,
                          height: 140,
                          // color: Color(0xFFD58DE0)
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

        ),

    );
  }
}
