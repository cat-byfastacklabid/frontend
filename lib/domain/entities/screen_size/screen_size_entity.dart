import 'package:freezed_annotation/freezed_annotation.dart';
part 'screen_size_entity.freezed.dart';

@freezed
class ScreenSizeEntity with _$ScreenSizeEntity {
  const factory ScreenSizeEntity({
    required double maxHeight,
    required double maxWidth,
  }) = _ScreenSizeEntity;
}
