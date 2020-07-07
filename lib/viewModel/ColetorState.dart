import 'dart:async';

import 'package:coletor_android/models/ColetaResult.dart';
import 'package:coletor_android/models/InventarioResult.dart';
import 'package:coletor_android/models/LojaResult.dart';
import 'package:coletor_android/models/ProdutoResult.dart';
import 'package:coletor_android/models/UsuarioResult.dart';
import 'package:coletor_android/services/ColetaService.dart';
import 'package:coletor_android/services/InventarioService.dart';
import 'package:coletor_android/services/LeituraService.dart';
import 'package:coletor_android/services/LojaService.dart';
import 'package:coletor_android/services/LoteService.dart';
import 'package:coletor_android/services/ProdutoService.dart';
import 'package:coletor_android/services/UsuarioService.dart';
import 'package:coletor_android/viewModel/ViewException.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ColetorState {
  Usuario _usuario;
  Inventario _inventario;
  Loja _loja;
  Coleta _coleta;

  var ctlLoja = TextEditingController();
  var ctlLote = TextEditingController();
  var ctlQuant = TextEditingController();
  var ctlUsuario = TextEditingController();

  final usuarioService = UsuarioService();
  final lojaService = LojaService();
  final inventarioService = InventarioService();
  final coletaService = ColetaService();
  final loteService = LoteService();
  final leituraService = LeituraService();
  final produtoService = ProdutoService();

  Future<void> actionLogin(String matricula, onValue(Usuario value)) async {
    final matInt = int.tryParse(matricula) ?? 0;

    final usuarioFuture = usuarioService.findUsuarioByMatricula(matInt);

    await usuarioFuture.then((usuarioResult) {
      final erros = usuarioResult.erros;
      var usuario = usuarioResult.data;

      setUsuario(usuario);
      ViewException.fail(erros);
    }).catchError((e) {
      setUsuario(null);
    }).whenComplete(() => onValue(_usuario));
  }

  Future<void> actionColeta(String codigoBarras, onValue(Produto produto)) async {
    if (_coleta == null)
      ViewException.fail(["Não existe coleta aberta"]);
    else {
      final coletaId = _coleta.id;

      await leituraService.validaLeitura(codigoBarras, coletaId).then((result) async {
        final erros = result.erros;
        if (erros.isNotEmpty)
          await leituraService.adicionaLeitura(codigoBarras, coletaId).then((leituraResult) async {
            final leitura = leituraResult.data;
            final erros = leituraResult.erros;
            ViewException.fail(erros);
            final produtoId = leitura.produtoId ?? 0;
            await produtoService.findById(produtoId).then((produtoResult) {
              onValue(produtoResult.data);
            });
          });
        else {
          onValue(null);
        }
      });
    }
  }

  bool hasUsuario() => _usuario != null;

  bool hasColetaAberta() => _coleta != null;

  void updateCard() {
    setUsuario(_usuario);
    updateInventario();
  }

  Future<void> updateInventario() async {
    await inventarioService.findAberto().then((inventarioResult) {
      setInventario(inventarioResult.data);
      ViewException.fail(inventarioResult.erros);
    }).catchError((e) {
      setInventario(null);
    });
  }

  Future<void> setInventario(Inventario inventario) async {
    _inventario = inventario;
    if (inventario != null) {
      final lojaId = inventario?.lojaId ?? 0;
      await lojaService.findById(lojaId).then((lojaResult) {
        setLoja(lojaResult.data);
        ViewException.fail(lojaResult.erros);
      }).catchError((e) {
        setLoja(null);
      });
    } else
      setLoja(null);
  }

  void setUsuario(Usuario usuario) {
    _usuario = usuario;
    ctlUsuario.text = usuario?.apelido ?? "";
  }

  setLoja(Loja loja) {
    _loja = loja;
    ctlLoja.text = loja?.nome ?? '';
    updateColeta();
  }

  Future<void> updateColeta() async {
    if (_inventario != null && _usuario != null) {
      final inventarioId = _inventario?.id ?? 0;
      final usuarioId = _usuario?.id ?? 0;
      await coletaService.findColetaAberta(inventarioId, usuarioId).then((coletaResult) {
        setColeta(coletaResult.data);
        ViewException.fail(coletaResult.erros);
      }).catchError((e) {
        setColeta(null);
      });
    } else {
      setColeta(null);
    }
  }

  setColeta(Coleta coleta) async {
    final formatQuant = NumberFormat("0000");
    _coleta = coleta;
    if (coleta == null) {
      ctlLote.text = "Fechado";
      ctlQuant.text = formatQuant.format(0);
    } else {
      final loteId = coleta.loteId ?? 0;
      await loteService.findById(loteId).then((loteResult) async {
        final coletaId = coleta.id;
        final lote = loteResult.data;
        var numero = lote?.numero ?? 0;
        var divergencia = coleta?.numleitura ?? 0;
        final numeroStr = NumberFormat("000").format(numero);
        final divergenciaStr = NumberFormat("00").format(divergencia);
        ctlLote.text = "$numeroStr/$divergenciaStr";
        ViewException.fail(loteResult.erros);
        await coletaService.contaColeta(coletaId).then((quantColeta) {
          ctlQuant.text = formatQuant.format(quantColeta);
          ViewException.fail(quantColeta.erros);
        }).catchError((e) {
          ctlQuant.text = formatQuant.format(0);
        });
      }).catchError((e) {
        setColeta(null);
      });
    }
  }

  Future<void> novoLote(int numLote) async {
    updateColeta();
    if (_coleta == null && _loja != null) {
      final lojaId = _loja.id ?? 0;

      await loteService.findLote(lojaId, numLote).then((loteResult) async {
        final lote = loteResult.data;
        final loteId = lote.id ?? 0;
        final inventarioId = _inventario.id ?? 0;
        final usuarioId = _usuario.id ?? 0;
        ViewException.fail(loteResult.erros);
        await coletaService.createColeta(inventarioId, usuarioId, loteId, usuarioId).then((coletaResult) {
          setColeta(coletaResult.data);
          ViewException.fail(coletaResult.erros);
        }).catchError((e) {
          setColeta(null);
        });
      }).catchError((e) {
        setColeta(null);
      });
    }
  }

  Future<void> fechaColeta() async {
    if (_coleta != null) {
      final coletaId = _coleta.id;
      await coletaService.fechaColeta(coletaId).then((result) {
        updateColeta();
        ViewException.fail(result.erros);
      }).catchError((e) {
        throw e;
      });
    }
  }
}
