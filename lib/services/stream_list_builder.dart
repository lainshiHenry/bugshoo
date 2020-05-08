import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bugshooapp/services/functions.dart';
import 'package:bugshooapp/screens/detailed_bug.dart';
import 'package:bugshooapp/utilities/arguments.dart';
import 'package:intl/intl.dart';

int bugListCount = 1;

class StreamListBuilder extends StatelessWidget {
  final desiredStream;
  final String projectName;

  StreamListBuilder({this.desiredStream, this.projectName});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: desiredStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final bugList = snapshot.data.documents.reversed;
          List<ListTile> openBugListItems = [];

          for (var bugListItem in bugList) {
            final String bugID = bugListItem.data['bugID'].toString();
            final String title = bugListItem.data['title'];
            final createdOnTimeStamp = bugListItem.data['createdOn'];
            final createdOnTemp = DateTime.fromMillisecondsSinceEpoch(
                int.parse(createdOnTimeStamp));
            final String createdOn =
                DateFormat.yMMMd('en_US').format(createdOnTemp);

            final String status = bugListItem.data['status'];
            final String assignedTo = bugListItem.data['assignedTo'];
            final String description = bugListItem.data['description'];

            final listItem = ListTile(
              leading: Text(bugID.toString()),
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
                    timestamp: createdOnTimeStamp,
                    projectName: projectName,
                  ),
                );
              },
            );

            openBugListItems.add(listItem);
            bugListCount = openBugListItems.length + 1;
          }
          return Container(
            child: ListView.separated(
              itemCount: openBugListItems.length,
              padding: EdgeInsets.symmetric(
                vertical: 20.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: openBugListItems[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                thickness: 2.0,
                indent: 30.0,
                endIndent: 30.0,
              ),
            ),
          );
        });
  }
}
