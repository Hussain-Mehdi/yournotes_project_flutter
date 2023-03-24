import 'package:flutter/material.dart';

import '../httphelper/httphelper.dart';
import '../widgets/button_widget.dart';
import 'login_Screen.dart';
import 'otpverification_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController userFullName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  TextEditingController userConfirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Padding(
                padding: const EdgeInsets.only(
                    left: 25.0, right: 25, bottom: 10, top: 35),
                child: SizedBox(
                  height: 60,
                  child: TextField(
                    controller: userFullName,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter full name',
                        hintStyle: const TextStyle(
                            fontSize: 14, color: Colors.black45),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 25.0,
                  right: 25,
                  bottom: 10,
                ),
                child: SizedBox(
                  height: 60,
                  child: TextField(
                    controller: userEmail,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter email',
                        hintStyle: const TextStyle(
                            fontSize: 14, color: Colors.black45),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 25.0, right: 25, bottom: 10),
                child: SizedBox(
                  height: 60,
                  child: TextField(
                    controller: userPassword,
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outline),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter Password',
                        hintStyle: const TextStyle(
                            fontSize: 14, color: Colors.black45),
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
                    obscureText: true,
                    controller: userConfirmPassword,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outline),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Confirm Password',
                        hintStyle: const TextStyle(
                            fontSize: 14, color: Colors.black45),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: InkWell(
                    onTap: () {
                      registerButtonPress();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OTPVerificationScreen(
                                userEmail: userEmail.text),
                          ));
                    },
                    child: MyButton(buttonText: 'Register', pressed: false)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: const Text("SignIn",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700)))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  registerButtonPress() {
    var isRegistered;
    HttpHelper httphelper = HttpHelper();
    isRegistered = httphelper.registerUserWithEmailPassword(
        userEmail.text, userPassword.text);
  }
}
