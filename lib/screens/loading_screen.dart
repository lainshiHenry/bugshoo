import 'dart:async';
import 'package:bugshooapp/screens/project_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bugshooapp/services/user_profile.dart';

class LoadingScreen extends StatefulWidget {
  static String id = 'loading_screen';

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  void loadProfile() async {
    Future<String> userUID =
        FirebaseAuth.instance.currentUser().then((value) => value.uid);
    userUID.then((value) => loadingProfile(value));
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, ProjectList.id);
    });
  }

  void loadingProfile(String uID) async {
    try {
      final queryResult = await Firestore.instance
          .collection('users')
          .where('uID', isEqualTo: uID)
          .getDocuments();

      for (var queryItem in queryResult.documents) {
        final List<String> authProjectList = [];

        for (var authProjIndex in queryItem.data['authorizedProjects']) {
          authProjectList.add(authProjIndex.toString());
        }

        final profile = new UserProfile(
          uID: uID,
          firstName: queryItem.data['firstName'],
          lastName: queryItem.data['lastName'],
          emailAddress: queryItem.data['email'],
          authorizedProject: authProjectList,
        );
        currentUser = profile;
        print(currentUser.authorizedProject);
      }
      print('Proile Load Completed');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              strokeWidth: 5.0,
            ),
            Text('Loading...'),
          ],
        ),
      ),
    );
  }
}
