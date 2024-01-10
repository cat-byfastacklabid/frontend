part of 'psikotest_cubit.dart';

@freezed
class PsikotestState with _$PsikotestState {
  const factory PsikotestState({
    required ViewState psikotestQustionsState,
    required List<QuestionEntity> psikotestQustions,
    required int questionShowingIndex,
  }) = _PsikotestState;

  factory PsikotestState.initial() => const PsikotestState(
        psikotestQustionsState: ViewState.initial(),
        psikotestQustions: [],
        questionShowingIndex: 0,
      );
}
