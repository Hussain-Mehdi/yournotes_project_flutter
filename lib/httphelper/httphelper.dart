import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yournotes_project_flutter/httphelper/sp_helper.dart';
import 'package:yournotes_project_flutter/screens/signup_screen.dart';

import '../utils/dialogBox.dart';

class HttpHelper {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future registerUserWithEmailPassword(
      String userEmail, String userPassword) async {
    User user;
    try {
      user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: userEmail, password: userPassword))
          .user!;
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }
  }

  Future signInWithEmailPassword(
      String email, String password, BuildContext context) async {
    try {
      await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        if (value == true) {
          SPHelper.saveUserLoggedIn(true);
        }
        return value.toString();
      });
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }
}
