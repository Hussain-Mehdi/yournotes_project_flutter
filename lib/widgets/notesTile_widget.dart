import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesTile extends StatelessWidget {
  NotesTile(
      {required this.noteHeading,
      required this.noteSubtitle,
      required this.noteTime});

  String noteHeading;
  String noteSubtitle;
  String noteTime;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: 90,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(10, 153, 153, 153),
                    spreadRadius: 2,
                    blurRadius: 2,
                  )
                ]),
            child: Stack(children: [
              Positioned(
                top: 20,
                left: 15,
                child: Text(
                  noteHeading,
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Positioned(
                  top: 45,
                  left: 15,
                  child: SizedBox(
                      width: 250, height: 30, child: Text(noteSubtitle))),
              Positioned(
                  right: 20,
                  bottom: 35,
                  child: Text(noteTime,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: const TextStyle())),
              const Positioned(
                  right: 20,
                  bottom: 15,
                  child: Icon(
                    Icons.favorite,
                    size: 15,
                  )),
            ])),
      ),
    );
  }
}
