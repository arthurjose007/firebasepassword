import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  Future pleaselookemail() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("it is sent"),
          );
        });
  }

  // Future<void> passwordReset() async {
  //   final email = _emailControllor.text.trim();
  //   if (!_isValidEmail(email)) {
  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text("Error"),
  //           content: Text("Please enter a valid email address."),
  //         );
  //       },
  //     );
  //     return;
  //   }

  //   try {
  //     // Check if the email is associated with an existing user account
  //     final user =
  //         await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
  //     if (user.isEmpty) {
  //       showDialog(
  //         context: context,
  //         builder: (context) {
  //           return AlertDialog(
  //             title: Text("Error"),
  //             content: Text("No user found with this email address."),
  //           );
  //         },
  //       );
  //       return;
  //     }

  //     // If the email is associated with a user account, send the password reset email
  //     await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text("Password reset email sent"),
  //         );
  //       },
  //     );
  //   } catch (e) {
  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text("Error"),
  //           content: Text(
  //               "Failed to send password reset email. Please try again later."),
  //         );
  //       },
  //     );
  //   }
  // }

  // bool _isValidEmail(String email) {
  //   // Implement your email validation logic here
  //   // This is a simple example, you might want to use a more robust method
  //   return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  // }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailControllor.text.trim());
      // print("ok");
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("it is sent"),
            );
          });
      // } catch (e) {
      //   print("Error Type: ${e.runtimeType}");
      //   print("Error: $e");
      // }
      // }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      print(e.code);
    }
  }

  // Future<void> passwordReset() async {
  //   final email = _emailControllor.text.trim();
  //   // User? user =await FirebaseAuth

  //   try {
  //     await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  //     showDialog(
  //         context: context,
  //         builder: (context) {
  //           return AlertDialog(
  //             title: Text("Password reset email sent"),
  //           );
  //         });
  //   } catch (e) {
  //     print(e);
  //     print("Error sending password reset email: " + e.toString());
  //     // Check if the error is due to the email not being found
  //     if (e.toString().contains('user-not-found')) {
  //       showDialog(
  //           context: context,
  //           builder: (context) {
  //             return AlertDialog(
  //               title: Text("Error"),
  //               content: Text("Email not found. Please enter a valid email."),
  //             );
  //           });
  //     } else {
  //       showDialog(
  //           context: context,
  //           builder: (context) {
  //             return AlertDialog(
  //               title: Text("Error"),
  //               content: Text(
  //                   "Failed to send password reset email. Please try again later."),
  //             );
  //           });
  //     }
  //   }
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  final _emailControllor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
                "Enter your email and we will send you the  a password reset link"),
          ),
          SizedBox(
            height: 10,
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
                  controller: _emailControllor,
                  decoration: const InputDecoration(
                      hintText: "Enter email", border: InputBorder.none),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 17,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GestureDetector(
              onTap: passwordReset,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromARGB(255, 15, 11, 22)),
                child: const Center(
                  child: Text(
                    "Send the link",
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
        ],
      ),
    );
  }
}
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class PasswordPage extends StatefulWidget {
//   const PasswordPage({Key? key}) : super(key: key);

//   @override
//   State<PasswordPage> createState() => _PasswordPageState();
// }

// class _PasswordPageState extends State<PasswordPage> {
//   final _emailController = TextEditingController();

//   @override
//   void dispose() {
//     _emailController.dispose();
//     super.dispose();
//   }

//   Future<void> passwordReset() async {
//     final email = _emailController.text.trim();
//     print("Email being used for password reset: $email"); // Debug print
//     if (!_isValidEmail(email)) {
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text("Error"),
//             content: Text("Please enter a valid email address."),
//           );
//         },
//       );
//       return;
//     }

//     try {
//       // Attempt to sign in with the provided email and a dummy password
//       await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: 'password');

//       // If sign-in is successful, the user exists, so proceed with sending the password reset email
//       await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text("Password reset email sent"),
//           );
//         },
//       );
//     } catch (e) {
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text("Error"),
//             content: Text(
//                 "Failed to send password reset email. Please try again later."),
//           );
//         },
//       );
//     }
//   }

//   bool _isValidEmail(String email) {
//     // Implement your email validation logic here
//     // This is a simple example, you might want to use a more robust method
//     return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 25.0),
//             child: Text(
//               "Enter your email and we will send you the password reset link",
//             ),
//           ),
//           SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 25.0),
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(14),
//                 color: Colors.grey[200],
//                 border: Border.all(color: Colors.white),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 9.0),
//                 child: TextField(
//                   controller: _emailController,
//                   decoration: InputDecoration(
//                     hintText: "Enter email",
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 17),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: GestureDetector(
//               onTap: passwordReset,
//               child: Container(
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16),
//                   color: const Color.fromARGB(255, 15, 11, 22),
//                 ),
//                 child: Center(
//                   child: Text(
//                     "Send the link",
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
