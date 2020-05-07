import 'package:bugshooapp/screens/add_bug.dart';
import 'package:bugshooapp/screens/all_bugs.dart';
import 'package:bugshooapp/screens/project_list.dart';
import 'package:bugshooapp/screens/reports_screen.dart';
import 'package:bugshooapp/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bugshooapp/services/functions.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool _processing = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _processing,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('Hello '),
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
              leftIcon: Icons.list,
              navItemName: 'Project List',
              destination: ProjectList.id,
            ),
            NavigationItem(
              leftIcon: Icons.insert_chart,
              navItemName: 'Reports',
              destination: ReportsScreen.id,
            ),
            ListTile(
              leading: Icon(Icons.cloud_off),
              title: Text('Log Out'),
              onTap: () async {
                setState(() {
                  _processing = true;
                });
                try {
                  signOutCurrentUser();
                } catch (e) {
                  print(e);
                }
                setState(() {
                  _processing = false;
                });

                Navigator.popUntil(
                    context, ModalRoute.withName(WelcomeScreen.id));
              },
            ),
          ],
        ),
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
