class LoteResult {
  final List<String> erros;
  final Lote data;

  LoteResult({this.erros, this.data});

  factory LoteResult.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    final errosList = (json['erros'] as List<dynamic>).map((e) => e as String).toList();
    if (data == null)
      return LoteResult(erros: errosList, data: null);
    else
      return LoteResult(erros: errosList, data: Lote.fromJson(data));
  }
}

class Lote {
  final int id;
  final String descricao;
  final int loteavulso;
  final int numero;
  final int lojaId;

  Lote({this.id, this.descricao, this.loteavulso, this.numero, this.lojaId});

  factory Lote.fromJson(Map<String, dynamic> json) => Lote(
    id: json['id'] as int,
    descricao: json['descricao'] as String,
    loteavulso: json['loteavulso'] as int,
    numero: json['numero'] as int,
    lojaId: json['lojaId'] as int
  );
}
