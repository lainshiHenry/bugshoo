import 'package:bugshooapp/screens/all_bugs.dart';
import 'package:bugshooapp/screens/login_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({@required this.loggedInUser});

  final String loggedInUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('Hello $loggedInUser'),
          ),
          NavigationItem(
            leftIcon: Icons.bug_report,
            navItemName: 'All Bugs',
            destination: AllBugs.id,
          ),
          NavigationItem(
            leftIcon: Icons.adb,
            navItemName: 'Login Screen',
            destination: LoginScreen.id,
          ),
        ],
      ),
    );
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
