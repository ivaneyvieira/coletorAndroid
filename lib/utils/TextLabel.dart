import 'package:flutter/material.dart';

class TextLabel extends TextField {
  final String label;

  final TextEditingController controller;

  TextLabel({this.label, this.controller})
      : super(
          readOnly: true,
          decoration: InputDecoration(labelText: label),
          controller: controller,
        );
}
