import 'package:flutter/material.dart';

import '../httphelper/httphelper.dart';
import '../utils/dialogBox.dart';
import '../widgets/button_widget.dart';
import 'login_Screen.dart';
import 'otpverification_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userFullName = TextEditingController();

  TextEditingController userEmail = TextEditingController();

  TextEditingController userPassword = TextEditingController();

  TextEditingController userConfirmPassword = TextEditingController();

  bool showPassword = true;

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
                        prefixIcon: const CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.black45,
                          child: ImageIcon(
                            AssetImage("./images/user.png"),
                            size: 20,
                          ),
                        ),
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
                        prefixIcon: const CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.black45,
                          child: ImageIcon(
                            AssetImage("./images/user.png"),
                            size: 20,
                          ),
                        ),
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
                    obscureText: showPassword,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          size: 20,
                          color: Colors.black54,
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (showPassword) {
                                  setState(() {
                                    showPassword = false;
                                  });
                                } else {
                                  setState(() {
                                    showPassword = true;
                                  });
                                }
                              });
                            },
                            icon: const Icon(
                              Icons.remove_red_eye_outlined,
                              size: 20,
                            )),
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
                    obscureText: showPassword,
                    controller: userConfirmPassword,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          size: 20,
                          color: Colors.black54,
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (showPassword) {
                                  setState(() {
                                    showPassword = false;
                                  });
                                } else {
                                  setState(() {
                                    showPassword = true;
                                  });
                                }
                              });
                            },
                            icon: const Icon(
                              Icons.remove_red_eye_outlined,
                              size: 20,
                            )),
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
                      if (userFullName.text.isEmpty &&
                          userEmail.text.isEmpty &&
                          userPassword.text.isEmpty &&
                          userConfirmPassword.text.isEmpty) {
                        Utils.showDialogBox(context,
                            titleText: 'Error',
                            beforeText: 'Please fill out the all fields.');
                      }
                      String isRegistered;
                      isRegistered = registerButtonPress();
                      if (isRegistered == null) {
                        Utils.showSnackBar(isRegistered);
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OTPVerificationScreen(
                                  userEmail: userEmail.text),
                            ));
                      }
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

  String registerButtonPress() {
    var isRegistered;
    HttpHelper httphelper = HttpHelper();
    isRegistered = httphelper.registerUserWithEmailPassword(
        userEmail.text, userPassword.text);
    return isRegistered;
  }
}
