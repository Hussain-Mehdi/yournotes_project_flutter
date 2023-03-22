import 'package:flutter/material.dart';

import 'screens/login_Screen.dart';
import 'screens/signup_screen.dart';
import 'screens/splash_screen.dart';
import 'widgets/button_widget.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "YOURNOTE",
        home: SignUpScreen());
  }
}
