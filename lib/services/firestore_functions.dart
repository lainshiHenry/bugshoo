import 'package:bugshooapp/services/stream_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestoreInstance = Firestore.instance;
final CollectionReference _firestoreStreamPrefix = _firestoreInstance
    .collection('projectList')
    .document('o5oAsZs1ur9H38lOHuR3')
    .collection('BugShoo');

Widget returnAllBugs() {
  return StreamListBuilder(_firestoreStreamPrefix
      .orderBy('createdOn', descending: false)
      .snapshots());
}

Widget returnProjectList() {
  return StreamListBuilder(_firestoreInstance
      .collection('projectList')
      .orderBy('projectName', descending: false)
      .snapshots());
}

Widget returnNonResolvedBugs() {
  return StreamListBuilder(_firestoreInstance
      .collection('bugs')
      .where('status', whereIn: ['Open', 'In Progress', 'Testing'])
      .orderBy('createdOn', descending: false)
      .snapshots());
}

Widget returnAllOpenBugs() {
  return StreamListBuilder(_firestoreInstance
      .collection('bugs')
      .where('status', isEqualTo: 'Open')
      .orderBy('createdOn', descending: false)
      .snapshots());
}

Widget returnAllInProgressBugs() {
  return StreamListBuilder(_firestoreInstance
      .collection('bugs')
      .where('status', isEqualTo: 'In Progress')
      .orderBy('createdOn', descending: false)
      .snapshots());
}

Widget returnAllTestingBugs() {
  return StreamListBuilder(_firestoreInstance
      .collection('bugs')
      .where('status', isEqualTo: 'Testing')
      .orderBy('createdOn', descending: false)
      .snapshots());
}

void addBugs(String title, String description, String project) async {
  String currentTimestamp = DateTime.now().millisecondsSinceEpoch.toString();

  try {
    await _firestoreStreamPrefix.document(currentTimestamp).setData({
      'title': '$title',
      'assignedTo': 'null',
      'status': 'Open',
      'description': '$description',
      'bugID': '$bugListCount',
      'project': '$project',
      'createdOn': currentTimestamp,
    }, merge: true);
  } catch (e) {
    print(e);
  }
}

void addEntry(String timestamp) {}
