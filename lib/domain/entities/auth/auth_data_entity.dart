import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_data_entity.freezed.dart';
part 'auth_data_entity.g.dart';

@freezed
class AuthDataEntity with _$AuthDataEntity {
  const factory AuthDataEntity({
    required String id,
    required String token,
    required String roleCode,
    required String username,
  }) = _AuthDataEntity;

  factory AuthDataEntity.fromJson(Map<String, dynamic> json) =>
      _$AuthDataEntityFromJson(json);
}
