import 'package:cat_akademik_kepolisian/common/psikotest_answers/psikotest_answers.dart';
import 'package:cat_akademik_kepolisian/domain/entities/questions/psikotest/psikotest_entity.dart';
import 'package:cat_akademik_kepolisian/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PsikotestDataSource {
  Future<DataState<List<PsikotestEntity>>> getPsikotestQuestions() async {
    final positiveQuestion = PsikotestEntity(
      id: '1',
      questions: 'Pertanyaan Tipe Satu [Positive] Adalah: ',
      answerOptions: PsikotestAnswers.positive,
    );
    final negativeQuestion = PsikotestEntity(
      id: '2',
      questions: 'Pertanyaan Tipe Dua [Nevative] Adalah: ',
      answerOptions: PsikotestAnswers.negative,
    );
    final data = [
      ...List.generate(
          50, (index) => positiveQuestion.copyWith(id: '1${index + 1}')),
      ...List.generate(
          50, (index) => negativeQuestion.copyWith(id: '2${index + 1}')),
    ];

    return DataState.success(data..shuffle());
  }
}
