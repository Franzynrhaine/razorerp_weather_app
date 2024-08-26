import 'package:dio/dio.dart';
import '../errors/exceptions.dart';
import 'interceptors/api_key_interceptor.dart';

class ApiClient {
  final Dio _dio;

  ApiClient() : _dio = Dio() {
    _dio.interceptors.add(ApiKeyInterceptor());
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get(path, queryParameters: queryParameters);
    } catch (e) {
      throw ServerException();
    }
  }
}