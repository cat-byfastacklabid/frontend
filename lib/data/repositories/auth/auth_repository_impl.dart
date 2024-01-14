import 'package:cat_akademik_kepolisian/data/data_sources/auth/auth_local_data_source.dart';
import 'package:cat_akademik_kepolisian/data/data_sources/auth/auth_remote_data_source.dart';
import 'package:cat_akademik_kepolisian/domain/entities/auth/auth_entity.dart';
import 'package:cat_akademik_kepolisian/domain/entities/auth/auth_response_entity.dart';
import 'package:cat_akademik_kepolisian/domain/repositories/auth/auth_repository.dart';
import 'package:cat_akademik_kepolisian/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  const AuthRepositoryImpl(this.remoteDataSource, this.localDataSource);
  @override
  Future<DataState<AuthResponseEntity>> logIn(AuthEntity payload) async =>
      await remoteDataSource.logIn(payload);

  @override
  Future<DataState<bool>> saveToken(String token) async =>
      await localDataSource.saveToken(token);
}
