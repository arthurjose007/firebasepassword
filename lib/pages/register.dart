import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReginsterNo extends StatefulWidget {
  final VoidCallback showloginPage;
  const ReginsterNo({super.key, required this.showloginPage});

  @override
  State<ReginsterNo> createState() => _ReginsterNoState();
}

class _ReginsterNoState extends State<ReginsterNo> {
  final _emailControllor = TextEditingController();
  final _passwordControllor = TextEditingController();
  final _confirmpassControllor = TextEditingController();
  @override
  void dispose() {
    _emailControllor.dispose();
    _passwordControllor.dispose();
    _confirmpassControllor.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Future signup() async {
    if (passwordConform()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailControllor.text.trim(),
        password: _passwordControllor.text.trim(),
      );
    } else {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("must be same"),
            );
          });
    }
  }

  bool passwordConform() {
    if (_confirmpassControllor.text.trim() == _passwordControllor.text.trim()) {
      return true;
    } else {
      return false;
    }
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

          Text("Hello There", style: GoogleFonts.bebasNeue(fontSize: 50)),
          const SizedBox(
            height: 19,
          ),
          const Text(
            "Register below with your details",
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
                padding: EdgeInsets.only(left: 9.0),
                child: TextField(
                  controller: _emailControllor,
                  decoration: InputDecoration(
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
                padding: EdgeInsets.only(left: 9.0),
                child: TextField(
                  obscureText: true,
                  controller: _passwordControllor,
                  decoration: InputDecoration(
                      hintText: "Password", border: InputBorder.none),
                ),
              ),
            ),
          ),
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
                padding: EdgeInsets.only(left: 9.0),
                child: TextField(
                  obscureText: true,
                  controller: _confirmpassControllor,
                  decoration: InputDecoration(
                      hintText: "Confirm Password ", border: InputBorder.none),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //sign in button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GestureDetector(
              onTap: signup,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromARGB(255, 15, 11, 22)),
                child: const Center(
                  child: Text(
                    "Sign UP",
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
              const Text("I am a member  ",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: widget.showloginPage,
                child: const Text(
                  "Login now",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
