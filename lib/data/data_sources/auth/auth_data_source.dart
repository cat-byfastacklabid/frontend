import 'package:cat_akademik_kepolisian/common/constants/constants.dart';
import 'package:cat_akademik_kepolisian/common/http_config/http_client.dart';
import 'package:cat_akademik_kepolisian/domain/entities/auth/auth_entity.dart';
import 'package:cat_akademik_kepolisian/domain/entities/auth/auth_response_entity.dart';
import 'package:cat_akademik_kepolisian/state/data_state/data_state.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthDataSource {
  final HttpClient httpClient;

  const AuthDataSource(this.httpClient);

  Future<DataState<AuthResponseEntity>> logIn(AuthEntity payload) async {
    try {
      final result = await httpClient.post(
        path: APIPath.login,
        requestBody: payload.toJson(),
      );
      return DataState.success(AuthResponseEntity.fromJson(result.data));
    } on DioException catch (e) {
      return DataState.error('${e.message}', e.response?.statusCode.toString());
    } catch (e) {
      return const DataState.error('Unknown Error', '999');
    }
  }
}
