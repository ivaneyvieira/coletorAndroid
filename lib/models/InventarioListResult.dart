import 'GenericResult.dart';
import 'InventarioResult.dart';

class InventarioListResult extends GenericResult<List<Inventario>> {
  InventarioListResult({erros, data}) : super(erros, data);

  factory InventarioListResult.fromJson(Map<String, dynamic> json) {
    final data = (json['erros'] as List<dynamic>).map((e) =>  Inventario.fromJson(e)).toList();
    final errosList = (json['erros'] as List<dynamic>).map((e) => e as String).toList();
    if (data == null)
      return InventarioListResult(erros: errosList, data: null);
    else
      return InventarioListResult(erros: errosList, data: data);
  }
}
