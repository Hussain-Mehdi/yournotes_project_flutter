import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();
  static showSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: Color(0xffDFA67B),
    );
    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static showDialogBox(BuildContext context,
      {String? titleText,
      String? beforeText,
      String? userEmail,
      String? afterText}) {
    final dialogBox = showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(titleText.toString()),
            content: RichText(
              text: TextSpan(
                  text: beforeText,
                  style: GoogleFonts.poppins(
                    color: Color.fromARGB(190, 0, 0, 0),
                  ),
                  children: [
                    TextSpan(
                        text: userEmail,
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Color(0xffDFA67B),
                            fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: afterText,
                        style: GoogleFonts.poppins(
                          color: Color.fromARGB(190, 0, 0, 0),
                        ))
                  ]),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close))
            ],
          );
        });
  }
}
