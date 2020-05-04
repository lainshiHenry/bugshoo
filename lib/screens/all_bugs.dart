import 'package:bugshooapp/screens/add_bug.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bugshooapp/utilities/app_drawer.dart';
import 'package:bugshooapp/services/functions.dart';
import 'package:bugshooapp/services/stream_list_builder.dart';

class AllBugs extends StatefulWidget {
  static String id = 'all_bugs';
  @override
  _AllBugsState createState() => _AllBugsState();
}

class _AllBugsState extends State<AllBugs> {
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Bugs'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, AddBug.id);
              })
        ],
      ),
      drawer: AppDrawer(),
      body: BugList(),
    );
  }
}

class BugList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          StreamListBuilder(),
        ],
      ),
    );
  }
}
