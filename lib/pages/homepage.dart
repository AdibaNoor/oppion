import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oppion/pages/live%20opportunity.dart';
import 'package:oppion/pages/mentorshipfellowship.dart';
import 'package:oppion/pages/opensource.dart';
import 'package:oppion/pages/scholarship.dart';

import '../utils/Card_custom.dart';
import 'drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CustomDrawer()));
          },
          child: Icon(
            Icons.dashboard,
            color: Colors.white,
          ),
        ),

      ),
        body: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              SizedBox(height: 40),
              FlutterLogo(size: 120),
              SizedBox(height: 80),
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
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12)),
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
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ],
                  ),
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
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12)),
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
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12),
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

        )
    );

  }
}
