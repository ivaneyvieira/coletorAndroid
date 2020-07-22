import 'GenericResult.dart';
import 'LojaResult.dart';

class LojaListResult extends GenericResult<List<Loja>> {
  LojaListResult({erros, data}) : super(erros, data);

  factory LojaListResult.fromJson(Map<String, dynamic> json) {
    final data = (json['data'] as List<dynamic>).map((e) =>  Loja.fromJson(e)).toList();
    final errosList = (json['erros'] as List<dynamic>).map((e) => e as String).toList();
    if (data == null)
      return LojaListResult(erros: errosList, data: null);
    else
      return LojaListResult(erros: errosList, data: data);
  }
}
