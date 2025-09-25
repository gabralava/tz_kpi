import 'package:dio/dio.dart';
import 'package:tz_kpi/data/datasources/interceptors/auth_interceptor.dart';

class HttpClient {
  final Dio _dio;

  HttpClient(String accessToken)
    : _dio = Dio()..interceptors.add(AuthInterceptor(accessToken: accessToken));

  Future<dynamic> request({
    required String url,
    Object? data,
    Map<String, dynamic>? params,
    String? method,
  }) async {
    final response = await _dio.request(
      url,
      data: data,
      queryParameters: params,
      options: Options(method: method),
    );

    return response.data;
  }
}
