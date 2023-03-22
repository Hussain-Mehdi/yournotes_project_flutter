import 'package:flutter/material.dart';

import '../widgets/button_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
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
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter email',
                      hintStyle: TextStyle(fontSize: 14, color: Colors.black45),
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
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter Password',
                      hintStyle: TextStyle(fontSize: 14, color: Colors.black45),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: MyButton(ButtonText: 'Get Started', onpress: onpress),
            ),
          ],
        ),
      ),
    );
  }

  void onpress() {
    print("This is on press");
  }
}
