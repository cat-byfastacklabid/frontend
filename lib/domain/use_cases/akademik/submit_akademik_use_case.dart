import 'package:cat_akademik_kepolisian/domain/entities/answer/answer_response_entity.dart';
import 'package:cat_akademik_kepolisian/domain/entities/questions/question_entity.dart';
import 'package:cat_akademik_kepolisian/domain/repositories/akademik_repository/akademik_repository.dart';
import 'package:cat_akademik_kepolisian/domain/use_cases/use_case.dart';
import 'package:cat_akademik_kepolisian/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SubmitAkademikQuestionsUseCase
    implements UseCase<AnswerResponseEntity, List<QuestionEntity>> {
  final AkademikRespository respository;

  const SubmitAkademikQuestionsUseCase(this.respository);
  @override
  Future<DataState<AnswerResponseEntity>> call(
    List<QuestionEntity> params,
  ) async =>
      await respository.submitAkademik(params);
}
