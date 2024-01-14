import 'package:cat_akademik_kepolisian/domain/entities/questions/question_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'question_response_entity.freezed.dart';
part 'question_response_entity.g.dart';

@freezed
class QuestionResponseEntity with _$QuestionResponseEntity {
  const factory QuestionResponseEntity({
    required String quizTitle,
    required List<QuestionEntity> question,
  }) = _QuestionResponseEntity;

  factory QuestionResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$QuestionResponseEntityFromJson(json);
}
