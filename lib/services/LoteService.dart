import 'package:coletor_android/models/LoteResult.dart';

import 'GenericService.dart';

class LoteService extends GenericService {
  LoteService() : super(modulo: 'lote');

  Future<LoteResult> findById(int id) async {
    return methodGet(
        'findById', '$id', (json) => LoteResult.fromJson(json), (erros) => LoteResult(erros: erros, data: null));
  }

  Future<LoteResult> findLote(int lojaId, int numLote) async {
    return methodGet('findLote', '$lojaId/$numLote', (json) => LoteResult.fromJson(json),
        (erros) => LoteResult(erros: erros, data: null));
  }
}
