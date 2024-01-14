import 'package:cat_akademik_kepolisian/domain/repositories/auth/auth_repository.dart';
import 'package:cat_akademik_kepolisian/domain/use_cases/use_case.dart';
import 'package:cat_akademik_kepolisian/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SaveTokenUseCase implements UseCase<bool, String> {
  final AuthRepository repository;

  const SaveTokenUseCase(this.repository);

  @override
  Future<DataState<bool>> call(String params) async =>
      await repository.saveToken(params);
}
