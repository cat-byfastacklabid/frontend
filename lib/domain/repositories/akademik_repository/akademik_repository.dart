import 'package:cat_akademik_kepolisian/domain/entities/answer/answer_response_entity.dart';
import 'package:cat_akademik_kepolisian/domain/entities/questions/question_entity.dart';
import 'package:cat_akademik_kepolisian/domain/entities/questions/question_response_entity.dart';
import 'package:cat_akademik_kepolisian/state/data_state/data_state.dart';

abstract class AkademikRespository {
  Future<DataState<QuestionResponseEntity>> getAkademikQuestions();
  Future<DataState<AnswerResponseEntity>> submitAkademik(
      List<QuestionEntity> payload);
}
