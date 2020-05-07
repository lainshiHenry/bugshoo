import 'package:bugshooapp/screens/add_bug.dart';
import 'package:bugshooapp/services/firestore_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bugshooapp/utilities/app_drawer.dart';
import 'package:bugshooapp/services/functions.dart';

class AllBugs extends StatefulWidget {
  static String id = 'all_bugs';
  @override
  _AllBugsState createState() => _AllBugsState();
}

class _AllBugsState extends State<AllBugs> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget listDisplayArea = returnAllBugs();

    return Scaffold(
      appBar: AppBar(
        title: Text('All Bugs'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () {
                setState(() {
                  listDisplayArea = returnNonResolvedBugs();
                });
              }),
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, AddBug.id);
              })
        ],
      ),
      drawer: AppDrawer(),
      body: SafeArea(
        child: listDisplayArea,
      ),
    );
  }
}
