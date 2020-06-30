class ColetaResult {
  final List<String> erros;
  final Coleta data;

  ColetaResult({this.erros, this.data});

  factory ColetaResult.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    final errosList = (json['erros'] as List<dynamic>).map((e) => e as String).toList();
    if (data == null)
      return ColetaResult(erros: errosList, data: null);
    else
      return ColetaResult(erros: errosList, data: Coleta.fromJson(data));
  }
}

class Coleta {
  final int id;
  final int numleitura;
  final int inventarioId;
  final int loteId;
  final int usuarioId;
  final int coletor;
  final String status;

  Coleta({this.id, this.numleitura, this.inventarioId, this.loteId, this.usuarioId, this.coletor, this.status});

  factory Coleta.fromJson(Map<String, dynamic> json) => Coleta(
      id: json['id'] as int,
      numleitura: json['numleitura'] as int,
      inventarioId: json['inventarioId'] as int,
      loteId: json['loteId'] as int,
      usuarioId: json['usuarioId'] as int,
      coletor: json['coletor'] as int,
      status: json['status'] as String);
}
