import 'GenericResult.dart';

class LojaResult extends GenericResult<Loja> {
  LojaResult({erros, data}) : super(erros, data);

  factory LojaResult.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    final errosList = (json['erros'] as List<dynamic>).map((e) => e as String).toList();
    if (data == null)
      return LojaResult(erros: errosList, data: null);
    else
      return LojaResult(erros: errosList, data: Loja.fromJson(data));
  }
}

class Loja {
  final int id;
  final String endereco;
  final String nome;
  final String sigla;
  final int storeno;

  Loja({this.id, this.endereco, this.nome, this.sigla, this.storeno});

  factory Loja.fromJson(Map<String, dynamic> json) => Loja(
    id: json['id'] as int,
    endereco: json['endereco'] as String,
    nome: json['nome'] as String,
    sigla: json['sigla'] as String,
    storeno: json['storeno'] as int
  );
}
