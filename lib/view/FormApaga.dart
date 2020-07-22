import 'package:coletor_android/models/ProdutoResult.dart';
import 'package:coletor_android/utils/ButtonMenu.dart';
import 'package:coletor_android/utils/ContainerBody.dart';
import 'package:coletor_android/utils/FormWidget.dart';
import 'package:coletor_android/utils/TextLabel.dart';
import 'package:coletor_android/viewModel/ColetorState.dart';
import 'package:flutter/material.dart';

import 'FormMenu.dart';
import 'TextEditField.dart';

class FormApaga extends FormWidget {
  final ColetorState state;

  FormApaga({this.state});

  @override
  _FormApagaWidgetState createState() => _FormApagaWidgetState();
}

class _FormApagaWidgetState extends State<FormApaga> {
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

  Future<void> actionCodigoBarras(String txt) async {

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
