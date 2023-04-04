import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yournotes_project_flutter/screens/home_screen.dart';
import '../screens/favourite_screen.dart';
import '../screens/setting_screen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItem(context),
      ),
    );
  }

  List<Widget> buildMenuItem(BuildContext context) {
    List<String> menuData = [
      'Home',
      'Favourite',
      'Setting',
      'Logout',
    ];
    List<Widget> menuIcons = const [
      Icon(Icons.home_outlined),
      Icon(Icons.favorite_outline),
      Icon(Icons.settings_outlined),
      Icon(Icons.logout_outlined)
    ];
    List<Widget> menuItem = [];

    menuItem.add(const DrawerHeader(
        decoration: BoxDecoration(
          color: Color(0xffF4B183),
        ),
        child: Text("YOURNOTE")));
    int index = 0;
    menuData.forEach((String value) {
      Widget screen = Container();
      menuItem.add(ListTile(
        leading: menuIcons[index],
        title: Text(
          value,
          style: GoogleFonts.poppins(fontSize: 16),
        ),
        onTap: () {
          switch (value) {
            case 'Home':
              screen = const HomeScreen();
              break;
            case 'Favourite':
              screen = const FavouriteScreen();
              break;
            case 'Setting':
              screen = const SettingScreen();
              break;
            case 'Logout':
              break;
          }
          Navigator.pop(context);
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => screen,
          ));
        },
      ));
      index++;
    });
    return menuItem;
  }
}
