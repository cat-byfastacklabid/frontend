import 'package:freezed_annotation/freezed_annotation.dart';
part 'answer_entity.freezed.dart';
part 'answer_entity.g.dart';

@freezed
class AnswersEntity with _$AnswersEntity {
  const factory AnswersEntity({
    required List<QuestionAnsweredEntity> answers,
  }) = _AnswersEntity;

  factory AnswersEntity.fromJson(Map<String, dynamic> json) =>
      _$AnswersEntityFromJson(json);
}

@freezed
class QuestionAnsweredEntity with _$QuestionAnsweredEntity {
  const factory QuestionAnsweredEntity({
    required String question,
    required String option,
  }) = _QuestionAnsweredEntity;

  factory QuestionAnsweredEntity.fromJson(Map<String, dynamic> json) =>
      _$QuestionAnsweredEntityFromJson(json);
}
