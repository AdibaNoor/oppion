import 'package:firebase_auth/firebase_auth.dart';
import 'package:oppion/main.dart';
import 'Utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const Loginpage({Key? key, required this.onClickedSignUp}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: EdgeInsets.all(16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        SizedBox(height: 60),
        FlutterLogo(size: 120),
        SizedBox(height: 20),
        TextField(
          controller: emailController,
          cursorColor: Colors.black,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(labelText: 'Email'),
        ),
        SizedBox(height: 4,),
        TextField(
          controller: passwordController,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        SizedBox(height: 20,),
        ElevatedButton.icon(style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50),),onPressed: signIn, icon: Icon(Icons.lock_open, size:32), label: Text('Sign In',style:TextStyle(fontSize: 24),),),
        SizedBox(height: 24,),
        RichText(text: TextSpan(
          style: TextStyle(color: Colors.black, fontSize: 18),
              text: 'No account? ',
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = widget.onClickedSignUp,
                text:'Sign Up',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
        ),),
      ],
    ),
  );

  Future signIn() async {
    showDialog(context: context, barrierDismissible: false,
    builder: (context) => Center(child: CircularProgressIndicator()),);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),);
    } on FirebaseAuthException catch (e){
      print(e);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }
  }


