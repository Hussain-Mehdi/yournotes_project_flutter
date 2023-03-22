import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yournotes_project_flutter/screens/signup_screen.dart';

class HttpHelper {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future registerUserWithEmailPassword(
      String userEmail, String userPassword) async {
    User user;
    try {
      user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: userEmail, password: userPassword))
          .user!;
      return true;
    } on FirebaseAuthException catch (e) {
      return e;
    }
  }

  Future signInWithEmailPassword(
      String email, String password, BuildContext context) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;
      Timer(
          Duration(seconds: 1),
          () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpScreen(),
              )));
      return user.emailVerified;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }
}
