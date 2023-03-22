import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HttpHelper {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future registerUserWithEmailPassword(
      String userEmail, String userPassword) async {
    print("===================================inside register method");
    User user;
    try {
      user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: userEmail, password: userPassword))
          .user!;
      if (user != null) {
        print("==================>User registerd");
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print("======================================>${e}");
    }
  }

  Future signInWithEmailPassword(String email, String password) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;
      if (user != null) {
        print("User is not null");
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
