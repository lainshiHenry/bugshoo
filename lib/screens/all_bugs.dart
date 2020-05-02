import 'package:bugshooapp/screens/detailed_bug.dart';
import 'package:bugshooapp/utilities/arguments/detailed_bug_args.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bugshooapp/utilities/app_drawer.dart';
import 'package:bugshooapp/services/functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class AllBugs extends StatefulWidget {
  static String id = 'all_bugs';
  @override
  _AllBugsState createState() => _AllBugsState();
}

class _AllBugsState extends State<AllBugs> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    final user = await _auth.currentUser();
    if (user != null) {
      try {
        loggedInUser = user;
        print(loggedInUser.email);
      } catch (e) {
        print(e);
      }
    }
  }

  void messagesStream() async {
    await for (var snapshot in _firestore.collection('bugs').snapshots()) {
      for (var bugs in snapshot.documents) {
        print(bugs.data);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Bugs'),
      ),
      drawer: AppDrawer(loggedInUser: loggedInUser.email),
      body: BugList(),
    );
  }
}

class BugList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('bugs')
                  .orderBy('bugID', descending: false)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final bugList = snapshot.data.documents.reversed;
                List<ListTile> openBugListItems = [];

                for (var bugListItem in bugList) {
                  final bugID = bugListItem.data['bugID'];
                  final title = bugListItem.data['title'];
                  final createdOnTimeStamp = bugListItem.data['createdOn'];
                  final DateTime createdOn = createdOnTimeStamp.toDate();
                  final String status = bugListItem.data['status'];
                  final String assignedTo = bugListItem.data['assignedTo'];
                  final String description = bugListItem.data['description'];

                  final listItem = ListTile(
                    leading: Text(bugID),
                    title: Text(
                      title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Created: $createdOn',
                        ),
                        Text('Assigned to: $assignedTo'),
                      ],
                    ),
                    trailing: bugStatus(status),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        DetailedBug.id,
                        arguments: DetailedBugArguments(
                          bugID: bugID,
                          description: description,
                        ),
                      );
                    },
                  );

                  openBugListItems.add(listItem);
                }
                return Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                      vertical: 20.0,
                    ),
                    children: openBugListItems,
                  ),
                );
              })
        ],
      ),
    );
  }
}
