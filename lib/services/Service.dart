import 'package:coletor_android/models/UsuarioResult.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:convert';

class ColetorService {
  static final username= '11071';
  static final password = '1496';
  var auth = 'Basic '+base64Encode(utf8.encode('$username:$password'));
  final dio = Dio();

  Future<UsuarioResult> findUsuarioByMatricula(String matricula) async {
    try {
      Response response = await dio
          .get("http://192.168.1.53:8080/api/usuario/matricula/${matricula}",
          options: Options(headers: <String, String>{'authorization': auth}));

      return UsuarioResult.fromJson(response.data);
    } catch (e) {
      throw SocketException(e.toString());
    }
  }
}
