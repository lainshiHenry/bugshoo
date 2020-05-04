import 'package:bugshooapp/utilities/app_drawer.dart';
import 'package:bugshooapp/utilities/arguments/detailed_bug_args.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bugshooapp/utilities/constants.dart';
import 'package:bugshooapp/utilities/snackbar_page.dart';

final _firestoreInstance = Firestore.instance;

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
    String timestamp = args.timestamp;
    String currentUser = 'Henry Le';
    String assignedToSelfText;

    return Scaffold(
      appBar: AppBar(
        title: Text('Bug $bugID'),
      ),
      drawer: AppDrawer(),
      body: Builder(
        builder: (context) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Description: $description'),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: () async {
                    await _firestoreInstance
                        .collection('bugs')
                        .document(timestamp)
                        .setData({'assignedTo': currentUser}, merge: true);

                    assignedToSelfText = 'Assigned to $currentUser';

                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text(assignedToSelfText),
                      ),
                    );
                  },
                  child: Text(
                    'Assign to Self',
                    style: kButtonTextStyle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
