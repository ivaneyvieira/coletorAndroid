import 'package:coletor_android/viewModel/ColetorState.dart';
import 'package:flutter/material.dart';

import 'TextLabel.dart';

class CardState extends Card {
  final ColetorState state;

  CardState({this.state})
      : super(
            //color: Colors.blueGrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextLabel(
                            label: 'Loja',
                            controller: state.ctlLoja,
                          ),
                        ),
                        Expanded(
                          child: TextLabel(
                            label: 'Usuário',
                            controller: state.ctlUsuario,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextLabel(
                            label: 'Lote',
                            controller: state.ctlLote,
                          ),
                        ),
                        Expanded(
                          child: TextLabel(
                            label: 'Quant',
                            controller: state.ctlQuant,
                          ),
                        ),
                      ],
                    ),
                  ],
                )));
}
