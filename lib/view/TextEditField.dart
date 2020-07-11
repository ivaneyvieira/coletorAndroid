import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberField extends TextFormField {
  final labelText;
  final hintText;
  final controller;
  final onFieldSubmitted;

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
