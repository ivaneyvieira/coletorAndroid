import 'package:coletor_android/utils/ButtonMenu.dart';
import 'package:coletor_android/utils/CardState.dart';
import 'package:coletor_android/utils/ContainerBody.dart';
import 'package:coletor_android/utils/FormWidget.dart';
import 'package:coletor_android/viewModel/ColetorState.dart';
import 'package:coletor_android/viewModel/ViewException.dart';
import 'package:flutter/material.dart';

import 'TextEditField.dart';

class FormLote extends FormWidget {
  final ColetorState state;

  FormLote({this.state});

  @override
  _FormLoteState createState() => _FormLoteState();
}

class _FormLoteState extends State<FormLote> {
  var ctlLote = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Coletor - Lote'),
        ),
        body: ContainerBody(
          child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
            CardState(
              state: widget.state,
            ),
            NumberField(
              labelText: 'Lote',
              onFieldSubmitted: (txt) {
                actionLote(txt);
              },
              controller: ctlLote,
            ),
            ButtonMenu(
                label: "Confirma",
                onPressed: () {
                  actionLote(ctlLote.text);
                }),
            ButtonMenu(
              label: "Sair",
              onPressed: () {
                widget.closeForm(context);
              },
            ),
          ]),
        ));
  }

  void actionLote(txt) {
    try {
      if (widget.state.hasColetaAberta())
        widget.showConfirm(
            context: context,
            msg: 'Deseja fechar a coleta aberta',
            onPressedYes: () {
              try {
                widget.state.fechaColeta();
                widget.closeForm(context);
              } on ViewException catch (e) {
                widget.toast(e.errorMsg);
              }
            });
      else {
        int numLote = int.tryParse(txt) ?? 0;
        widget.state.novoLote(numLote);
        widget.closeForm(context);
      }
    } on ViewException catch (e) {
      widget.toast(e.toString());
    }
  }
}
