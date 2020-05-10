import 'package:bugshooapp/services/firestore_functions.dart';
import 'package:bugshooapp/utilities/app_drawer.dart';
import 'package:bugshooapp/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class AddProject extends StatefulWidget {
  static String id = 'add_project';
  @override
  _AddProjectState createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  bool _savingData = false;
  String _projectName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Project'),
      ),
      drawer: AppDrawer(),
      body: ModalProgressHUD(
        inAsyncCall: _savingData,
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: TextField(
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter The Project Name'),
                  onChanged: (value) {
                    _projectName = value;
                  },
                ),
              ),
              Row(
                children: <Widget>[
                  RaisedButton(
                    child: Text('Submit'),
                    onPressed: () {
                      setState(() {
                        _savingData = true;
                      });
                      try {
                        addProject(_projectName);
                        setState(() {
                          _savingData = false;
                          Navigator.pop(context);
                        });
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                  RaisedButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
