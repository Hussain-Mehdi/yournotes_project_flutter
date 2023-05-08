import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yournotes_project_flutter/model/addnote_model.dart';
import 'package:yournotes_project_flutter/screens/addnotes_screen.dart';
import 'package:yournotes_project_flutter/screens/home_screen.dart';
import 'screens/splash_screen.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'utils/dialogBox.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
          channelKey: 'basic channel key',
          channelName: 'Update',
          channelDescription: 'Please update your app'),
    ],
    debug: true,
  );
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
        home: const HomeScreen());
  }
}
