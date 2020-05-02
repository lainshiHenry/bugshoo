import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bugshooapp/services/functions.dart';
import 'package:bugshooapp/screens/detailed_bug.dart';
import 'package:bugshooapp/utilities/arguments/detailed_bug_args.dart';
import 'package:intl/intl.dart';

final firestoreInstance = Firestore.instance;

class StreamListBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: firestoreInstance
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
            final createdOnTemp = DateTime.fromMillisecondsSinceEpoch(
                int.parse(createdOnTimeStamp));
            final createdOn = DateFormat.yMMMd('en_US').format(createdOnTemp);

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
        });
  }
}
