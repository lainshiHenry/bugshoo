import 'package:bugshooapp/screens/add_bug.dart';
import 'package:bugshooapp/screens/add_project.dart';
import 'package:bugshooapp/screens/all_bugs.dart';
import 'package:bugshooapp/screens/all_bugs_by_project.dart';
import 'package:bugshooapp/screens/detailed_bug.dart';
import 'package:bugshooapp/screens/login_screen.dart';
import 'package:bugshooapp/screens/project_list.dart';
import 'package:bugshooapp/screens/registration_screen.dart';
import 'package:bugshooapp/screens/reports_screen.dart';
import 'package:bugshooapp/screens/settings.dart';
import 'package:bugshooapp/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        ProjectList.id: (context) => ProjectList(),
        AllBugs.id: (context) => AllBugs(),
        DetailedBug.id: (context) => DetailedBug(),
        SettingsScreen.id: (context) => SettingsScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        DetailedBug.routeArgs: (context) => DetailedBug(),
        AddBug.id: (context) => AddBug(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ReportsScreen.id: (context) => ReportsScreen(),
        AllBugsByProject.id: (context) => AllBugsByProject(),
        AddProject.id: (context) => AddProject(),
      },
    );
  }
}
