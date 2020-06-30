import 'dart:async';

import 'package:coletor_android/models/UsuarioResult.dart';
import 'package:coletor_android/services/UsuarioService.dart';
import 'package:flutter/material.dart';

class FormLogin extends StatelessWidget {
  final service = UsuarioService();
  var txtMatricla = TextEditingController();
  var txtNome = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coletor'),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Matrícula'),
              keyboardType: TextInputType.number,
              controller: txtMatricla,
            ),
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(labelText: 'Nome'),
              controller: txtNome,
            ),
            RaisedButton(
              onPressed: () {
                final mat = txtMatricla.text;
                final nomeFuture = service.findUsuarioByMatricula(mat);
                nomeFuture.then((value) {
                  processFuture(context, value);
                }).catchError((e) {
                  txtNome.text = "";
                });
              },
              child: const Text(
                'Acessar o Inventário',
              ),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Aviso"),
          content: new Text(msg),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  FutureOr processFuture(context, UsuarioResult value) {
    if (value.erros.length > 0)
      showAlertDialog(context, value.erros.join("\n"));
    txtNome.text = value.usuario?.nome ?? '';
  }
}
