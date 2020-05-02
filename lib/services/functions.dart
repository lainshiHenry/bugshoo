import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseUser loggedInUser;
final _auth = FirebaseAuth.instance;
var user;

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
    case 'Completed':
      text = 'Completed';
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

void getCurrentUser() async {
  user = await _auth.currentUser();
  if (user != null) {
    try {
      loggedInUser = user;
      print(loggedInUser.email);
    } catch (e) {
      print(e);
    }
  }
}
