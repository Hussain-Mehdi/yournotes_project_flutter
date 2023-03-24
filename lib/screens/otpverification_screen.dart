import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class OTPVerificationScreen extends StatelessWidget {
  String userEmail;
  OTPVerificationScreen({required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black54,
        ),
        backgroundColor: const Color(0xfff5f5f5),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Verification"),
                        content: RichText(
                          text: TextSpan(
                              text: "We have sent you verifcation code on ",
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
                                    text:
                                        "You will receive the code in a bit. Verify your account and carry on.",
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
              },
              icon: const Icon(Icons.help_outline))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Verification",
              style: GoogleFonts.poppins(
                  color: const Color.fromARGB(195, 0, 0, 0),
                  fontSize: 25,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "We have sent you verification to",
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: const Color.fromARGB(195, 0, 0, 0),
                fontWeight: FontWeight.w400,
              ),
            ),
            Row(
              children: [
                Text(
                  userEmail,
                  style: GoogleFonts.poppins(
                      color: const Color.fromARGB(195, 0, 0, 0),
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                TextButton(
                    onPressed: () {},
                    child: Expanded(
                      child: SizedBox(
                        width: 80,
                        child: Text(
                          "Change phone number?",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.poppins(
                              color: const Color(0xffDFA67B)),
                        ),
                      ),
                    ))
              ],
            ),
            const VerificationBox(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Resend code after 1:36",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: const Color.fromARGB(195, 0, 0, 0),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 130,
                  height: 45,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                        const Color(0xffF4B183),
                      )),
                      child: Text(
                        "Resend",
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )),
                ),
                SizedBox(
                  width: 130,
                  height: 45,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                        const Color(0xffF4B183),
                      )),
                      child: Text(
                        "Confirm",
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class VerificationBox extends StatelessWidget {
  const VerificationBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 54,
            width: 54,
            child: TextFormField(
              onSaved: (pin1) {},
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              decoration: InputDecoration(
                  fillColor: const Color(0xffF4B183),
                  filled: true,
                  hintText: '0',
                  hintStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none)),
              style: Theme.of(context).textTheme.headlineMedium,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
          SizedBox(
            height: 58,
            width: 54,
            child: TextFormField(
              onSaved: (pin1) {},
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              decoration: InputDecoration(
                  fillColor: const Color(0xffF4B183),
                  filled: true,
                  hintText: '0',
                  hintStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none)),
              style: Theme.of(context).textTheme.headlineMedium,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
          SizedBox(
            height: 58,
            width: 54,
            child: TextFormField(
              onSaved: (pin1) {},
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              decoration: InputDecoration(
                  fillColor: const Color(0xffF4B183),
                  filled: true,
                  hintText: '0',
                  hintStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none)),
              style: Theme.of(context).textTheme.headlineMedium,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
          SizedBox(
            height: 58,
            width: 54,
            child: TextFormField(
              onSaved: (pin1) {},
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              decoration: InputDecoration(
                  fillColor: const Color(0xffF4B183),
                  filled: true,
                  hintText: '0',
                  hintStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none)),
              style: Theme.of(context).textTheme.headlineMedium,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
        ],
      ),
    );
  }
}
