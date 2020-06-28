import 'dart:convert';

class UsuarioResult {
  final List<String> erros;
  final Usuario usuario;

  UsuarioResult({this.erros, this.usuario});

  factory UsuarioResult.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    final errosList =
        (json['erros'] as List<dynamic>).map((e) => e as String).toList();
    if (data == null)
      return UsuarioResult(erros: errosList, usuario: null);
    else
      return UsuarioResult(erros: errosList, usuario: Usuario.fromJson(data));
  }
}

class Usuario {
  final int matricula;
  final String nome;
  final String senha;
  final String apelido;
  final int version;

  Usuario({this.matricula, this.nome, this.senha, this.apelido, this.version});

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
      matricula: json["matricula"] as int,
      nome: json["nome"] as String,
      senha: json["senha"] as String,
      apelido: json["apelido"] as String,
      version: json["version"] as int);
}
