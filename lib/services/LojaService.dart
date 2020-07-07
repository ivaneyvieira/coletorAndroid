import 'package:coletor_android/models/LojaResult.dart';

import 'GenericService.dart';

class LojaService extends GenericService<LojaResult> {
  LojaService() : super(modulo: 'loja');

  @override
  LojaResult fromJson(Map<String, dynamic> json) {
    return LojaResult.fromJson(json);
  }

  @override
  LojaResult fromJsonErro(List<String> erros) {
    return LojaResult(erros: erros, data: null);
  }

  Future<LojaResult> findById(int id) async {
    return methodGet(
        'findById', '$id', (json) => LojaResult.fromJson(json), (erros) => LojaResult(erros: erros, data: null));
  }
}
