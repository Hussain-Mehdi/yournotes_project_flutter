import 'package:flutter/material.dart';

import '../widgets/button_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 250,
            decoration: const BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('./images/splash.png'))),
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
            padding: const EdgeInsets.only(top: 20),
            width: 220,
            child: const Text(
              "Welcome, we hope that this app will be benifical for you. Write, read, edit and save your opinions, memories and notes with easy experience.",
              textAlign: TextAlign.center,
              style: TextStyle(
                wordSpacing: 5,
                fontSize: 12,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: MyButton(
              buttonText: 'Get Started',
              pressed: false,
            ),
          ),
        ],
      ),
    );
  }
}
