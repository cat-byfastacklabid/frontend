part of 'akademik_cubit.dart';

@freezed
class AkademikState with _$AkademikState {
  const factory AkademikState({
    required ViewState akademikQustionsState,
    required List<QuestionEntity> akademikQustions,
    required int questionShowingIndex,
    required QuestionEntity exampleTest,
    required bool isExampleDone,
    required String title,
    required AnswerResponseDataEntity answerResponseData,
    required ViewState answerResponseDataState,
  }) = _AkademikState;

  factory AkademikState.initial() => const AkademikState(
        akademikQustionsState: ViewState.initial(),
        akademikQustions: [],
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
