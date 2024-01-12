import 'package:cat_akademik_kepolisian/domain/entities/auth/auth_entity.dart';
import 'package:cat_akademik_kepolisian/domain/entities/auth/auth_response_entity.dart';
import 'package:cat_akademik_kepolisian/state/data_state/data_state.dart';

abstract class AuthRepository {
  Future<DataState<AuthResponseEntity>> logIn(AuthEntity payload);
}
