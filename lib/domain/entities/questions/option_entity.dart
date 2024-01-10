import 'package:freezed_annotation/freezed_annotation.dart';
part 'option_entity.freezed.dart';
part 'option_entity.g.dart';

@freezed
class OptionEntity with _$OptionEntity {
  const factory OptionEntity({
    required String id,
    required String name,
    required String value,
  }) = _OptionEntity;

  factory OptionEntity.fromJson(Map<String, dynamic> json) =>
      _$OptionEntityFromJson(json);
}
