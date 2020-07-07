import 'package:coletor_android/models/ColetaResult.dart';
import 'package:coletor_android/models/IntResult.dart';
import 'package:coletor_android/models/UnitResult.dart';
import 'package:dio/dio.dart';

import 'ConfigService.dart';
import 'GenericService.dart';

class ColetaService extends GenericService {
  ColetaService() : super(modulo: 'coleta');

  Future<UnitResult> fechaColeta(int coletaId) async {
    return methodPost('fechaColeta', {'coletaId': coletaId});
  }

  Future<ColetaResult> findColetaAberta(int inventarioId, int usuarioId) async {
    return methodGet('findColetaAberta', '$inventarioId/$usuarioId', (json) => ColetaResult.fromJson(json),
        (erros) => ColetaResult(erros: erros, data: null));
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

  Future<ColetaResult> createColeta(int inventarioId, int usuarioId, int loteId, int coletorNum) async {
    return methodGet('createColeta', '$inventarioId/$usuarioId/$loteId/$coletorNum',
        (json) => ColetaResult.fromJson(json), (erros) => ColetaResult(erros: erros, data: null));
  }

  Future<IntResult> contaColeta(int coletaId) async {
    try {
      Response response = await ConfigService.dio.get('${ConfigService.urlBase}/$modulo/contaColeta/$coletaId',
          options: Options(headers: <String, String>{'authorization': ConfigService.auth}));
      if (response.statusCode == 200)
        return IntResult.fromJson(response.data);
      else
        return IntResult(erros: ["Servidor de api não encontrado na rede"]);
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.CONNECT_TIMEOUT) {
        throw Exception("Connection  Timeout Exception");
      }
      throw Exception(ex.message);
    }
  }
}
