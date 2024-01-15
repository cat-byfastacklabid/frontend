import 'package:freezed_annotation/freezed_annotation.dart';
part 'answer_response_entity.freezed.dart';
part 'answer_response_entity.g.dart';

@freezed
class AnswerResponseEntity with _$AnswerResponseEntity {
  const factory AnswerResponseEntity({
    required String msg,
    AnswerResponseDataEntity? data,
  }) = _AnswerResponseEntity;

  factory AnswerResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$AnswerResponseEntityFromJson(json);
}

@freezed
class AnswerResponseDataEntity with _$AnswerResponseDataEntity {
  const factory AnswerResponseDataEntity({
    required String username,
    required String value,
  }) = _AnswerResponseDataEntity;

  factory AnswerResponseDataEntity.fromJson(Map<String, dynamic> json) =>
      _$AnswerResponseDataEntityFromJson(json);
}
