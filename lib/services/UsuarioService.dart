import 'package:coletor_android/models/UsuarioResult.dart';

import 'GenericService.dart';

class UsuarioService extends GenericService<UsuarioResult> {
  UsuarioService() : super(modulo: 'usuario');

  @override
  UsuarioResult fromJson(Map<String, dynamic> json) {
    return UsuarioResult.fromJson(json);
  }

  @override
  UsuarioResult fromJsonErro(List<String> erros) {
    return UsuarioResult(erros: erros, data: null);
  }

  Future<UsuarioResult> findUsuarioByMatricula(int matricula) async {
    return methodGet('matricula', '$matricula', (json) => UsuarioResult.fromJson(json),
        (erros) => UsuarioResult(erros: erros, data: null));
  }
}
