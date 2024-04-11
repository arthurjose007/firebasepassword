import 'package:flutter/material.dart';
import 'package:passwordup/pages/login.dart';
import 'package:passwordup/pages/register.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //intially, show the login page
  bool showLoginPage = true;
  void toggleScreen() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Loginpage(showRegisterpage: toggleScreen);
    } else {
      return ReginsterNo(showloginPage: toggleScreen);
    }
  }
}
