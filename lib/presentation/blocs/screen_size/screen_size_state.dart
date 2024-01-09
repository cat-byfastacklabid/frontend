part of 'screen_size_cubit.dart';

@freezed
class ScreenSizeState with _$ScreenSizeState {
  const factory ScreenSizeState({
    required ScreenSizeEntity screenSize,
  }) = _ScreenSizeState;

  factory ScreenSizeState.initial() => const ScreenSizeState(
        screenSize: ScreenSizeEntity(maxHeight: 0, maxWidth: 0),
      );
}
