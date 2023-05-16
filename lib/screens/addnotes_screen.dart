import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yournotes_project_flutter/model/addnote_model.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:yournotes_project_flutter/utils/dialogBox.dart';

class AddNotesScreen extends StatefulWidget {
  AddNotesScreen(this.noteHeading, this.noteDetail, this.noteID);

  String? noteDetail;
  String? noteHeading;
  String noteID;

  @override
  State<AddNotesScreen> createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<AddNotesScreen> {
  TextEditingController notesContent = TextEditingController();
  TextEditingController notesHeading = TextEditingController();
  DateTime time = DateTime.now();

  @override
  void initState() {
    notesHeading.text = widget.noteHeading.toString();
    notesContent.text = widget.noteDetail.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black45),
        actions: [
          TextButton(
              onPressed: () {
                if (notesHeading.text.isEmpty || notesContent.text.isEmpty) {
                  Utils.showSnackBar("Empty can not be saved!");
                  Utils.showDialogBox(context, titleText: "Empty cann");
                } else {
                  if (widget.noteID == 'NULL') {
                    userNotesList.add(AddNotes(
                        noteHeading: notesHeading.text,
                        noteContent: notesContent.text,
                        noteTime:
                            "${time.hour > 12 ? time.hour - 12 : time.hour}:${time.minute}"));
                  } else {
                    userNotesList.removeAt(int.parse(widget.noteID));
                    userNotesList.insert(
                        int.parse(widget.noteID),
                        AddNotes(
                            noteHeading: notesHeading.text,
                            noteContent: notesContent.text,
                            noteTime:
                                "${time.hour > 12 ? time.hour - 12 : time.hour}:${time.minute}"));
                  }

                  setState(() {});
                }
              },
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
            child: SizedBox(
              child: TextField(
                controller: notesHeading,
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.w700),
                decoration: const InputDecoration(
                    hintText: 'Enter heading here',
                    hintStyle: TextStyle(
                      fontSize: 18,
                    ),
                    border: UnderlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
          ),
          Container(
            height: 1,
            width: 220,
            color: Colors.black12,
          ),
          TextField(
            controller: notesContent,
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
