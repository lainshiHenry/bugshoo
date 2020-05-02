import 'package:bugshooapp/screens/bug_list.dart';
import 'package:bugshooapp/screens/project_list.dart';
import 'package:bugshooapp/screens/settings.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  //TODO Pass the Nav Bar index so it can be properly

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, ProjectList.id, arguments: index);
        break;
      case 1:
        Navigator.pushNamed(context, BugList.id);
        break;
      case 3:
        Navigator.pushNamed(context, SettingsScreen.id);
        break;
      default:
        Navigator.pushNamed(context, ProjectList.id);
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      unselectedItemColor: Colors.blueGrey,
      selectedItemColor: Colors.amber[800],
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          title: Text('Project List'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bug_report),
          title: Text('Bug List'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle),
          title: Text('Add'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text('Settings'),
        ),
      ],
    );
  }
}
