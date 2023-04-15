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
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Color(0xff023047),
    body: SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          SizedBox(height: 60),
          Image.asset('assets/logo.png',
            scale: 3,),
          SizedBox(height: 10),
          Text(
            'Hey there, \n Welcome!!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
                color: Color(0xff8ecae6)),
          ),
          SizedBox(height: 40,),
          TextFormField(
            cursorColor: Color(0xff8ecae6),
            style: TextStyle(color: Color(0xff8ecae6)),
            controller: emailController,

            textInputAction: TextInputAction.next,
            decoration: InputDecoration(labelText: 'Email',
              labelStyle: TextStyle(color: Color(0xffffb703),fontSize: 20),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(0xffffb703)
                  )),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(0xff8ecae6)
                  )),
              enabledBorder:  OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(0xff8ecae6)
                  )),),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (email) => email !=null && !EmailValidator.validate(email)?'Enter a valid email': null,
          ),
          SizedBox(height: 10,),
          TextFormField(
            cursorColor: Color(0xff8ecae6),
            style: TextStyle(color: Color(0xff8ecae6)),
            controller: passwordController,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(labelText: 'Password',
              labelStyle: TextStyle(color: Color(0xffffb703),fontSize: 20),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(0xffffb703)
                  )),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(0xff8ecae6)
                  )),
              enabledBorder:  OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(0xff8ecae6)
                  )),),
            obscureText: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => value !=null && value.length < 6 ? 'Enter minimum 6 charcters':null,
          ),
          SizedBox(height: 20,),
          ElevatedButton.icon(style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50),elevation: 10,
              backgroundColor: Color(0xff8ecae6),
              shadowColor: Color(0xff219ebc)),
            onPressed: signUp, icon: Icon(Icons.arrow_forward, size:28,color: Color(
                0xff023047),),
            label: Text('Sign Up',style:TextStyle(fontSize: 22,color: Color(
                0xff023047)),),),
          SizedBox(height: 20,),
          RichText(text: TextSpan(
            style: TextStyle(color: Color(0xffffb703), fontSize: 18),
            text: 'Already have an account? ',
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = widget.onClickSignIn,
                text:'Sign In',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Color(0xff219ebc),
                ),
              ),
            ],
          ),),
        ],
      ),
      ),
    ),
  );
  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(context: context, barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator(
        backgroundColor: Color(0xff023047),
        color: Color(0xfffb8500),
      )),);
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
