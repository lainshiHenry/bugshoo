import 'package:bugshooapp/services/firestore_functions.dart';
import 'package:flutter/material.dart';

class ReportsScreen extends StatefulWidget {
  static String id = 'reports_screen';
  @override
  _ReportsScreenState createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: FlatButton(
          onPressed: () {
            getProjectDetails();
          },
          child: Text('Get Data'),
        ),
      ),
    );
  }
}
