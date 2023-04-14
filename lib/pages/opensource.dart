import 'package:oppion/pages/homepage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenSource extends StatefulWidget {
  const OpenSource({Key? key}) : super(key: key);

  @override
  State<OpenSource> createState() => _OpenSourceState();
}

class _OpenSourceState extends State<OpenSource> {
    final ref = FirebaseDatabase.instance.ref('OpenSource');
    @override
    Widget build(BuildContext context) {
      double w = MediaQuery.of(context).size.width;
      double h = MediaQuery.of(context).size.height;
      return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
              },
              child: Icon(Icons.arrow_back_ios_rounded,color: Colors.black,)),
          title: Text('Open Source',style: TextStyle(color: Colors.black,fontSize: 22,),textAlign: TextAlign.start,),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Expanded(
              child: FirebaseAnimatedList(
                  query: ref,
                  itemBuilder: (context, snapshot, animation, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        // child: ListTile(
                        //   leading: Icon(Icons.person,color: Colors.white,),
                        //   title: Text(snapshot.child('A').value.toString()),
                        //   subtitle: Text(snapshot.child('B').value.toString()),
                        //   tileColor: Color(0xFFD58DE0),
                        //   onTap: (){
                        //
                        //   },
                        //   minVerticalPadding: 10,
                        //   contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                        // ),
                        child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Container(
                                  alignment:Alignment.center,
                                  child: Text(snapshot
                                      .child('Name')
                                      .value
                                      .toString(),
                                    style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w800,),textAlign: TextAlign.center,),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  alignment:Alignment.center,

                                  child: Text(snapshot
                                      .child('Language 1')
                                      .value
                                      .toString(),
                                    style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500,),textAlign: TextAlign.center,),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  width: w*0.2,
                                  height: h*0.05,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  alignment:Alignment.center,
                                  child: Text(snapshot
                                      .child('Language 2')
                                      .value
                                      .toString(),
                                    style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500,),textAlign: TextAlign.center,),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  width: w*0.2,
                                  height: h*0.05,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  alignment:Alignment.center,
                                  child: Text(snapshot
                                      .child('Language 3')
                                      .value
                                      .toString(),
                                    style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500,),textAlign: TextAlign.center,),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  width: w*0.2,
                                  height: h*0.05,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  alignment:Alignment.center,
                                  child: Text(snapshot
                                      .child('Language 4')
                                      .value
                                      .toString(),
                                    style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500,),textAlign: TextAlign.center,),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  width: w*0.2,
                                  height: h*0.05,
                                ),
                                SizedBox(height: 10,),
                                Link(
                                  target: LinkTarget.self,
                                  uri: Uri.parse("snapshot.child('URL').value.toString()"),
                                  // uri: Uri.parse("www.google.com"),
                                  builder: (context, followLink) =>
                                      InkWell(
                                        onTap: ()=> launch(snapshot.child('URL').value.toString()),
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text('Explore',
                                                style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w800),),
                                              Icon(Icons.call_made_rounded,size: 18,color: Colors.black,),
                                            ],

                                          ),
                                          width: w*0.4,
                                          height: h*0.05,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(20),
                                            // image: DecorationImage(
                                            //     image: AssetImage(
                                            //         "assets/ApplyNow.png"
                                            //     )
                                            // ),
                                          ),
                                        ),
                                      ),
                                ),
                              ],
                            )
                        ),
                      ),
                    );
                  }
              ),
            )
          ],
        ),
      );
    }
  }
