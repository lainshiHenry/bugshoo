import 'package:bugshooapp/utilities/app_drawer.dart';
import 'package:bugshooapp/utilities/arguments/detailed_bug_args.dart';
import 'package:flutter/material.dart';

class DetailedBug extends StatefulWidget {
  static String id = 'detailed_bug';
  static const routeArgs = '/extractArguments';

  @override
  _DetailedBugState createState() => _DetailedBugState();
}

class _DetailedBugState extends State<DetailedBug> {
  String loggedInUser = 'Henry Le';

  @override
  Widget build(BuildContext context) {
    final DetailedBugArguments args = ModalRoute.of(context).settings.arguments;
    String bugID = args.bugID;
    String description = args.description;

    return Scaffold(
      appBar: AppBar(
        title: Text('Bug $bugID'),
      ),
      drawer: AppDrawer(loggedInUser: loggedInUser),
      body: Center(
        child: Text(description),
      ),
    );
  }
}
