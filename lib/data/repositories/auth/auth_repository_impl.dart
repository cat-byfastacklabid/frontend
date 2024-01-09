import 'package:cat_akademik_kepolisian/data/data_sources/auth/auth_data_source.dart';
import 'package:cat_akademik_kepolisian/domain/entities/auth/auth_entity.dart';
import 'package:cat_akademik_kepolisian/domain/repositories/auth/auth_repository.dart';
import 'package:cat_akademik_kepolisian/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  const AuthRepositoryImpl(this.dataSource);
  @override
  Future<DataState<bool>> logIn(AuthEntity payload) async =>
      await dataSource.logIn(payload);
}
