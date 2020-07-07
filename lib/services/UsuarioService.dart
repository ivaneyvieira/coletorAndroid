import 'package:coletor_android/models/UsuarioResult.dart';

import 'GenericService.dart';

class UsuarioService extends GenericService {
  UsuarioService() : super(modulo: 'usuario');

  Future<UsuarioResult> findUsuarioByMatricula(int matricula) async {
    return methodGet('matricula', '$matricula', (json) => UsuarioResult.fromJson(json),
        (erros) => UsuarioResult(erros: erros, data: null));
  }
}
