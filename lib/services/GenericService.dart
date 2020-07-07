import 'package:coletor_android/models/UnitResult.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'ConfigService.dart';

abstract class GenericService<T> {
  final String modulo;

  GenericService({this.modulo});

  T fromJson(Map<String, dynamic> json);

  T fromJsonErro(List<String> erros);

  Future<T> methodGet(String method, String parameters) async {
    try {
      Response response = await ConfigService.dio.get('${ConfigService.urlBase}/$modulo/$method/$parameters',
          options: Options(headers: <String, String>{'authorization': ConfigService.auth}));
      if (response.statusCode == 200)
        return fromJson(response.data);
      else
        return fromJsonErro(["Servidor de api não encontrado na rede"]);
    } on DioError catch (ex) {
      debugPrint("close");
      if (ex.type == DioErrorType.CONNECT_TIMEOUT) {
        throw Exception("Connection  Timeout Exception");
      }
      throw Exception(ex.message);
    }
  }

  Future<UnitResult> methodPost(String method, Map<String, dynamic> data) async {
    try {
      Response response = await ConfigService.dio.post('${ConfigService.urlBase}/$modulo/$method',
          data: FormData.fromMap(data), options: Options(headers: <String, String>{'authorization': ConfigService.auth}));

      if (response.statusCode == 200)
        return UnitResult.fromJson(response.data);
      else
        return UnitResult(erros: ["Servidor de api não encontrado na rede"]);
    } on DioError catch (ex) {
      debugPrint("close");
      if (ex.type == DioErrorType.CONNECT_TIMEOUT) {
        throw Exception("Connection  Timeout Exception");
      }
      throw Exception(ex.message);
    }
  }
}
