class UnitResult {
  final List<String> erros;

  UnitResult({this.erros});

  factory UnitResult.fromJson(Map<String, dynamic> json) {
    final errosList = (json['erros'] as List<dynamic>).map((e) => e as String).toList();

    return UnitResult(erros: errosList);
  }
}
