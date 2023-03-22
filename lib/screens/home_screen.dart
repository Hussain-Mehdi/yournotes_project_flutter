import 'package:flutter/material.dart';
import 'package:yournotes_project_flutter/screens/addnotes_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffF4B183),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNotesScreen(),
              ));
        },
        child: Icon(Icons.add),
      ),
      body: emptyScreen(),
    );
  }

  Widget emptyScreen() {
    return Material(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("./images/addnotes.png")),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Text(
          "Press + icon to add notes",
          style: TextStyle(fontSize: 16, color: Colors.black45),
        )
      ]),
    );
  }
}
