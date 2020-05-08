import 'package:bugshooapp/screens/add_bug.dart';
import 'package:bugshooapp/services/firestore_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bugshooapp/utilities/app_drawer.dart';

class AllBugs extends StatefulWidget {
  static String id = 'all_bugs';
  @override
  _AllBugsState createState() => _AllBugsState();
}

class _AllBugsState extends State<AllBugs> {
  final String projectName = 'BugShoo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Bugs'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.filter_list), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, AddBug.id);
              })
        ],
      ),
      drawer: AppDrawer(),
      body: SafeArea(
        child: returnAllBugsByProject(projectName),
      ),
    );
  }
}
