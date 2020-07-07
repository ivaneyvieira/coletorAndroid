import 'GenericResult.dart';

class UsuarioResult extends GenericResult<Usuario> {
  UsuarioResult({erros, data}) : super(erros, data);

  factory UsuarioResult.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    final errosList = (json['erros'] as List<dynamic>).map((e) => e as String).toList();
    if (data == null)
      return UsuarioResult(erros: errosList, data: null);
    else
      return UsuarioResult(erros: errosList, data: Usuario.fromJson(data));
  }
}

class Usuario {
  final int id;
  final int matricula;
  final String nome;
  final String senha;
  final String apelido;

  Usuario({this.id, this.matricula, this.nome, this.senha, this.apelido});

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
      id: json['id'] as int,
      matricula: json['matricula'] as int,
      nome: json['nome'] as String,
      senha: json['senha'] as String,
      apelido: json['apelido'] as String);
}
