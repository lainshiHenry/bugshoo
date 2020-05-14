import 'package:bugshooapp/utilities/app_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bugshooapp/utilities/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:bugshooapp/utilities/arguments.dart';
import 'package:bugshooapp/services/firestore_functions.dart';

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
    String projectName = args.projectName;
    String currentUser = loggedInUser;
    bool _savingData = false;

    return Scaffold(
      appBar: AppBar(
        title: Text('Bug $bugID'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      drawer: AppDrawer(),
      body: Builder(
        builder: (context) => ModalProgressHUD(
          inAsyncCall: _savingData,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Description: $description'),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      String snackBarText;
                      setState(() => _savingData = true);

                      snackBarText = await assignBugToUser(
                        projectName: projectName,
                        timestamp: timestamp,
                        name: currentUser,
                      );

                      setState(() => _savingData = false);

                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(snackBarText),
                        ),
                      );
                    },
                    child: Text(
                      'Assign to Self',
                      style: kButtonTextStyle,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      String snackBarText;

                      setState(() => _savingData = true);

                      snackBarText = await resolveBug(
                        projectName: projectName,
                        timestamp: timestamp,
                      );

                      setState(() => _savingData = false);

                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(snackBarText),
                        ),
                      );
                    },
                    child: Text(
                      'Bug Resolved',
                      style: kButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
