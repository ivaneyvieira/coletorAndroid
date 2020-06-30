import 'dart:async';

import 'package:coletor_android/models/UsuarioResult.dart';
import 'package:coletor_android/services/UsuarioService.dart';
import 'package:coletor_android/view/FormLogin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ColetorApp()));
}

class ColetorApp extends StatefulWidget {
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
      home: FormLogin(),
    );
  }
}
