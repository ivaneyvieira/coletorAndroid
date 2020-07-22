import 'package:coletor_android/models/InventarioListResult.dart';
import 'package:coletor_android/models/InventarioResult.dart';

import 'GenericService.dart';

class InventarioService extends GenericService {
  InventarioService() : super(modulo: 'inventario');

  Future<InventarioResult> findByNum(int num) async {
    return methodGet('findByNum', '$num', (json) => InventarioResult.fromJson(json),
        (erros) => InventarioResult(erros: erros, data: null));
  }

  Future<InventarioListResult> findAberto() async {
    final future = await methodGet('findAberto', '', (json) => InventarioListResult.fromJson(json),
        (erros) => InventarioListResult(erros: erros, data: null));
    return future;
  }
}
