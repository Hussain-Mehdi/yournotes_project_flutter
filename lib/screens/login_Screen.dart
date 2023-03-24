import 'package:flutter/material.dart';
import 'package:yournotes_project_flutter/httphelper/httphelper.dart';
import 'package:yournotes_project_flutter/httphelper/sp_helper.dart';

import '../widgets/button_widget.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userEmail = TextEditingController();

  TextEditingController userPassword = TextEditingController();

  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 70,
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
                    image: DecorationImage(
                        image: AssetImage('./images/login.png'))),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25.0, right: 25, bottom: 10, top: 35),
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
                padding: const EdgeInsets.only(left: 25.0, right: 25),
                child: SizedBox(
                  height: 60,
                  child: TextField(
                    controller: userPassword,
                    decoration: InputDecoration(
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
                padding: const EdgeInsets.only(top: 30.0),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        isLoggedIn = true;
                      });
                      loginUser(context);
                    },
                    child: MyButton(buttonText: 'Login', pressed: isLoggedIn)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ));
                      },
                      child: const Text("SignUp",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700)))
                ],
              )
            ],
          ),
        ));
  }

  loginUser(context) {
    var isLoggedIn;
    HttpHelper httpHelper = HttpHelper();
    isLoggedIn = httpHelper.signInWithEmailPassword(
        userEmail.text, userPassword.text, context);
  }
}
