import 'package:flutter/material.dart';

class ButtonMenu extends RaisedButton {
  final String label;
  final VoidCallback onPressed;

  ButtonMenu({this.label, this.onPressed})
      : super(
            onPressed: onPressed,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: new Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            textColor: Colors.white,
            color: Colors.lightBlue);
}
