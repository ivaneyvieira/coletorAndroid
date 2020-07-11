import 'package:coletor_android/models/ProdutoResult.dart';
import 'package:coletor_android/utils/ButtonMenu.dart';
import 'package:coletor_android/utils/ContainerBody.dart';
import 'package:coletor_android/utils/FormWidget.dart';
import 'package:coletor_android/utils/TextLabel.dart';
import 'package:coletor_android/viewModel/ColetorState.dart';
import 'package:coletor_android/viewModel/ViewException.dart';
import 'package:flutter/material.dart';

import 'FormMenu.dart';
import 'TextEditField.dart';

class FormColeta extends FormWidget {
  final ColetorState state;

  FormColeta({this.state});

  @override
  _FormColetaWidgetState createState() => _FormColetaWidgetState();
}

class _FormColetaWidgetState extends State<FormColeta> {
  final ctlLeitura = TextEditingController();

  final ctlBarra = TextEditingController();
  final ctlCodigoGrade = TextEditingController();
  final ctlDescricao = TextEditingController();

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
            Row(
              children: [
                Expanded(
                  child: TextLabel(
                    label: 'Código de Barra',
                    controller: ctlBarra,
                  ),
                ),
                Expanded(
                  child: TextLabel(
                    label: 'Código/Grade',
                    controller: ctlCodigoGrade,
                  ),
                ),
              ],
            ),
            TextLabel(
              label: 'Descrição',
              controller: ctlDescricao,
            ),
            NumberField(
              labelText: 'Código de barras',
              controller: ctlLeitura,
              onFieldSubmitted: (txt) {
                actionCodigoBarras(txt);
              },
            ),
            ButtonMenu(
              label: 'Confirma',
              onPressed: () {
                actionCodigoBarras(ctlLeitura.text);
              },
            ),
          ],
        ),
      ),
    );
  }

  void actionCodigoBarras(String txt) {
    try {
      widget.state.actionColeta(txt, (produto) => setProduto(produto));
    } on ViewException catch (e) {
      widget.toast(e.toString());
    }
  }

  void setProduto(Produto produto) {
    ctlBarra.text = produto?.barcode ?? "";
    ctlCodigoGrade.text = "${produto?.codigo?.trim() ?? ""}-${produto?.grade ?? ""}";
    ctlDescricao.text = produto?.descricao ?? "";
  }

  void navigateToMenu(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FormMenu(
                state: widget.state,
              )),
    );
  }
}
