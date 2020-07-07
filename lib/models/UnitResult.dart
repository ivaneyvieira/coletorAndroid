import 'GenericResult.dart';

class UnitResult extends GenericResult<void> {

  UnitResult({erros}) : super(erros, null);

  factory UnitResult.fromJson(Map<String, dynamic> json) {
    final errosList = (json['erros'] as List<dynamic>).map((e) => e as String).toList();

    return UnitResult(erros: errosList);
  }
}
