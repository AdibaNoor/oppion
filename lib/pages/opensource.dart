import 'package:oppion/pages/drawer.dart';
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
        backgroundColor: Color(0xff023047),
        appBar: AppBar(
          leading: InkWell(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> CustomDrawer()));
              },
              child: Icon(Icons.arrow_back_ios_rounded,color: Color(0xfffb8500),)),
          title: Text('Open Source',style: TextStyle(color: Color(0xfffb8500),fontSize: 22,),textAlign: TextAlign.start,),
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 20),
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
                                    style: TextStyle(color: Color(0xff023047),fontSize: 15,fontWeight: FontWeight.w800,),textAlign: TextAlign.center,),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color(0xff8ecae6),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      alignment:Alignment.center,
                                      child: Text(snapshot
                                          .child('Language 1')
                                          .value
                                          .toString(),
                                        style: TextStyle(color: Color(0xff023047),fontSize: 15,fontWeight: FontWeight.w500,),textAlign: TextAlign.center,),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color(0xffffffff)
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color(0xff8ecae6),
                                      ),
                                      width: w*0.3,
                                      height: h*0.06,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      alignment:Alignment.center,
                                      child: Text(snapshot
                                          .child('Language 2')
                                          .value
                                          .toString(),
                                        style: TextStyle(color: Color(0xff023047),fontSize: 15,fontWeight: FontWeight.w500,),textAlign: TextAlign.center,),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xff8ecae6),
                                        border: Border.all(
                                            color: Color(0xffffffff)
                                        ),
                                      ),
                                      width: w*0.3,
                                      height: h*0.06,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Container(
                                     alignment:Alignment.center,
                                     child: Text(snapshot
                                         .child('Language 3')
                                         .value
                                         .toString(),
                                       style: TextStyle(color: Color(0xff023047),fontSize: 15,fontWeight: FontWeight.w500,),textAlign: TextAlign.center,),
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(15),
                                       color: Color(0xff8ecae6),
                                       border: Border.all(
                                           color: Color(0xffffffff)
                                       ),
                                     ),
                                     width: w*0.3,
                                     height: h*0.06,
                                   ),
                                   SizedBox(
                                     width: 10,
                                   ),
                                   Container(
                                     alignment:Alignment.center,
                                     child: Text(snapshot
                                         .child('Language 4')
                                         .value
                                         .toString(),
                                       style: TextStyle(color: Color(0xff023047),fontSize: 15,fontWeight: FontWeight.w500,),textAlign: TextAlign.center,),
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(15),
                                       color: Color(0xff8ecae6),
                                       border: Border.all(
                                           color: Color(0xffffffff)
                                       ),
                                     ),
                                     width: w*0.3,
                                     height: h*0.06,
                                   ),
                                 ],
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
                                                style: TextStyle(color: Color(0xff023047),fontSize: 12,fontWeight: FontWeight.w800),),
                                              Icon(Icons.call_made_rounded,size: 18,color: Color(
                                                  0xff219ebc),),
                                            ],

                                          ),
                                          width: w*0.4,
                                          height: h*0.05,
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
