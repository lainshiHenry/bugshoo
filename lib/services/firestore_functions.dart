import 'package:bugshooapp/services/stream_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestoreInstance = Firestore.instance;

Widget returnAllBugs() {
  return null;
}

Widget returnAllBugsByProject(String projectName) {
  return StreamListBuilder(
    desiredStream: _firestoreInstance
        .collection('projectList')
        .document(projectName)
        .collection(projectName)
        .orderBy('createdOn', descending: false)
        .snapshots(),
    projectName: projectName,
  );
}

void addBugs(String title, String description, String project) async {
  String currentTimestamp = DateTime.now().millisecondsSinceEpoch.toString();

  try {
    await _firestoreInstance
        .collection('projectList')
        .document('$project')
        .collection('$project')
        .document(currentTimestamp)
        .setData({
      'title': '$title',
      'assignedTo': 'null',
      'status': 'Open',
      'description': '$description',
      'bugID': '$bugListCount',
      'project': '$project',
      'createdOn': '$currentTimestamp',
    }, merge: true);
  } catch (e) {
    print(e);
  }
}

void addProject(String project) async {
  try {
    await _firestoreInstance
        .collection('projectList')
        .document('$project')
        .setData({
      'projectName': '$project',
    }, merge: true);
  } catch (e) {
    print(e);
  }
}
