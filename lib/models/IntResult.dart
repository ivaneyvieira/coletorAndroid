class IntResult {
  final List<String> erros;
  final int data;

  IntResult({this.erros, this.data});

  factory IntResult.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    final errosList = (json['erros'] as List<dynamic>).map((e) => e as String).toList();
    if (data == null)
      return IntResult(erros: errosList, data: null);
    else
      return IntResult(erros: errosList, data: data as int);
  }
}

