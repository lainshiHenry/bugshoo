import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color roundedButtonColour;
  final String roundedButtonText;
  final Function onPressed;

  RoundedButton(
      {@required this.roundedButtonColour,
      @required this.roundedButtonText,
      @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: roundedButtonColour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            roundedButtonText,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
