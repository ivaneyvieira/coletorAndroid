class InventarioResult {
  final List<String> erros;
  final Inventario data;

  InventarioResult({this.erros, this.data});

  factory InventarioResult.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    final errosList = (json['erros'] as List<dynamic>).map((e) => e as String).toList();
    if (data == null)
      return InventarioResult(erros: errosList, data: null);
    else
      return InventarioResult(erros: errosList, data: Inventario.fromJson(data));
  }
}

class Inventario {
  final int id;
  final int numero;
  final String observacao;
  final String tipoinventario;
  final String statusinventario;
  final int lojaId;
  final int fornecedorId;
  final int clId;

  Inventario(
      {this.id,
      this.numero,
      this.observacao,
      this.tipoinventario,
      this.statusinventario,
      this.lojaId,
      this.fornecedorId,
      this.clId});

  factory Inventario.fromJson(Map<String, dynamic> json) => Inventario(
      id: json['id'] as int,
      numero: json['numero'] as int,
      observacao: json['observacao'] as String,
      tipoinventario: json['tipoinventario'] as String,
      statusinventario: json['statusinventario'] as String,
      lojaId: json['lojaId'] as int,
      fornecedorId: json['fornecedorId'] as int,
      clId: json['clId'] as int);
}
