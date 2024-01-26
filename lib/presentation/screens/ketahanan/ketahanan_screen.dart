import 'package:auto_route/auto_route.dart';
import 'package:cat_akademik_kepolisian/common/constants/constants.dart';
import 'package:cat_akademik_kepolisian/di/injector.dart';
import 'package:cat_akademik_kepolisian/presentation/blocs/ketahanan/ketahanan_cubit.dart';
import 'package:cat_akademik_kepolisian/presentation/router/app_router.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/example_question_builder.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/horizontal_question_builder.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/screen_view_builder.dart';
import 'package:cat_akademik_kepolisian/presentation/widgets/vertical_question_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class KetahananScreen extends StatelessWidget {
  const KetahananScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inject<KetahananCubit>()..getKetahananQuestions(),
      child: Scaffold(
        body: BlocConsumer<KetahananCubit, KetahananState>(
          listener: (context, state) {
            state.ketahananQustionsState.maybeWhen(
              success: () {
                if (!state.isExampleDone) {
                  return showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (dContext) => ExampleQuestionBuilder(
                      question: state.exampleTest,
                      onTapDone: context.readKetahananCubit.finishExample,
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
            return state.ketahananQustionsState.maybeWhen(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              success: () => ScreenViewBuilder(
                verticalView: () => VerticalQuestionBuilder(
                  onSubmit: context.readKetahananCubit.submit,
                  questions: state.ketahananQustions,
                  questionLength: state.ketahananQustions.length,
                  currentQuestionIndex: state.questionShowingIndex,
                  onTapIndex: context.readKetahananCubit.toQuestion,
                  mutateAnswer: context.readKetahananCubit.mutateAnswer,
                  questionType: QuestionType.ketahanan,
                  title: state.title,
                ),
                horizontalView: () => HorizontalQuestionBuilder(
                  onSubmit: context.readKetahananCubit.submit,
                  questions: state.ketahananQustions,
                  questionLength: state.ketahananQustions.length,
                  currentQuestionIndex: state.questionShowingIndex,
                  onTapIndex: context.readKetahananCubit.toQuestion,
                  mutateAnswer: context.readKetahananCubit.mutateAnswer,
                  questionType: QuestionType.ketahanan,
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
