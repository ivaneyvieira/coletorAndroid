import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberField extends TextFormField {
  var labelText;
  var hintText;
  var controller;
  var onFieldSubmitted;
  var icon;

  NumberField({this.labelText, this.hintText, this.controller, this.onFieldSubmitted})
      : super(
          decoration: InputDecoration(labelText: labelText, hintText: hintText),
          autofocus: true,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly],
          controller: controller,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: onFieldSubmitted,
        );
}
