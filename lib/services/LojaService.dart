import 'package:coletor_android/models/LojaResult.dart';

import 'GenericService.dart';

class LojaService extends GenericService {
  LojaService() : super(modulo: 'loja');

  Future<LojaResult> findById(int id) async {
    return methodGet(
        'findById', '$id', (json) => LojaResult.fromJson(json), (erros) => LojaResult(erros: erros, data: null));
  }
}
