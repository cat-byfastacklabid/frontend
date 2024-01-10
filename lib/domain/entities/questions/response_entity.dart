import 'package:cat_akademik_kepolisian/domain/entities/questions/question_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'response_entity.freezed.dart';
part 'response_entity.g.dart';

@freezed
class ResponseEntity with _$ResponseEntity {
  const factory ResponseEntity({
    required String quizTitle,
    required List<QuestionEntity> question,
  }) = _ResponseEntity;

  factory ResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$ResponseEntityFromJson(json);
}
