import 'package:cat_akademik_kepolisian/data/data_sources/psikotest/psikotest_data_source.dart';
import 'package:cat_akademik_kepolisian/domain/entities/answer/answer_response_entity.dart';
import 'package:cat_akademik_kepolisian/domain/entities/questions/question_entity.dart';
import 'package:cat_akademik_kepolisian/domain/entities/questions/question_response_entity.dart';
import 'package:cat_akademik_kepolisian/domain/repositories/psikotest_repository/psikotest_repository.dart';
import 'package:cat_akademik_kepolisian/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PsikotestRespository)
class PsikotestRespositoryImpl implements PsikotestRespository {
  final PsikotestDataSource dataSource;

  const PsikotestRespositoryImpl(this.dataSource);
  @override
  Future<DataState<QuestionResponseEntity>> getPsikotestQuestions() async =>
      await dataSource.getPsikotestQuestions();

  @override
  Future<DataState<AnswerResponseEntity>> submitPsikotest(
    List<QuestionEntity> payload,
  ) async =>
      await dataSource.submitPsikotest(payload);
}
