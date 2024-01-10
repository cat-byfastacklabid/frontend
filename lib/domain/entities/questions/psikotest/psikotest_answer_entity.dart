import 'package:freezed_annotation/freezed_annotation.dart';
part 'psikotest_answer_entity.freezed.dart';
part 'psikotest_answer_entity.g.dart';

@freezed
class PsikotestAnswerEntity with _$PsikotestAnswerEntity {
  const factory PsikotestAnswerEntity({
    required String answer,
    required int value,
  }) = _PsikotestAnswerEntity;

  factory PsikotestAnswerEntity.fromJson(Map<String, dynamic> json) =>
      _$PsikotestAnswerEntityFromJson(json);
}
