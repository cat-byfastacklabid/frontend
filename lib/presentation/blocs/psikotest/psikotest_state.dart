part of 'psikotest_cubit.dart';

@freezed
class PsikotestState with _$PsikotestState {
  const factory PsikotestState({
    required ViewState psikotestQustionsState,
    required List<QuestionEntity> psikotestQustions,
    required int questionShowingIndex,
    required QuestionEntity exampleTest,
    required bool isExampleDone,
    required String title,
    required AnswerResponseDataEntity answerResponseData,
    required ViewState answerResponseDataState,
  }) = _PsikotestState;

  factory PsikotestState.initial() => const PsikotestState(
        psikotestQustionsState: ViewState.initial(),
        psikotestQustions: [],
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
