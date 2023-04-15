import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oppion/pages/AuthPage.dart';
import 'package:oppion/pages/Loginpage.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:oppion/pages/Utils.dart';
import 'package:oppion/pages/homepage.dart';
import 'package:oppion/pages/verifyemailpage.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
    scaffoldMessengerKey: Utils.messengerKey,
    navigatorKey: navigatorKey,
    debugShowCheckedModeBanner: false,
    home: MainPage(),
  );
}

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(
            backgroundColor: Color(0xff023047),
            color: Color(0xfffb8500),
          ));
        } else if (snapshot.hasError) {
          return Center(child: Text('Something went wrong!'));
        } else if (snapshot.hasData){
          return VerifyEmailPage();
        } else {
          return AuthPage();
        }
      },
    )
  );
}
