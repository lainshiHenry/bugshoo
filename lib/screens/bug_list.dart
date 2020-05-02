import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bugshooapp/utilities/app_drawer.dart';
import 'package:bugshooapp/utilities/constants.dart';
import 'package:bugshooapp/services/functions.dart';

class BugList extends StatefulWidget {
  static String id = 'bug_list';
  @override
  _BugListState createState() => _BugListState();
}

class _BugListState extends State<BugList> {
  String loggedInUser = 'Henry Le';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Bugs'),
      ),
      drawer: AppDrawer(loggedInUser: loggedInUser),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Text('BS-001'),
            title: Text(
              'Missing ability to add new bugs',
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Created: 05-01-2020',
                ),
                Text('Assigned to: Henry Le'),
              ],
            ),
            trailing: bugStatus(kBugStatus.Open),
          ),
          ListTile(
            leading: Text('BS-002'),
            title: Text(
              'Adding new features',
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Created: 05-01-2020',
                ),
              ],
            ),
            trailing: bugStatus(kBugStatus.InProgress),
          ),
          ListTile(
            leading: Text('BS-003'),
            title: Text(
              'Testing bug fixes',
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Created: 05-01-2020',
                ),
              ],
            ),
            trailing: bugStatus(kBugStatus.Testing),
          ),
          ListTile(
            leading: Text('BS-004'),
            title: Text(
              'Bug Fixed!',
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Created: 05-01-2020',
                ),
              ],
            ),
            trailing: bugStatus(kBugStatus.Completed),
          ),
        ],
      ),
    );
  }
}
