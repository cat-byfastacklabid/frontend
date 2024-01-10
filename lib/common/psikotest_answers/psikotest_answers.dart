import 'package:cat_akademik_kepolisian/domain/entities/questions/psikotest/psikotest_answer_entity.dart';

class PsikotestAnswers {
  static List<PsikotestAnswerEntity> get positive => const [
        PsikotestAnswerEntity(answer: 'Sangat Setuju', value: 5),
        PsikotestAnswerEntity(answer: 'Setuju', value: 4),
        PsikotestAnswerEntity(answer: 'Netral', value: 3),
        PsikotestAnswerEntity(answer: 'Tidak Setuju', value: 2),
        PsikotestAnswerEntity(answer: 'Sangat Tidak Setuju', value: 1),
      ];
  static List<PsikotestAnswerEntity> get negative => const [
        PsikotestAnswerEntity(answer: 'Sangat Setuju', value: 1),
        PsikotestAnswerEntity(answer: 'Setuju', value: 2),
        PsikotestAnswerEntity(answer: 'Netral', value: 3),
        PsikotestAnswerEntity(answer: 'Tidak Setuju', value: 4),
        PsikotestAnswerEntity(answer: 'Sangat Tidak Setuju', value: 5),
      ];
}
