import 'package:cat_akademik_kepolisian/data/data_sources/questions/ketahanan_data_source.dart';
import 'package:cat_akademik_kepolisian/domain/entities/answer/answer_response_entity.dart';
import 'package:cat_akademik_kepolisian/domain/entities/questions/question_entity.dart';
import 'package:cat_akademik_kepolisian/domain/entities/questions/question_response_entity.dart';
import 'package:cat_akademik_kepolisian/domain/repositories/ketahanan_repository/ketahanan_repository.dart';
import 'package:cat_akademik_kepolisian/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: KetahananRespository)
class KetahananRespositoryImpl implements KetahananRespository {
  final KetahananDataSource dataSource;

  const KetahananRespositoryImpl(this.dataSource);
  @override
  Future<DataState<QuestionResponseEntity>> getKetahananQuestions() async =>
      await dataSource.getKetahananQuestions();

  @override
  Future<DataState<AnswerResponseEntity>> submitKetahanan(
    List<QuestionEntity> payload,
  ) async =>
      await dataSource.submitKetahanan(payload);
}
