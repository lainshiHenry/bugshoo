import 'package:flutter/material.dart';
import 'package:bugshooapp/utilities/constants.dart';

Text bugStatus(bugStatus) {
  String text;
  TextStyle textStyle;

  switch (bugStatus) {
    case kBugStatus.Open:
      text = 'Open';
      textStyle = TextStyle(
        color: Colors.black,
        backgroundColor: Colors.white,
      );
      break;
    case kBugStatus.InProgress:
      text = 'In Progress';
      textStyle = TextStyle(
        color: Colors.white,
        backgroundColor: Colors.redAccent,
      );
      break;
    case kBugStatus.Testing:
      text = 'Testing';
      textStyle = TextStyle(
        color: Colors.black,
        backgroundColor: Colors.lightGreen,
      );
      break;
    case kBugStatus.Completed:
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
