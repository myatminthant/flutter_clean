import 'package:dio/dio.dart';
import 'package:flutter_clean/env.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ServiceDio {
  @lazySingleton
  Dio dio() {
    final dio = Dio();

    dio.options.baseUrl = Env.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 10);

    return dio;
  }
}
