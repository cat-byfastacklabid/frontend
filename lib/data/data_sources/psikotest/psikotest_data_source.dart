import 'package:cat_akademik_kepolisian/common/psikotest_answers/psikotest_answers.dart';
import 'package:cat_akademik_kepolisian/domain/entities/questions/question_entity.dart';
import 'package:cat_akademik_kepolisian/domain/entities/questions/question_response_entity.dart';
import 'package:cat_akademik_kepolisian/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PsikotestDataSource {
  Future<DataState<QuestionResponseEntity>> getPsikotestQuestions() async {
    final positiveQuestions = List.generate(
      50,
      (index) => QuestionEntity(
        questionId: '${index + 1}',
        question: 'positive question 1${index + 1}',
        options: QuestionLocalAnswers.positive,
      ),
    );
    final negativeQuestions = List.generate(
      50,
      (index) => QuestionEntity(
        questionId: '${index + 1}',
        question: 'negative question 2${index + 1}',
        options: QuestionLocalAnswers.negative,
      ),
    );
    final response = QuestionResponseEntity(
      quizTitle: 'quizTitle',
      question: [...positiveQuestions, ...negativeQuestions],
    );

    return DataState.success(response);
  }

  Future<DataState<bool>> submitPsikotest() async {
    return const DataState.success(true);
  }
}
