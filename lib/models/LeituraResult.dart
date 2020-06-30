class LeituraResult {
  final List<String> erros;
  final Leitura data;

  LeituraResult({this.erros, this.data});

  factory LeituraResult.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    final errosList = (json['erros'] as List<dynamic>).map((e) => e as String).toList();
    if (data == null)
      return LeituraResult(erros: errosList, data: null);
    else
      return LeituraResult(erros: errosList, data: Leitura.fromJson(data));
  }
}

class Leitura {
  final int id;
  final String leitura;
  final String observacao;
  final int quant;
  final String status;
  final int coletaId;
  final int produtoId;

  Leitura({this.id, this.leitura, this.observacao, this.quant, this.status, this.coletaId, this.produtoId});

  factory Leitura.fromJson(Map<String, dynamic> json) => Leitura(
      id: json['id'] as int,
      leitura: json['leitura'] as String,
      observacao: json['observacao'] as String,
      quant: json['quant'] as int,
      status: json['status'] as String,
      coletaId: json['coletaId'] as int,
      produtoId: json['produtoId'] as int);
}
