import 'package:bugshooapp/utilities/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:bugshooapp/services/stream_list_builder.dart';

class AddBug extends StatefulWidget {
  static String id = 'add_bug';
  @override
  _AddBugState createState() => _AddBugState();
}

class _AddBugState extends State<AddBug> {
  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Bug'),
      ),
      drawer: AppDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: TextField(
              onChanged: (value) {
                title = value;
                print(title);
              },
            ),
          ),
          FlatButton(
            child: Text('Add Bug'),
            color: Colors.black,
            textColor: Colors.white,
            onPressed: () {
              firestoreInstance.collection('bugs').add({
                'title': title,
                'assignedTo': 'Henry Le',
                'status': 'Open',
                'description': 'Testing',
                'bugID': 'BS-010',
                'createdOn': DateTime.now().millisecondsSinceEpoch.toString(),
              });
            },
          ),
        ],
      ),
    );
  }
}
