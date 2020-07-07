import 'package:coletor_android/models/LeituraResult.dart';
import 'package:coletor_android/models/UnitResult.dart';

import 'GenericService.dart';

class LeituraService extends GenericService<LeituraResult> {
  LeituraService() : super(modulo: 'leitura');

  Future<LeituraResult> ultimaLeitura(int coletaId) async {
    return methodGet('ultimaLeitura', '$coletaId', (json) => LeituraResult.fromJson(json),
        (erros) => LeituraResult(erros: erros, data: null));
  }

  Future<UnitResult> validaLeitura(String leitura, int coletaId) async {
    return methodPost('validaLeitura', {'leitura': leitura, 'coletaId': coletaId});
  }

  Future<LeituraResult> adicionaLeitura(String leitura, int coletaId) async {
    return methodGet('adicionaLeitura', '$leitura/$coletaId', (json) => LeituraResult.fromJson(json),
        (erros) => LeituraResult(erros: erros, data: null));
  }

  Future<LeituraResult> adicionaErro(String leitura, int coletaId, String message) async {
    return methodGet('adicionaErro', '$leitura/$coletaId/$message', (json) => LeituraResult.fromJson(json),
        (erros) => LeituraResult(erros: erros, data: null));
  }

  Future<UnitResult> apagaTodos(int coletaId) async {
    return methodPost('apagaTodos', {'coletaId': coletaId});
  }

  Future<UnitResult> apagaUltimo(int coletaId) async {
    return methodPost('apagaUltimo', {'coletaId': coletaId});
  }
}
