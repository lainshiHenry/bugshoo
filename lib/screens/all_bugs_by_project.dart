import 'package:bugshooapp/screens/add_bug.dart';
import 'package:bugshooapp/services/firestore_functions.dart';
import 'package:bugshooapp/utilities/app_drawer.dart';
import 'package:bugshooapp/utilities/arguments.dart';
import 'package:flutter/material.dart';

class AllBugsByProject extends StatefulWidget {
  static String id = 'all_bugs_by_project';
  static const routeArgs = '/extractArguments';
  @override
  _AllBugsByProjectState createState() => _AllBugsByProjectState();
}

class _AllBugsByProjectState extends State<AllBugsByProject> {
  @override
  Widget build(BuildContext context) {
    final AllBugsByProjectArguments args =
        ModalRoute.of(context).settings.arguments;
    final String projectName = args.projectName;
    return Scaffold(
      appBar: AppBar(
        title: Text('All Bugs From $projectName'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, AddBug.id);
              }),
        ],
      ),
      drawer: AppDrawer(),
      body: SafeArea(
        child: returnAllBugsByProject(projectName),
      ),
    );
  }
}
