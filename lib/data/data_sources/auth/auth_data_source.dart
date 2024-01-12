import 'package:cat_akademik_kepolisian/domain/entities/auth/auth_data_entity.dart';
import 'package:cat_akademik_kepolisian/domain/entities/auth/auth_entity.dart';
import 'package:cat_akademik_kepolisian/domain/entities/auth/auth_response_entity.dart';
import 'package:cat_akademik_kepolisian/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthDataSource {
  Future<DataState<AuthResponseEntity>> logIn(AuthEntity payload) async {
    return const DataState.success(
      AuthResponseEntity(
        msg: 'msg',
        data: AuthDataEntity(
          id: 'id',
          token: 'token',
          userCode: 'userCode',
          username: 'username',
        ),
      ),
    );
  }
}
