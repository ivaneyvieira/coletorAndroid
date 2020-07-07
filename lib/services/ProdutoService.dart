import 'package:coletor_android/models/ProdutoResult.dart';

import 'GenericService.dart';

class ProdutoService extends GenericService {
  ProdutoService() : super(modulo: 'produto');

  Future<ProdutoResult> findById(int id) async {
    return methodGet(
        'findById', '$id', (json) => ProdutoResult.fromJson(json), (erros) => ProdutoResult(erros: erros, data: null));
  }
}
