import 'package:cat_akademik_kepolisian/domain/entities/questions/question_response_entity.dart';
import 'package:cat_akademik_kepolisian/domain/repositories/psikotest_repository/psikotest_repository.dart';
import 'package:cat_akademik_kepolisian/domain/use_cases/use_case.dart';
import 'package:cat_akademik_kepolisian/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetPsikotestQuestionsUseCase
    implements UseCase<QuestionResponseEntity, EmptyParams> {
  final PsikotestRespository respository;

  const GetPsikotestQuestionsUseCase(this.respository);
  @override
  Future<DataState<QuestionResponseEntity>> call(EmptyParams params) async =>
      await respository.getPsikotestQuestions();
}
