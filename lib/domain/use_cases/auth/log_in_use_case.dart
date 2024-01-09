import 'package:cat_akademik_kepolisian/domain/entities/auth/auth_entity.dart';
import 'package:cat_akademik_kepolisian/domain/repositories/auth/auth_repository.dart';
import 'package:cat_akademik_kepolisian/domain/use_cases/use_case.dart';
import 'package:cat_akademik_kepolisian/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LogInUseCase implements UseCase<bool, AuthEntity> {
  final AuthRepository repository;

  const LogInUseCase(this.repository);

  @override
  Future<DataState<bool>> call(AuthEntity params) async =>
      await repository.logIn(params);
}
