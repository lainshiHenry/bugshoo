import 'package:flutter/material.dart';
import 'package:bugshooapp/utilities/bottom_navigation.dart';

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
      body: Text('Body'),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Project List');
  }
}
