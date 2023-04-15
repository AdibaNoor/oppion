import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:oppion/pages/homepage.dart';
import 'package:oppion/pages/Utils.dart';
import 'package:flutter/material.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer ? timer;

  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified){
      sendVerificationEmail();

      timer = Timer.periodic(
        Duration(seconds: 3),
          (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer ?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResendEmail = false);
      await Future.delayed(Duration(seconds: 5));
      setState(() => canResendEmail = true);
    } catch (e){
      Utils.showSnackBar(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified ?
      HomePage() : Scaffold(
    backgroundColor:  Color(0xff023047),
      appBar: AppBar(
        elevation: 0,
        backgroundColor:  Color(0xff023047),
      title: Text('Verify Email',style: TextStyle(color: Color(0xfffb8500)),),
    ),
      body: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'A Verification email has been sent to your email.',
            style: TextStyle(fontSize: 20,color: Color(0xff8ecae6)),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24,),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(150,50),
              backgroundColor: Color(0xff8ecae6)
            ),
              icon : Icon(Icons.email, size:32),
              label: Text(
                'Resend Email',
                style: TextStyle(fontSize: 24,color: Color(0xffffb703)),
              ),
              onPressed: canResendEmail ? sendVerificationEmail : null,
              ),
          SizedBox(height: 8,),
          TextButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
              ),
              onPressed: () => FirebaseAuth.instance.signOut(),
              child: Text(
                'Cancel',
                style: TextStyle(fontSize: 24,color: Color(0xff8ecae6)),
              ),
          )
        ],
      ),
    ),
  );
}
