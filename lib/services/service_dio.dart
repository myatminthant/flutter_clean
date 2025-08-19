import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ServiceDio {
  @lazySingleton
  Dio dio() {
    final dio = Dio();

    dio.options.baseUrl = "https://newsapi.org/v2";
    dio.options.connectTimeout = const Duration(seconds: 10);

    return dio;
  }
}
