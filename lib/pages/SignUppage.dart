import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'Utils.dart';

class SignUppage extends StatefulWidget {
  final Function() onClickSignIn;
  const SignUppage({Key? key, required this.onClickSignIn}) : super(key: key);

  @override
  State<SignUppage> createState() => _SignUppageState();
}

class _SignUppageState extends State<SignUppage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: EdgeInsets.all(16),
    child: Form(
      key: formKey,
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        SizedBox(height: 60),
        FlutterLogo(size: 120),
        SizedBox(height: 20),
        Text(
          'Hey there, \n Welcome',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 40,),
        TextFormField(
          controller: emailController,
          cursorColor: Colors.black,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(labelText: 'Email'),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (email) => email !=null && !EmailValidator.validate(email)?'Enter a valid email': null,
        ),
        SizedBox(height: 4,),
        TextFormField(
          controller: passwordController,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => value !=null && value.length < 6 ? 'Enter minimum 6 charcters':null,
        ),
        SizedBox(height: 20,),
        ElevatedButton.icon(style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50),),onPressed: signUp, icon: Icon(Icons.arrow_forward, size:32), label: Text('Sign Up',style:TextStyle(fontSize: 24),),),
        SizedBox(height: 20,),
        RichText(text: TextSpan(
          style: TextStyle(color: Colors.black, fontSize: 18),
          text: 'Already have an account? ',
          children: [
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = widget.onClickSignIn,
              text:'Sign In',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),),
      ],
    ),
    ),
  );
  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(context: context, barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),);
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),);
    } on FirebaseAuthException catch (e){
      print(e);
      Utils.showSnackBar(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
