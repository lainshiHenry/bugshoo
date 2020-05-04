import 'package:bugshooapp/screens/all_bugs.dart';
import 'package:bugshooapp/utilities/app_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bugshooapp/services/stream_list_builder.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bugshooapp/utilities/constants.dart';

final _firestoreInstance = Firestore.instance;

class AddBug extends StatefulWidget {
  static String id = 'add_bug';
  @override
  _AddBugState createState() => _AddBugState();
}

class _AddBugState extends State<AddBug> {
  String title;
  String description = 'Testing';
  bool _savingData = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Bug'),
      ),
      drawer: AppDrawer(),
      body: ModalProgressHUD(
        inAsyncCall: _savingData,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: TextField(
                onChanged: (value) {
                  title = value;
                  print(title);
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Title',
                ),
              ),
            ),
            SizedBox(
              height: 14.0,
            ),
            Expanded(
              child: TextField(
                onChanged: (value) {
                  description = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Bug Description',
                ),
              ),
            ),
            FlatButton(
              child: Text(
                'Add Bug',
                style: kButtonTextStyle,
              ),
              onPressed: () async {
                String currentTimestamp =
                    DateTime.now().millisecondsSinceEpoch.toString();

                setState(() {
                  _savingData = true;
                });

                try {
                  await _firestoreInstance
                      .collection('bugs')
                      .document(currentTimestamp)
                      .setData({
                    'title': title,
                    'assignedTo': 'null',
                    'status': 'Open',
                    'description': description,
                    'bugID': bugListCount,
                    'project': 'BugShoo',
                    'createdOn': currentTimestamp,
                  }, merge: true);
                } catch (e) {
                  print(e);
                }
                setState(() {
                  _savingData = false;
                });

                Navigator.pushNamed(context, AllBugs.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
