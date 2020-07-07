import 'package:coletor_android/utils/ButtonMenu.dart';
import 'package:coletor_android/utils/CardState.dart';
import 'package:coletor_android/utils/ContainerBody.dart';
import 'package:coletor_android/utils/FormWidget.dart';
import 'package:coletor_android/viewModel/ColetorState.dart';
import 'package:flutter/material.dart';

import 'FormColeta.dart';
import 'FormInventario.dart';
import 'FormLote.dart';

class FormMenu extends FormWidget {
  final ColetorState state;

  FormMenu({this.state});

  @override
  _FormMenuState createState() => _FormMenuState();
}

class _FormMenuState extends State<FormMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Coletor - Menu'),
        ),
        body: ContainerBody(
          child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
            CardState(
              state: widget.state,
            ),
            ButtonMenu(
              label: "Inventário",
              onPressed: () {
                widget.navigateTo(
                  context: context,
                  form: () => FormInventario(
                    state: widget.state,
                  ),
                );
              },
            ),
            ButtonMenu(
              label: "Lote",
              onPressed: () {
                widget.navigateTo(
                  context: context,
                  form: () => FormLote(
                    state: widget.state,
                  ),
                );
              },
            ),
            ButtonMenu(
              label: "Coleta",
              onPressed: () {
                widget.navigateTo(
                  context: context,
                  form: () => FormColeta(
                    state: widget.state,
                  ),
                );
              },
            ),
            ButtonMenu(
              label: "Apaga",
              onPressed: () {},
            ),
            ButtonMenu(
              label: "Sair",
              onPressed: () {
                widget.closeForm(context);
              },
            ),
          ]),
        ));
  }
}
