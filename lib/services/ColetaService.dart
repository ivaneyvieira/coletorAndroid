import 'package:coletor_android/models/ColetaResult.dart';
import 'package:coletor_android/models/UnitResult.dart';

import 'GenericService.dart';

class ColetaService extends GenericService<ColetaResult> {
  ColetaService() : super(modulo: 'coleta');

  @override
  ColetaResult fromJson(Map<String, dynamic> json) {
    return ColetaResult.fromJson(json);
  }

  @override
  ColetaResult fromJsonErro(List<String> erros) {
    return ColetaResult(erros: erros, data: null);
  }

  Future<UnitResult> fechaColeta(int coletaId) async {
    return methodPost('fechaColeta', {'coletaId': coletaId});
  }

  Future<ColetaResult> findColetaAberta(int inventarioId, int usuarioId) async {
    return methodGet('findColetaAberta', '$inventarioId/$usuarioId');
  }

  Future<UnitResult> mudaLote(int coletaId, int loteId, int inventarioId, int usuarioId, int coletorNum) async {
    return methodPost('mudaLote', {
      'coletaId': coletaId,
      'loteId': loteId,
      'inventarioId': inventarioId,
      'usuarioId': usuarioId,
      'coletorNum': coletorNum,
    });
  }
}
