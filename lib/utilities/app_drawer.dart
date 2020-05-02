import 'package:bugshooapp/screens/add_bug.dart';
import 'package:bugshooapp/screens/all_bugs.dart';
import 'package:bugshooapp/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:bugshooapp/services/functions.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String userEmail = user.email;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('Hello $userEmail'),
          ),
          NavigationItem(
            leftIcon: Icons.bug_report,
            navItemName: 'All Bugs',
            destination: AllBugs.id,
          ),
          NavigationItem(
            leftIcon: Icons.add_circle,
            navItemName: 'Add Bugs',
            destination: AddBug.id,
          ),
          NavigationItem(
            leftIcon: Icons.adb,
            navItemName: 'Log Out',
            destination: LoginScreen.id,
          ),
        ],
      ),
    );
    ;
  }
}

class NavigationItem extends StatelessWidget {
  final IconData leftIcon;
  final String navItemName;
  final String destination;

  NavigationItem({this.leftIcon, this.navItemName, this.destination});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(leftIcon),
      title: Text(navItemName),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, destination);
      },
    );
  }
}
