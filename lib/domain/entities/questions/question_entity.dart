import 'package:cat_akademik_kepolisian/domain/entities/questions/option_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'question_entity.freezed.dart';
part 'question_entity.g.dart';

@freezed
class QuestionEntity with _$QuestionEntity {
  const factory QuestionEntity({
    required String questionId,
    required String question,
    required List<OptionEntity> options,
  }) = _QuestionEntity;

  factory QuestionEntity.fromJson(Map<String, dynamic> json) =>
      _$QuestionEntityFromJson(json);
}
