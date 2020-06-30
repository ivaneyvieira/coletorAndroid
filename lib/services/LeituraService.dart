import 'package:coletor_android/models/LeituraResult.dart';
import 'package:coletor_android/models/UnitResult.dart';

import 'GenericService.dart';

class LeituraService extends GenericService<LeituraResult> {
  LeituraService() : super(modulo: 'leitura');

  @override
  LeituraResult fromJson(Map<String, dynamic> json) {
    return LeituraResult.fromJson(json);
  }

  @override
  LeituraResult fromJsonErro(List<String> erros) {
    return LeituraResult(erros: erros, data: null);
  }

  Future<LeituraResult> ultimaLeitura(int coletaId) async {
    return methodGet('ultimaLeitura', '$coletaId');
  }

  Future<UnitResult> validaLeitura(String leitura, int coletaId) async {
    return methodPost('validaLeitura', {'leitura': leitura, 'coletaId': coletaId});
  }

  Future<LeituraResult> adicionaLeitura(String leitura, int coletaId) async {
    return methodGet('adicionaLeitura', '$leitura/$coletaId');
  }

  Future<LeituraResult> adicionaErro(String leitura, int coletaId, String message) async {
    return methodGet('adicionaErro', '$leitura/$coletaId/$message');
  }

  Future<UnitResult> apagaTodos(int coletaId) async {
    return methodPost('apagaTodos', {'coletaId': coletaId});
  }

  Future<UnitResult> apagaUltimo(int coletaId) async {
    return methodPost('apagaUltimo', {'coletaId': coletaId});
  }
}
