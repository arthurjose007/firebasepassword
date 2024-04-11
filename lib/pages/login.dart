import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passwordup/pages/Forgotpass.dart';
import 'package:passwordup/pages/homepage.dart';

class Loginpage extends StatefulWidget {
  final VoidCallback showRegisterpage;
  const Loginpage({super.key, required this.showRegisterpage});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _emailControllor = TextEditingController();
  final _passwordControllor = TextEditingController();
  Future signIn() async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailControllor.text.trim(),
        password: _passwordControllor.text.trim(),
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      // Navigator.pop(context);
      // if (e.code == 'channel-error') {
      //   wrongEmailMessage('enter user name and password');
      // } else if (e.code == 'invalid-credential') {
      //   wrongEmailMessage('Wrong Email or Password');
      // } else {
      //   wrongEmailMessage(e.code);
      // }
      if (e.code == 'user-not-found') {
        wrongEmailMessage('enter user name and password');
      } else if (e.code == 'invalid-credential') {
        wrongEmailMessage('Wrong Email or Password');

        // log(e.code.toString());
      } else {
        wrongEmailMessage(e.code);
        // print(e.message);
      }
    }
  }

  void wrongEmailMessage(String enter) {
    showDialog(
        context: context,
        builder: (context) {
          print('hello');
          return AlertDialog(
            title: Text(enter),
          );
        });
  }

  @override
  void dispose() {
    _emailControllor.dispose();
    _passwordControllor.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Hello again
          const Icon(
            Icons.android,
            size: 100,
          ),

          Text("Hello Again", style: GoogleFonts.bebasNeue(fontSize: 50)),
          const SizedBox(
            height: 19,
          ),
          const Text(
            "Welconme back you/'ve  been missed",
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(
            height: 24,
          ),

          //email textfield
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white)),
              child: Padding(
                padding: const EdgeInsets.only(left: 9.0),
                child: TextField(
                  controller: _emailControllor,
                  decoration: const InputDecoration(
                      hintText: "Enter email", border: InputBorder.none),
                ),
              ),
            ),
          ),
          //password textfield
          const SizedBox(
            height: 19,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white)),
              child: Padding(
                padding: const EdgeInsets.only(left: 9.0),
                child: TextField(
                  obscureText: true,
                  controller: _passwordControllor,
                  decoration: const InputDecoration(
                      hintText: "Password", border: InputBorder.none),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => PasswordPage()),
                      );
                    },
                    child: const Text(
                      'Forgot Password',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),

          //sign in button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GestureDetector(
              onTap: signIn,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.deepPurple),
                child: const Center(
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          //not a member? register now
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Not a  member ? ",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: widget.showRegisterpage,
                child: const Text(
                  "Register Now",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
