import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oppion/pages/Utils.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  @override
  void dispose(){
    emailController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Color(0xff023047),
    appBar: AppBar(
      backgroundColor: Color(0xff023047),
      elevation: 0,
      title: Text('Reset Password',style: TextStyle(color: Color(0xfffb8500)),),
    ),
    body: Padding(padding: EdgeInsets.all(16),
    child: Form(key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Enter your email address to\nreset your password',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24,color: Color(0xff8ecae6)),),
            SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              cursorColor: Color(0xff8ecae6),
              style: TextStyle(color: Color(0xff8ecae6)),
              textInputAction: TextInputAction.next,
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
                    )),),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email) => email !=null && !EmailValidator.validate(email)?'Enter a valid email': null,
            ),
            SizedBox(height: 20,),
            ElevatedButton.icon(style: ElevatedButton.styleFrom(minimumSize: Size(150,50),
                backgroundColor: Color(0xff8ecae6),
            shadowColor: Color(0xff219ebc)),
              onPressed: resetPassword,
              icon: Icon(Icons.email_outlined, size:32,color: Color(0xff023047),),
              label: Text('Reset Password',style:TextStyle(fontSize: 24,color: Color(
                  0xff023047)),),),
          ],
        )),),
  );

  Future resetPassword() async{
    showDialog(context: context, barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator(
        color: Color(0xfffb8500),
        backgroundColor: Color(0xff023047),
      )),);
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emailController.text.trim());
      Utils.showSnackBar('Password Reset Email Sent');
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e){
      print(e);

      Utils.showSnackBar(e.message);
      Navigator.of(context).pop();
    }
  }
  
}
