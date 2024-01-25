part of 'ketahanan_cubit.dart';

@freezed
class KetahananState with _$KetahananState {
  const factory KetahananState({
    required ViewState ketahananQustionsState,
    required List<QuestionEntity> ketahananQustions,
    required int questionShowingIndex,
    required QuestionEntity exampleTest,
    required bool isExampleDone,
    required String title,
    required AnswerResponseDataEntity answerResponseData,
    required ViewState answerResponseDataState,
  }) = _KetahananState;

  factory KetahananState.initial() => const KetahananState(
        ketahananQustionsState: ViewState.initial(),
        ketahananQustions: [],
        questionShowingIndex: 0,
        isExampleDone: false,
        title: '',
        answerResponseData: AnswerResponseDataEntity(username: '', value: ''),
        answerResponseDataState: ViewState.initial(),
        exampleTest: QuestionEntity(
          questionId: '',
          question: '',
          options: [],
        ),
      );
}
