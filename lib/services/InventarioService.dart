import 'package:coletor_android/models/InventarioResult.dart';

import 'GenericService.dart';

class InventarioService extends GenericService<InventarioResult> {
  InventarioService() : super(modulo: 'inventario');

  @override
  InventarioResult fromJson(Map<String, dynamic> json) {
    return InventarioResult.fromJson(json);
  }

  @override
  InventarioResult fromJsonErro(List<String> erros) {
    return InventarioResult(erros: erros, data: null);
  }

  Future<InventarioResult> findByNum(int num) async {
    return methodGet('findByNum', '$num', (json) => InventarioResult.fromJson(json),
        (erros) => InventarioResult(erros: erros, data: null));
  }

  Future<InventarioResult> findAberto() async {
    return methodGet('findAberto', '', (json) => InventarioResult.fromJson(json),
        (erros) => InventarioResult(erros: erros, data: null));
  }
}
