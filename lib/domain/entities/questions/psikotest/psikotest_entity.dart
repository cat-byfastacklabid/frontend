import 'package:cat_akademik_kepolisian/domain/entities/questions/psikotest/psikotest_answer_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'psikotest_entity.freezed.dart';
part 'psikotest_entity.g.dart';

@freezed
class PsikotestEntity with _$PsikotestEntity {
  const factory PsikotestEntity({
    required String id,
    required String questions,
    required List<PsikotestAnswerEntity> answerOptions,
  }) = _PsikotestEntity;

  factory PsikotestEntity.fromJson(Map<String, dynamic> json) =>
      _$PsikotestEntityFromJson(json);
}
