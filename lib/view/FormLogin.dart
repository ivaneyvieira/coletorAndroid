import 'dart:async';

import 'package:coletor_android/models/UsuarioResult.dart';
import 'package:coletor_android/utils/ButtonMenu.dart';
import 'package:coletor_android/utils/ContainerBody.dart';
import 'package:coletor_android/utils/FormWidget.dart';
import 'package:coletor_android/utils/TextLabel.dart';
import 'package:coletor_android/viewModel/ColetorState.dart';
import 'package:coletor_android/viewModel/ViewException.dart';
import 'package:flutter/material.dart';

import 'FormMenu.dart';
import 'TextEditField.dart';

class FormLogin extends FormWidget {
  final ColetorState state;

  FormLogin({this.state});

  @override
  _FormLoginWidgetState createState() => _FormLoginWidgetState();
}

class _FormLoginWidgetState extends State<FormLogin> {
  var ctlMatricla = TextEditingController();
  var ctlNome = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coletor'),
      ),
      body: ContainerBody(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            NumberField(
              labelText: 'Matricula',
              controller: ctlMatricla,
              onFieldSubmitted: (txt) {
                //hideKeyboard();
                actionLogin(txt);
              },
            ),
            TextLabel(
              label: 'Nome',
              controller: ctlNome,
            ),
            ButtonMenu(
              label: 'Acessar o Inventário',
              onPressed: () {
                actionLogin(ctlMatricla.text);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> actionLogin(String txt) async {
    try {
      await widget.state.actionLogin(txt, (usuario) => setUsuario(usuario));
    } on ViewException catch (e) {
      widget.toast(e.errorMsg);
    }
  }

  void setUsuario(Usuario usuario) {
    ctlNome.text = usuario?.nome ?? "";
    if (widget.state.hasUsuario())
      navigateToMenu(context);
    else
      widget.toast("Usuário não encontrado");
    widget.state.setUsuario(usuario);
  }

  void navigateToMenu(BuildContext context) {
    widget.navigateTo(context: context, form: () => FormMenu(state: widget.state));
  }
}
