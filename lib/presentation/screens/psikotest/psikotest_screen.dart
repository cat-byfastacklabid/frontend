import 'package:auto_route/auto_route.dart';
import 'package:cat_akademik_kepolisian/common/constants/constants.dart';
import 'package:cat_akademik_kepolisian/di/injector.dart';
import 'package:cat_akademik_kepolisian/presentation/blocs/psikotest/psikotest_cubit.dart';
import 'package:cat_akademik_kepolisian/presentation/router/app_router.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/example_question_builder.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/horizontal_question_builder.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/screen_view_builder.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/vertical_question_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class PsikotestScreen extends StatelessWidget {
  const PsikotestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inject<PsikotestCubit>()..getPsikotestQuestions(),
      child: Scaffold(
        body: BlocConsumer<PsikotestCubit, PsikotestState>(
          listener: (context, state) {
            state.psikotestQustionsState.maybeWhen(
              success: () {
                if (!state.isExampleDone) {
                  return showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (dContext) => ExampleQuestionBuilder(
                      question: state.exampleTest,
                      onTapDone: context.readPsikotestCubit.finishExample,
                    ),
                  );
                }

                state.answerResponseDataState.maybeWhen(
                  success: () => context.router
                      .replace(ResultRoute(response: state.answerResponseData)),
                  orElse: () => const SizedBox.shrink(),
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
          builder: (context, state) {
            return state.psikotestQustionsState.maybeWhen(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              success: () => ScreenViewBuilder(
                verticalView: () => VerticalQuestionBuilder(
                  onSubmit: context.readPsikotestCubit.submit,
                  questions: state.psikotestQustions,
                  questionLength: state.psikotestQustions.length,
                  currentQuestionIndex: state.questionShowingIndex,
                  onTapIndex: context.readPsikotestCubit.toQuestion,
                  mutateAnswer: context.readPsikotestCubit.mutateAnswer,
                  questionType: QuestionType.psikotest,
                  title: state.title,
                ),
                horizontalView: () => HorizontalQuestionBuilder(
                  onSubmit: context.readPsikotestCubit.submit,
                  questions: state.psikotestQustions,
                  questionLength: state.psikotestQustions.length,
                  currentQuestionIndex: state.questionShowingIndex,
                  onTapIndex: context.readPsikotestCubit.toQuestion,
                  mutateAnswer: context.readPsikotestCubit.mutateAnswer,
                  questionType: QuestionType.psikotest,
                  title: state.title,
                ),
              ),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}
