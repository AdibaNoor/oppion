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
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text('Reset Password'),
    ),
    body: Padding(padding: EdgeInsets.all(16),
    child: Form(key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Enter your email address to\nreset your password',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),),
            SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              cursorColor: Colors.black,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: 'Email'),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email) => email !=null && !EmailValidator.validate(email)?'Enter a valid email': null,
            ),
            SizedBox(height: 20,),
            ElevatedButton.icon(style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50),),onPressed: resetPassword, icon: Icon(Icons.email_outlined, size:32), label: Text('Reset Password',style:TextStyle(fontSize: 24),),),
          ],
        )),),
  );

  Future resetPassword() async{
    showDialog(context: context, barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),);
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
