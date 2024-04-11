import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:passwordup/pages/Authpage.dart';
import 'package:passwordup/pages/homepage.dart';
import 'package:passwordup/pages/login.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshort) {
            if (snapshort.hasData) {
              return const HomePage();
            } else {
              return const AuthPage();
            }
          }),
    );
  }
}
