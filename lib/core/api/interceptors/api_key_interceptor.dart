import 'package:dio/dio.dart';

class ApiKeyInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters['appid'] = '37ea9939152496e5de6ca532f93817fd';
    super.onRequest(options, handler);
  }
}