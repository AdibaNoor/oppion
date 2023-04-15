import 'package:firebase_auth/firebase_auth.dart';
import 'package:oppion/main.dart';
import 'ForgotPasswordPage.dart';
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
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Color(0xff023047),
    body: SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          SizedBox(height: 60),
          Image.asset('assets/logo.png',
          scale: 3,),
          SizedBox(height: 20),
          Text(
            'Welcome Back',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold,color: Color(
                0xff8ecae6)),
          ),
          SizedBox(height: 20),
          TextField(
            controller: emailController,
            cursorColor: Color(0xff8ecae6),
            textInputAction: TextInputAction.next,
            style: TextStyle(color: Color(0xff8ecae6)),
            decoration: InputDecoration(
                labelText: 'Email',
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
                )),
             ),
          ),
          SizedBox(height: 10,),
          TextField(
            cursorColor: Color(0xff8ecae6),
            controller: passwordController,
            style: TextStyle(color: Color(0xff8ecae6)),
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
          ),
          SizedBox(height: 20,),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50),elevation: 10,
                backgroundColor: Color(0xff8ecae6),
                shadowColor: Color(0xff219ebc)),onPressed: signIn,
            icon: Icon(Icons.lock_open, size:28,color: Color(0xff023047),),
            label: Text('Sign In',style:TextStyle(fontSize: 22,color: Color(
                0xff023047)),),),
          SizedBox(height: 14),
          GestureDetector(
            child: Text(
              'Forgot Password',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Color(0xff219ebc),
                fontSize: 18,
              ),
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ForgotPasswordPage(),)),
          ),
          SizedBox(height: 24,),
          RichText(text: TextSpan(
            style: TextStyle(color: Color(0xffffb703), fontSize: 18),
                text: "Don't have an account? ",
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = widget.onClickedSignUp,
                  text:'Sign Up',
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
      Utils.showSnackBar(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }
  }


