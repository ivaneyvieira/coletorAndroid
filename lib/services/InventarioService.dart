
import 'package:coletor_android/models/InventarioResult.dart';
import 'package:coletor_android/models/UnitResult.dart';

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
    return methodGet('findByNum', '$num');
  }

  Future<InventarioResult> findAberto() async {
    return methodGet('findAberto', '');
  }
}
