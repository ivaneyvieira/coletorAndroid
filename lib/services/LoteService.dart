
import 'package:coletor_android/models/LoteResult.dart';
import 'package:coletor_android/models/UnitResult.dart';

import 'GenericService.dart';

class LoteService extends GenericService<LoteResult> {
  LoteService() : super(modulo: 'lote');

  @override
  LoteResult fromJson(Map<String, dynamic> json) {
    return LoteResult.fromJson(json);
  }

  @override
  LoteResult fromJsonErro(List<String> erros) {
    return LoteResult(erros: erros, data: null);
  }

  Future<LoteResult> findById(int id ) async {
  return methodGet('findById', '$id');
  }

  Future<LoteResult> findLote(int lojaId, int numLote) async {
  return methodGet('findLote', '$lojaId/$numLote');
  }
}
