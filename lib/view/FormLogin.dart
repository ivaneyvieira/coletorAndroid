import 'dart:async';

import 'package:coletor_android/models/InventarioResult.dart';
import 'package:coletor_android/models/UsuarioResult.dart';
import 'package:coletor_android/utils/ButtonMenu.dart';
import 'package:coletor_android/utils/ContainerBody.dart';
import 'package:coletor_android/utils/FormWidget.dart';
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

  List<Inventario> _inventarios = List();
  List<DropdownMenuItem<Inventario>> _dropdownMenuItems;
  Inventario _selectedInventario;

  @override
  void initState() {
    super.initState();
    final future = widget.state.findInventarioAberto();
    future.then((list) {
      setState(() {
        _inventarios.addAll(list);

        _dropdownMenuItems = buildDropdownMenuItems(_inventarios);

        _selectedInventario = _dropdownMenuItems[0].value;

        widget.state.setInventario(_selectedInventario);
      });
    });
  }

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
            ),
            DropdownButton(
              value: _selectedInventario,
              items: _dropdownMenuItems,
              onChanged: onChangeDropdownItem,
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
      final usuario = await widget.state.actionLogin(txt);
      setUsuario(usuario);
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

  String textInventario(Inventario inventario) {
    final loja = widget.state.getLoja(inventario.lojaId);
    return "Invenário ${loja.sigla} ${inventario.numero}";
  }

  List<DropdownMenuItem<Inventario>> buildDropdownMenuItems(List<Inventario> inventarios) {
    return inventarios.map((inventario) {
      final text = textInventario(inventario);
      return DropdownMenuItem(
        value: inventario,
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }).toList();
  }

  Future<void> onChangeDropdownItem(Inventario inventario) async {
    await widget.state.setInventario(inventario);
  }
}
