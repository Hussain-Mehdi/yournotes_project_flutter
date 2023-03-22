import 'package:flutter/material.dart';

import '../widgets/button_widget.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController userName = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Text("Welcome to YOURNOTE",
                  style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w600)),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5, bottom: 20),
              width: 240,
              child: const Text(
                "Let's help us to reach your memories",
                textAlign: TextAlign.center,
                style: TextStyle(
                  wordSpacing: 5,
                  fontSize: 12,
                ),
              ),
            ),
            Container(
              height: 250,
              decoration: const BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage('./images/login.png'))),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 25.0, right: 25, bottom: 10, top: 35),
              child: SizedBox(
                height: 60,
                child: TextField(
                  controller: userName,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter email',
                      hintStyle:
                          const TextStyle(fontSize: 14, color: Colors.black45),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25),
              child: SizedBox(
                height: 60,
                child: TextField(
                  controller: userPassword,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter Password',
                      hintStyle:
                          const TextStyle(fontSize: 14, color: Colors.black45),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: MyButton(ButtonText: 'Login', onpress: onpress),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ));
                    },
                    child: const Text("SignUp",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700)))
              ],
            )
          ],
        ),
      ),
    );
  }

  void onpress() {
    print("This is on press");
  }

  void pressLoginButton() {}
}
