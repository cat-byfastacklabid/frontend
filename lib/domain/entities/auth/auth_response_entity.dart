import 'package:cat_akademik_kepolisian/domain/entities/auth/auth_data_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_response_entity.freezed.dart';
part 'auth_response_entity.g.dart';

@freezed
class AuthResponseEntity with _$AuthResponseEntity {
  const factory AuthResponseEntity({
    required String msg,
    required AuthDataEntity data,
  }) = _AuthResponseEntity;

  factory AuthResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseEntityFromJson(json);
}
