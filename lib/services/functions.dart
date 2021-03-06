import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseUser loggedInUser;

Widget bugStatus(bugStatus) {
  String text;
  TextStyle textStyle;

  switch (bugStatus) {
    case 'Open':
      text = 'Open';
      textStyle = TextStyle(
        color: Colors.black,
        backgroundColor: Colors.white,
      );
      break;
    case 'In Progress':
      text = 'In Progress';
      textStyle = TextStyle(
        color: Colors.white,
        backgroundColor: Colors.redAccent,
      );
      break;
    case 'Testing':
      text = 'Testing';
      textStyle = TextStyle(
        color: Colors.black,
        backgroundColor: Colors.lightGreen,
      );
      break;
    case 'Resolved':
      text = 'Resolved';
      textStyle = TextStyle(
        color: Colors.white,
        backgroundColor: Colors.green[900],
      );
      break;
    default:
      text = 'Unknown';
      textStyle = TextStyle(
        backgroundColor: Colors.grey,
      );
  }
  return Text(
    text,
    style: textStyle,
  );
}

Future<FirebaseUser> getCurrentUser() async {
  final _auth = FirebaseAuth.instance;
  final _user = await _auth.currentUser();
  if (_user != null) {
    try {
      loggedInUser = _user;
    } catch (e) {
      print(e);
    }
  }
  return _user;
}

void signOutCurrentUser() async {
  final _auth = FirebaseAuth.instance;

  try {
    _auth.signOut();
  } catch (e) {
    print(e);
  }
}
