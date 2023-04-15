import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oppion/pages/drawer.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      backgroundColor:  Color(0xff023047),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff023047),
          title: Text('Profile',style: TextStyle(color: Color(0xfffb8500),fontSize: 24),),
          leading: InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => CustomDrawer()));
              },
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: Color(0xfffb8500),
              )),
        ),
        body: Padding(
          padding: EdgeInsets.all(28),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Signed in as',
                  style: TextStyle(fontSize: 24,color:  Color(0xff8ecae6)),
                ),
                SizedBox(height: 8,),
                Text(
                  user.email!,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color:  Color(
                      0xffffb703)),
                ),
                SizedBox(height: 40,),
                ElevatedButton.icon(style: ElevatedButton.styleFrom(
                  minimumSize: Size(150,50),backgroundColor:  Color(
                    0xff8ecae6),),
                  onPressed: ()=> FirebaseAuth.instance.signOut(),
                  icon: Icon(Icons.arrow_back, size:32,color:  Color(0xff023047),),
                  label: Text('Sign Out',style:TextStyle(fontSize: 20,color:Color(0xff023047)),),),
              ],
            ),
          ),
        )
    );
  }
}
