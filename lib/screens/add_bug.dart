import 'package:bugshooapp/screens/project_list.dart';
import 'package:bugshooapp/services/firestore_functions.dart';
import 'package:bugshooapp/utilities/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:bugshooapp/utilities/constants.dart';

class AddBug extends StatefulWidget {
  static String id = 'add_bug';
  @override
  _AddBugState createState() => _AddBugState();
}

class _AddBugState extends State<AddBug> {
  String title;
  String description = '';
  bool _savingData = false;
  String projectDropDownValue;

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
            Container(
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
            Container(
              child: TextField(
                onChanged: (value) {
                  description = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Bug Description',
                ),
              ),
            ),
            SizedBox(
              height: 14.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DropdownButton(
                  value: projectDropDownValue,
                  hint: Text('Select a project'),
                  items: //projectDropDownList(),
                      [
                    DropdownMenuItem(
                      child: Text(kProjectList[0]),
                      value: kProjectList[0],
                    ),
                    DropdownMenuItem(
                      child: Text(kProjectList[1]),
                      value: kProjectList[1],
                    ),
                    DropdownMenuItem(
                      child: Text(kProjectList[2]),
                      value: kProjectList[2],
                    ),
                    DropdownMenuItem(
                      child: Text(kProjectList[3]),
                      value: kProjectList[3],
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      projectDropDownValue = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 14.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text(
                    'Add Bug',
                    style: kButtonTextStyle,
                  ),
                  onPressed: () {
                    setState(() {
                      _savingData = true;
                    });
                    try {
                      addBugs(title, description, projectDropDownValue);
                      setState(() {
                        _savingData = false;
                      });
                    } catch (e) {
                      print(e);
                    }

                    Navigator.pushNamed(context, ProjectList.id);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

List<DropdownMenuItem> projectDropDownList() {
  List<DropdownMenuItem> list = <DropdownMenuItem>[];

  for (String listItem in kProjectList) {
    final dropDownItem = DropdownMenuItem(
      child: Text(listItem),
      value: listItem,
    );

    list.add(dropDownItem);
  }

  return list;
}
