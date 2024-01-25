import 'package:cat_akademik_kepolisian/domain/entities/questions/question_response_entity.dart';
import 'package:cat_akademik_kepolisian/domain/repositories/akademik_repository/akademik_repository.dart';
import 'package:cat_akademik_kepolisian/domain/use_cases/use_case.dart';
import 'package:cat_akademik_kepolisian/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAkademikQuestionsUseCase
    implements UseCase<QuestionResponseEntity, EmptyParams> {
  final AkademikRespository respository;

  const GetAkademikQuestionsUseCase(this.respository);
  @override
  Future<DataState<QuestionResponseEntity>> call(EmptyParams params) async =>
      await respository.getAkademikQuestions();
}
