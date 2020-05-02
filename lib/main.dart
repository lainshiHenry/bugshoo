import 'package:bugshooapp/screens/bug_list.dart';
import 'package:bugshooapp/screens/detailed_bug.dart';
import 'package:bugshooapp/screens/login_screen.dart';
import 'package:bugshooapp/screens/project_list.dart';
import 'package:bugshooapp/screens/settings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: BugList.id,
      routes: {
        ProjectList.id: (context) => ProjectList(),
        BugList.id: (context) => BugList(),
        DetailedBug.id: (context) => DetailedBug(),
        SettingsScreen.id: (context) => SettingsScreen(),
        LoginScreen.id: (context) => LoginScreen(),
      },
    );
  }
}
