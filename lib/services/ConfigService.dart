import 'dart:io';
import 'dart:convert';

import 'package:dio/dio.dart';

class ConfigService {
  static final username = '11071';
  static final password = '1496';
  static final auth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));

  //static final urlBase = 'http://192.168.1.120:8080/api';
  static final urlBase = 'http://10.1.10.98:8080/api';

  static final  dio = Dio();
}
