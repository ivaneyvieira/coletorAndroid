
import 'package:coletor_android/utils/ButtonMenu.dart';
import 'package:coletor_android/utils/CardState.dart';
import 'package:coletor_android/utils/ContainerBody.dart';
import 'package:coletor_android/utils/FormWidget.dart';
import 'package:coletor_android/viewModel/ColetorState.dart';
import 'package:flutter/material.dart';

class FormInventario extends FormWidget {
  final ColetorState state;

  FormInventario({this.state});

  @override
  _FormInventarioState createState() => _FormInventarioState();
}

class _FormInventarioState extends State<FormInventario> {
  var ctlInventario = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Coletor - Inventário'),
        ),
        body: ContainerBody(
          child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
            CardState(
              state: widget.state,
            ),
            Text("Selecione um inventário"),

            ButtonMenu(
                label: "Confirma",
                onPressed: () {
                  actionInventario(ctlInventario.text);
                  widget.closeForm(context);
                }),
          ]),
        ));
  }

  void actionInventario(txt) {}




}
