import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/splash_screen.dart';
import 'utils/dialogBox.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scaffoldMessengerKey: Utils.messengerKey,
        debugShowCheckedModeBanner: false,
        title: "YOURNOTE",
        home: const SplashScreen());
  }
}
