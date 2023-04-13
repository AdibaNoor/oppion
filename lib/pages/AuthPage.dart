import 'package:flutter/material.dart';
import 'package:oppion/pages/Loginpage.dart';
import 'package:oppion/pages/SignUppage.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin=true;
  @override
  Widget build(BuildContext context) => isLogin ?
  Loginpage(onClickedSignUp: toggle) :
      SignUppage(onClickSignIn: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}
