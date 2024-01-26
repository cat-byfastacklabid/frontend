import 'package:auto_route/auto_route.dart';
import 'package:cat_akademik_kepolisian/common/constants/constants.dart';
import 'package:cat_akademik_kepolisian/di/injector.dart';
import 'package:cat_akademik_kepolisian/presentation/blocs/akademik/akademik_cubit.dart';
import 'package:cat_akademik_kepolisian/presentation/router/app_router.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/example_question_builder.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/horizontal_question_builder.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/screen_view_builder.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/vertical_question_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AkademikScreen extends StatelessWidget {
  const AkademikScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inject<AkademikCubit>()..getAkademikQuestions(),
      child: Scaffold(
        body: BlocConsumer<AkademikCubit, AkademikState>(
          listener: (context, state) {
            state.akademikQustionsState.maybeWhen(
              success: () {
                if (!state.isExampleDone) {
                  return showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (dContext) => ExampleQuestionBuilder(
                      question: state.exampleTest,
                      onTapDone: context.readAkademikCubit.finishExample,
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
            return state.akademikQustionsState.maybeWhen(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              success: () => ScreenViewBuilder(
                verticalView: () => VerticalQuestionBuilder(
                  onSubmit: context.readAkademikCubit.submit,
                  questions: state.akademikQustions,
                  questionLength: state.akademikQustions.length,
                  currentQuestionIndex: state.questionShowingIndex,
                  onTapIndex: context.readAkademikCubit.toQuestion,
                  mutateAnswer: context.readAkademikCubit.mutateAnswer,
                  questionType: QuestionType.akademik,
                  title: state.title,
                ),
                horizontalView: () => HorizontalQuestionBuilder(
                  onSubmit: context.readAkademikCubit.submit,
                  questions: state.akademikQustions,
                  questionLength: state.akademikQustions.length,
                  currentQuestionIndex: state.questionShowingIndex,
                  onTapIndex: context.readAkademikCubit.toQuestion,
                  mutateAnswer: context.readAkademikCubit.mutateAnswer,
                  questionType: QuestionType.akademik,
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
