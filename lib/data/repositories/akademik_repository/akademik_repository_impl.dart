import 'package:cat_akademik_kepolisian/data/data_sources/questions/akademik_data_source.dart';
import 'package:cat_akademik_kepolisian/domain/entities/answer/answer_response_entity.dart';
import 'package:cat_akademik_kepolisian/domain/entities/questions/question_entity.dart';
import 'package:cat_akademik_kepolisian/domain/entities/questions/question_response_entity.dart';
import 'package:cat_akademik_kepolisian/domain/repositories/akademik_repository/akademik_repository.dart';
import 'package:cat_akademik_kepolisian/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AkademikRespository)
class AkademikRespositoryImpl implements AkademikRespository {
  final AkademikDataSource dataSource;

  const AkademikRespositoryImpl(this.dataSource);
  @override
  Future<DataState<QuestionResponseEntity>> getAkademikQuestions() async =>
      await dataSource.getAkademikQuestions();

  @override
  Future<DataState<AnswerResponseEntity>> submitAkademik(
    List<QuestionEntity> payload,
  ) async =>
      await dataSource.submitAkademik(payload);
}
