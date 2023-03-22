import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNotesScreen extends StatelessWidget {
  const AddNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black45),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Save",
                style: GoogleFonts.poppins(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ))
        ],
        backgroundColor: const Color(0xffF5F5F5),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18),
            child: TextField(
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.w700),
              decoration: const InputDecoration(
                  hintText: 'Enter heading here',
                  hintStyle:
                      TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  border: UnderlineInputBorder(borderSide: BorderSide.none)),
            ),
          ),
          Container(
            height: 1,
            width: 220,
            color: Colors.black12,
          ),
          TextField(
            style: GoogleFonts.poppins(
              fontSize: 16,
            ),
            maxLines: 15,
            decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none)),
          )
        ],
      ),
    );
  }
}
