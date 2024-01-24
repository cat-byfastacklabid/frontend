import 'package:freezed_annotation/freezed_annotation.dart';
part 'option_entity.freezed.dart';
part 'option_entity.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class OptionEntity with _$OptionEntity {
  const factory OptionEntity({
    required String id,
    required String name,
    required String value,
    @Default(false) bool isSelected,
    @Default(false) bool isImageOptions,
  }) = _OptionEntity;

  factory OptionEntity.fromJson(Map<String, dynamic> json) =>
      _$OptionEntityFromJson(json);
}
