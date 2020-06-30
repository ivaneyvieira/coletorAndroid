import 'package:flutter/material.dart';

class FormMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Coletor - Menu'),
        ),
        body: Container(
          margin: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
          child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
            RaisedButton(
              onPressed: () {},
              child: const Text(
                'Lote',
              ),
            ),
            RaisedButton(
              onPressed: () {},
              child: const Text(
                'Coleta',
              ),
            ),
            RaisedButton(
              onPressed: () {},
              child: const Text(
                'Apaga',
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Fechar',
              ),
            ),
          ]),
        ));
  }
}
