import 'package:coletor_android/models/UnitResult.dart';
import 'package:dio/dio.dart';

import 'ConfigService.dart';

abstract class GenericService<T> {
  final dio = Dio();

  final String modulo;

  GenericService({this.modulo});

  T fromJson(Map<String, dynamic> json);

  T fromJsonErro(List<String> erros);

  Future<T> methodGet(String method, String parameters ) async {
    try {
      Response response = await dio.get('${ConfigService.userBase}/$modulo/$method/$parameters',
          options: Options(headers: <String, String>{'authorization': ConfigService.auth}));

      return fromJson(response.data);
    } catch (e) {
      return fromJsonErro([e.toString()]);
    }
  }

  Future<UnitResult> methodPost(String method, Map<String, dynamic> data) async {
    try {
      Response response = await dio.post('${ConfigService.userBase}/$modulo/$method',
          data: data,
          options: Options(headers: <String, String>{'authorization': ConfigService.auth}));

      return UnitResult.fromJson(response.data);
    } catch (e) {
      return UnitResult(erros: [e.toString()]);
    }
  }
}
