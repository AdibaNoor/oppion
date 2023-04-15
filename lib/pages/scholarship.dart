import 'package:flutter/material.dart';
import 'package:oppion/pages/drawer.dart';
import 'package:oppion/pages/homepage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';


class Scholarship extends StatefulWidget {
  const Scholarship({Key? key}) : super(key: key);

  @override
  State<Scholarship> createState() => _ScholarshipState();
}

class _ScholarshipState extends State<Scholarship> {
  final ref = FirebaseDatabase.instance.ref('Scholarship');
  final refSchol = FirebaseDatabase.instance.ref('Fav_schol');
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xff023047),
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => CustomDrawer()));
            },
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: Color(0xfffb8500),
            )),
        title: Text(
          'Scholarships',
          style: TextStyle(
            color: Color(0xfffb8500),
            fontSize: 22,
          ),
          textAlign: TextAlign.start,
        ),
        elevation: 0,
        backgroundColor: Color(0xff023047),
      ),
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
                query: ref,
                itemBuilder: (context, snapshot, animation, index) {
                  return Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xff219ebc),
                                Color(0xff8ecae6),
                                Color(0xfff0f7f8)
                              ]
                          ),
                          // borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(color: Color(0xff8ecae6),
                                offset: Offset(2,2),
                                blurRadius: 2,
                                spreadRadius: 2)
                          ],
                          border:Border(
                              right: BorderSide(color: Colors.white,width: 1,),
                              bottom: BorderSide(color: Colors.white,width: 1),
                              left: BorderSide(color:Colors.white,width: 1),
                              top: BorderSide(color:Colors.white,width: 1)),
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(

                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  snapshot.child('NAME').value.toString(),
                                  style: TextStyle(
                                    color: Color(0xff023047),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xff8ecae6),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Link(
                                    target: LinkTarget.self,
                                    uri: Uri.parse(
                                        "snapshot.child('LINK').value.toString()"),
                                    // uri: Uri.parse("www.google.com"),
                                    builder: (context, followLink) => InkWell(
                                      onTap: () => launch(
                                          snapshot.child('LINK').value.toString()),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Apply Now',
                                              style: TextStyle(
                                                  color: Color(0xff023047),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            Icon(
                                              Icons.call_made_rounded,
                                              size: 15,
                                              color: Color(0xff219ebc),
                                            ),
                                          ],
                                        ),
                                        width: w * 0.4,
                                        height: h * 0.05,
                                        decoration: BoxDecoration(
                                          color: Color(0xff8ecae6),
                                          borderRadius: BorderRadius.circular(15),
                                          // image: DecorationImage(
                                          //     image: AssetImage(
                                          //         "assets/ApplyNow.png"
                                          //     )
                                          // ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Theme(
                                    data: ThemeData(
                                      elevatedButtonTheme: ElevatedButtonThemeData(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xffffb703)
                                        ),
                                      ),
                                    ),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          refSchol.push().set({
                                            "NAME": snapshot
                                                .child('NAME')
                                                .value
                                                .toString(),
                                            "LINK": snapshot
                                                .child('LINK')
                                                .value
                                                .toString()
                                          },
                                          );
                                        },
                                        child: Text("Fav",style: TextStyle(
                                            color: Color(0xff023047),fontSize: 15),)),
                                  ),
                                ],
                              )
                            ],
                          )),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
