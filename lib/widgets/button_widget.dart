import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  String ButtonText;

  MyButton({
    required this.ButtonText,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xffF5F5F5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Ink(
          height: 60,
          width: 250,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(47, 0, 0, 0),
                    spreadRadius: 1,
                    blurRadius: 3)
              ],
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xffF4B183)),
          child: Center(
            child: Text(
              ButtonText,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
