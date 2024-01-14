import 'package:cat_akademik_kepolisian/common/constants/constants.dart';
import 'package:cat_akademik_kepolisian/common/storage/shared_preferences_config.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HttpClient {
  final SharedPreferencesConfig sp;
  final Dio client;

  HttpClient(this.sp, this.client) {
    _setBaseUrl();
  }

  void _setHeaders() {
    final token = sp.getString(Constants.tokenKey) ?? '';
    Map<String, String> headers = {};

    headers['Content-Type'] = 'application/json';
    headers['Authorization'] = 'Bearer $token';

    client.options.headers = headers;
  }

  void _setBaseUrl() {
    client.options.baseUrl = APIConstants.baseUrl;
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      _setHeaders();
      final response = await client.get(
        path,
        queryParameters: queryParameters,
      );

      return response;
    } on Exception {
      rethrow;
    }
  }

  Future<Response> post({
    required String path,
    Map<String, dynamic>? requestBody,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      _setHeaders();

      final Response response = await client.post(
        path,
        data: requestBody,
        queryParameters: queryParameters,
      );

      return response;
    } on Exception {
      rethrow;
    }
  }
}
