
import 'package:oppion/pages/homepage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class FavPage extends StatefulWidget {
  const FavPage({Key? key}) : super(key: key);

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
    final refFM = FirebaseDatabase.instance.ref('FavF_M');
    final refSchol = FirebaseDatabase.instance.ref('Fav_schol');
    @override
    Widget build(BuildContext context) {
      double w = MediaQuery.of(context).size.width;
      double h = MediaQuery.of(context).size.height;
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
              )),
          title: Text(
            'Favorites',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
            ),
            textAlign: TextAlign.start,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Expanded(
              child: FirebaseAnimatedList(
                  query: refFM,
                  itemBuilder: (context, snapshot, animation, index) {
                    return Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Fellowship & Mentorship",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 15),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    snapshot.child('NAME').value.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 15),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
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
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Icon(
                                            Icons.call_made_rounded,
                                            size: 18,
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                      width: w * 0.4,
                                      height: h * 0.05,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    );
                  }),
            ),
            SizedBox(
              child: Container(
                color: Colors.blue,
              ),
              height: 5,
            ),
            Expanded(
                child: FirebaseAnimatedList(
                    query: refSchol,
                    itemBuilder: (context, snapshot, animation, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Scholarship",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 15),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      snapshot.child('NAME').value.toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 15),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Link(
                                    target: LinkTarget.self,
                                    uri: Uri.parse(
                                        "snapshot.child('LINK').value.toString()"),
                                    // uri: Uri.parse("www.google.com"),
                                    builder: (context, followLink) => InkWell(
                                      onTap: () => launch(snapshot
                                          .child('LINK')
                                          .value
                                          .toString()),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Apply Now',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Icon(
                                              Icons.call_made_rounded,
                                              size: 18,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                        width: w * 0.4,
                                        height: h * 0.05,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      );
                    }))
          ],
        ),
      );
    }
  }

