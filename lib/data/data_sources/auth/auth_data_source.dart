import 'package:cat_akademik_kepolisian/domain/entities/auth/auth_entity.dart';
import 'package:cat_akademik_kepolisian/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthDataSource {
  Future<DataState<bool>> logIn(AuthEntity payload) async {
    return const DataState.success(true);
  }
}
