import 'package:coletor_android/models/ProdutoResult.dart';
import 'package:coletor_android/models/UnitResult.dart';

import 'GenericService.dart';

class ProdutoService extends GenericService<ProdutoResult> {
  ProdutoService() : super(modulo: 'produto');

  @override
  ProdutoResult fromJson(Map<String, dynamic> json) {
    return ProdutoResult.fromJson(json);
  }

  @override
  ProdutoResult fromJsonErro(List<String> erros) {
    return ProdutoResult(erros: erros, data: null);
  }

  Future<ProdutoResult> findById(int id) async {
    return methodGet('findById', '$id');
  }
}
