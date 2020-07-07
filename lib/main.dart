import 'dart:async';

import 'package:coletor_android/utils/FormWidget.dart';
import 'package:coletor_android/view/FormLogin.dart';
import 'package:coletor_android/viewModel/ColetorState.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MaterialApp(home: ColetorApp()));
}

class ColetorApp extends FormWidget {
  final state = ColetorState();

  @override
  _ColetorWidgetState createState() => _ColetorWidgetState();
}

class _ColetorWidgetState extends State<ColetorApp> {
  String matricula = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coletor App',
      home: FormLogin(
        state: widget.state,
      ),
    );
  }
}
