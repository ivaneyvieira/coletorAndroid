import 'dart:async';

import 'package:coletor_android/models/ColetaResult.dart';
import 'package:coletor_android/models/GenericResult.dart';
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

extension FutureData<T> on Future<GenericResult<T>> {
  Future<T> getData() async {
    final GenericResult<T> result = await this;
    ViewException.fail(result.erros);
    return result.data;
  }

  Future<void> execute() async {
    final GenericResult<T> result = await this;
    ViewException.fail(result.erros);
  }
}

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

  List<Loja> _lojas;

  ColetorState() {
    lojaService.findAll().getData().then((value) => _lojas = value);
  }

  Future<Usuario> actionLogin(String matricula) async {
    final matInt = int.tryParse(matricula) ?? 0;
    final usuario = await usuarioService.findUsuarioByMatricula(matInt).getData();
    setUsuario(usuario);
    return usuario;
  }

  Future<Produto> actionColeta(String codigoBarras) async {
    if (_coleta == null) {
      ViewException.fail(["Não existe coleta aberta"]);
      return null;
    } else {
      final coletaId = _coleta.id;
      await leituraService.validaLeitura(codigoBarras, coletaId).getData();

      final leitura = await leituraService.adicionaLeitura(codigoBarras, coletaId).getData();

      final produtoId = leitura.produtoId ?? 0;
      final produto = await produtoService.findById(produtoId).getData();

      return produto;
    }
  }

  bool hasUsuario() => _usuario != null;

  bool hasColetaAberta() => _coleta != null;

  bool hasInventario() => _inventario != null;

  Inventario getInventario() => _inventario;

  Future<List<Inventario>> findInventarioAberto() async {
    return await inventarioService.findAberto().getData();
  }

  Future<void> setInventario(Inventario inventario) async {
    _inventario = inventario;
    if (inventario != null) {
      final lojaId = inventario?.lojaId ?? 0;
      final loja = getLoja(lojaId);
      setLoja(loja);
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

  Future<Coleta> findColetaAberta() async {
    if (_inventario != null && _usuario != null) {
      final inventarioId = _inventario?.id ?? 0;
      final usuarioId = _usuario?.id ?? 0;
      return await coletaService.findColetaAberta(inventarioId, usuarioId).getData();
    } else {
      return null;
    }
  }

  Loja getLoja(int lojaId)  {
    if(_lojas == null)
      lojaService.findAll().getData().then((value) {
         _lojas = value;
         return _lojas.firstWhere((loja) => loja.id == lojaId);
      });
    return _lojas.firstWhere((loja) => loja.id == lojaId);
  }

  Future<void> updateColeta() async {
    if(hasInventario()) {
      final coleta = await findColetaAberta();
      setColeta(coleta);
    }else{
      setColeta(null);
    }
  }

  setColeta(Coleta coleta) async {
    final formatQuant = NumberFormat("0000");
    _coleta = coleta;
    if(_inventario == null){
      ctlLote.text = '';
      ctlQuant.text = '';
    }else
    if (coleta == null) {
      ctlLote.text = "Fechado";
      ctlQuant.text = formatQuant.format(0);
    } else {
      final loteId = coleta.loteId ?? 0;
      final lote = await loteService.findById(loteId).getData();
      final coletaId = coleta.id;
      var numero = lote?.numero ?? 0;
      var divergencia = coleta?.numleitura ?? 0;
      final numeroStr = NumberFormat("000").format(numero);
      final divergenciaStr = NumberFormat("00").format(divergencia);
      ctlLote.text = "$numeroStr/$divergenciaStr";
      ctlQuant.text = formatQuant.format(0);
      final quantColeta = await coletaService.contaColeta(coletaId).getData();
      ctlQuant.text = formatQuant.format(quantColeta ?? 0);
    }
  }

  Future<void> novoLote(int numLote) async {
    updateColeta();
    if (_coleta == null && _loja != null) {
      final lojaId = _loja.id ?? 0;
      final lote = await loteService.findLote(lojaId, numLote).getData();
      final loteId = lote.id ?? 0;
      final inventarioId = _inventario.id ?? 0;
      final usuarioId = _usuario.id ?? 0;
      final coleta = await coletaService.createColeta(inventarioId, usuarioId, loteId, usuarioId).getData();
      setColeta(coleta);
    }
  }

  Future<void> fechaColeta() async {
    if (_coleta != null) {
      final coletaId = _coleta.id;
      await coletaService.fechaColeta(coletaId).execute();
      updateColeta();
    }
  }
}
