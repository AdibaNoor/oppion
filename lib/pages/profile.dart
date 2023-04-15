import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Signed in as',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8,),
              Text(
                user.email!,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40,),
              ElevatedButton.icon(style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50),),onPressed: () => FirebaseAuth.instance.signOut(), icon: Icon(Icons.arrow_back, size:32), label: Text('Sign Out',style:TextStyle(fontSize: 24),),),
            ],
          ),
        )
    );
  }
}
