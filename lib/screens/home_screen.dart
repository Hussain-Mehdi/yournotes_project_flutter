import 'package:flutter/material.dart';
import 'package:yournotes_project_flutter/model/addnote_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yournotes_project_flutter/screens/addnotes_screen.dart';

import '../shared/menu_drawer.dart';
import '../widgets/notesTile_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool availableData = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MenuDrawer(),
        backgroundColor: const Color(0xfff5f5f5),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Home Screen',
            style: GoogleFonts.poppins(color: Colors.black),
          ),
          iconTheme: const IconThemeData(color: Color.fromARGB(171, 0, 0, 0)),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings,
                  size: 30,
                )),
            const CircleAvatar(
              backgroundImage: AssetImage("./images/pot1.jpg"),
              backgroundColor: Colors.transparent,
            )
          ],
          backgroundColor: const Color(0xffF5F5F5),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xffF4B183),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AddNotesScreen(updateState: parentState),
                ));
          },
          child: const Icon(Icons.add),
        ),
        body: availableData ? loadedHomeScreen() : emptyHomeScreen());
  }

  Widget emptyHomeScreen() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        height: 10,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("./images/addnotes.png")),
        ),
      ),
      const SizedBox(
        height: 50,
      ),
      const Text(
        "Press + icon to add notes",
        style: TextStyle(fontSize: 16, color: Colors.black45),
      )
    ]);
  }

  Widget loadedHomeScreen() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 50,
      ),
      Text(
        "Recently updated",
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      SizedBox(
        height: 150,
        child: recentlyUpdatedNotes(),
      ),
      Text(
        "Your notes",
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      Expanded(
          child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: userNotesList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return NotesTile(
                    noteHeading: userNotesList[index].noteHeading,
                    noteSubtitle: userNotesList[index].noteContent,
                    noteTime: userNotesList[index].noteTime);
              }))
    ]);
  }

  Widget recentlyUpdatedNotes() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      itemCount: userNotesList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 150,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(48, 139, 139, 139),
                      blurRadius: 2,
                      offset: Offset(1, 1),
                      spreadRadius: 1)
                ]),
            child: Stack(
              children: [
                Positioned(
                    left: 10,
                    top: 15,
                    child: Text(
                      userNotesList[index].noteHeading,
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }

  void parentState(value) {
    if (value) {
      setState(() {
        availableData = value;
      });
    }
  }
}
