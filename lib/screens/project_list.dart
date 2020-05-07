import 'package:bugshooapp/services/firestore_functions.dart';
import 'package:bugshooapp/utilities/app_drawer.dart';
import 'package:flutter/material.dart';

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
      ),
      drawer: AppDrawer(),
      body: returnProjectList(),
    );
  }
}
