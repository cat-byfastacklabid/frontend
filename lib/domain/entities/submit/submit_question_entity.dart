import 'package:freezed_annotation/freezed_annotation.dart';
part 'submit_question_entity.freezed.dart';
part 'submit_question_entity.g.dart';

@freezed
class SubmitQuestionEntity with _$SubmitQuestionEntity {
  const factory SubmitQuestionEntity({
    required String questionId,
    required String optionId,
  }) = _SubmitQuestionEntity;

  factory SubmitQuestionEntity.fromJson(Map<String, dynamic> json) =>
      _$SubmitQuestionEntityFromJson(json);
}
