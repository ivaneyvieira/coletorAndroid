import 'package:coletor_android/utils/ButtonMenu.dart';
import 'package:coletor_android/utils/CardState.dart';
import 'package:coletor_android/utils/ContainerBody.dart';
import 'package:coletor_android/utils/FormWidget.dart';
import 'package:coletor_android/viewModel/ColetorState.dart';
import 'package:flutter/material.dart';

import 'FormApaga.dart';
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
  void initForm(context) async {
    final list = await widget.state.findInventarioAberto();
    if (list.isEmpty) {
      widget.toast("Não há inventário Aberto");
      widget.closeForm(context);
      await widget.state.setInventario(null);
    } else if (list.length == 1) {
      await widget.state.setInventario(list.first);
    } else if (list.length > 1) {
      if (widget.state.hasInventario()) {
        final inventarioSalvo = widget.state.getInventario();
        if (list.contains(inventarioSalvo))
          await widget.state.setInventario(inventarioSalvo);
        else {
          await widget.state.setInventario(null);
          navigateToFormInventario(context);
        }
      } else
        navigateToFormInventario(context);
    }
    if (widget.state.hasInventario() == false) {
      await widget.state.updateColeta();
      if (widget.state.hasColetaAberta())
        navigateToFormColeta(context);
      else
        navigateToFormLote(context);
    }
  }

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
              label: "Lote",
              onPressed: () {
                navigateToFormLote(context);
              },
            ),
            ButtonMenu(
              label: "Coleta",
              onPressed: () {
                navigateToFormColeta(context);
              },
            ),
            ButtonMenu(
              label: "Apaga",
              onPressed: () {
                navigateToFormApaga(context);
              },
            ),
          ]),
        ));
  }

  void navigateToFormInventario(BuildContext context) {
    widget.navigateTo(
      context: context,
      form: () => FormInventario(
        state: widget.state,
      ),
    );
  }

  void navigateToFormLote(BuildContext context) {
    widget.navigateTo(
      context: context,
      form: () => FormLote(
        state: widget.state,
      ),
    );
  }

  void navigateToFormColeta(BuildContext context) {
    widget.navigateTo(
      context: context,
      form: () => FormColeta(
        state: widget.state,
      ),
    );
  }

  void navigateToFormApaga(BuildContext context) {
    widget.navigateTo(
      context: context,
      form: () => FormApaga(
        state: widget.state,
      ),
    );
  }
}
