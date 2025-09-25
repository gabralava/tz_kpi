import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final String? accessToken;

  AuthInterceptor({this.accessToken});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    return handler.next(options);
  }
}
