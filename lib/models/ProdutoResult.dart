class ProdutoResult {
  final List<String> erros;
  final Produto data;

  ProdutoResult({this.erros, this.data});

  factory ProdutoResult.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    final errosList = (json['erros'] as List<dynamic>).map((e) => e as String).toList();
    if (data == null)
      return ProdutoResult(erros: errosList, data: null);
    else
      return ProdutoResult(erros: errosList, data: Produto.fromJson(data));
  }
}

class Produto {
  final int id;
  final String barcode;
  final String codigo;
  final String descricao;
  final int duplicado;
  final int foralinha;
  final String grade;
  final int usoconsumo;
  final int clId;
  final int fornecedorId;

  Produto(
      {this.id,
      this.barcode,
      this.codigo,
      this.descricao,
      this.duplicado,
      this.foralinha,
      this.grade,
      this.usoconsumo,
      this.clId,
      this.fornecedorId});

  factory Produto.fromJson(Map<String, dynamic> json) => Produto(
        id: json['id'] as int,
        barcode: json['barcode'],
        codigo: json['codigo'] as String,
        descricao: json['descricao'] as String,
        duplicado: json['duplicado'],
        foralinha: json['foralinha'] as int,
        grade: json['grade'] as String,
        usoconsumo: json['usoconsumo'] as int,
        clId: json['clId'] as int,
        fornecedorId: json['fornecedorId'] as int,
      );
}
