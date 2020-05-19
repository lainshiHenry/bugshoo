import 'package:bugshooapp/screens/add_project.dart';
import 'package:bugshooapp/screens/all_bugs_by_project.dart';
import 'package:bugshooapp/services/user_profile.dart';
import 'package:bugshooapp/utilities/app_drawer.dart';
import 'package:bugshooapp/utilities/arguments.dart';
import 'package:bugshooapp/utilities/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final _firestoreInstance = Firestore.instance;
int projectListCount;

class ProjectList extends StatefulWidget {
  static String id = 'project_list';
  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project List'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                print('Add Button Pressed');
                Navigator.pushNamed(context, AddProject.id);
              }),
        ],
      ),
      drawer: AppDrawer(),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestoreInstance
            .collection('projectList')
            .where('projectName', whereIn: currentUser.authorizedProject)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final nameList = snapshot.data.documents;
          List<ListTile> projectNameList = [];

          for (var projectNameListItem in nameList) {
            final String projectName = projectNameListItem.data['projectName'];

            final listItem = ListTile(
              title: Text(projectName),
              onTap: () {
                Navigator.pushNamed(context, AllBugsByProject.id,
                    arguments: AllBugsByProjectArguments(projectName));
              },
            );
            projectNameList.add(listItem);
            kProjectList.add(projectName);
            projectListCount = projectNameList.length + 1;
          }
          print(currentUser);

          return Container(
              child: ListView.separated(
            itemCount: projectNameList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: projectNameList[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              thickness: 2.0,
              indent: 30.0,
              endIndent: 30.0,
            ),
          ));
        },
      ),
    );
  }
}
