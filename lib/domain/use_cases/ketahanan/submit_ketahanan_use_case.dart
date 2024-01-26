import 'package:cat_akademik_kepolisian/domain/entities/answer/answer_response_entity.dart';
import 'package:cat_akademik_kepolisian/domain/entities/questions/question_entity.dart';
import 'package:cat_akademik_kepolisian/domain/repositories/ketahanan_repository/ketahanan_repository.dart';
import 'package:cat_akademik_kepolisian/domain/use_cases/use_case.dart';
import 'package:cat_akademik_kepolisian/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SubmitKetahananQuestionsUseCase
    implements UseCase<AnswerResponseEntity, List<QuestionEntity>> {
  final KetahananRespository respository;

  const SubmitKetahananQuestionsUseCase(this.respository);
  @override
  Future<DataState<AnswerResponseEntity>> call(
    List<QuestionEntity> params,
  ) async =>
      await respository.submitKetahanan(params);
}
